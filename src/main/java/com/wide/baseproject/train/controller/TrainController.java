package com.wide.baseproject.train.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.train.service.TrainService;
import com.wide.common.model.Curriculum;
import com.wide.common.model.Train;
import com.wide.common.model.User;
import com.wide.common.model.UserTrain;
import com.wide.common.model.query.QueryTrain;
import com.wide.viewmodel.DataTablesModel;
//培训类
public class TrainController extends BaseController{
	private static final TrainService trainService = Enhancer.enhance(TrainService.class);
	/**
	 * @author cg
	 * 进入培训
	 * */
	public void addTrain(){
		List<Curriculum> curriculumlist = new ArrayList<Curriculum>();
		curriculumlist = Curriculum.dao.find("select * from sys_curriculum where isenable = 1 and isdel = 0 ");
		setAttr("curriculumlist", curriculumlist);
		render("trainList.jsp");
	}
	
	/**
	 * @author cg
	 * 查询培训
	 * */
	public void findTrain(){
		QueryTrain querytrain = new QueryTrain();
		querytrain.setCurriculumid(getPara("curriculumid"));
		querytrain.setStarttime(getPara("starttime"));
		querytrain.setEndtime(getPara("endtime"));
		DataTablesModel trainpage = trainService.getPageCase(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), querytrain);
		this.renderJson(trainpage);
	}
	/**
	 * @author cg
	 * 保存培训
	 * */
	public void saveTrain(){
		int flagcg=0;
		try{
			String userids = getPara("userids");
			Train train = getModel(Train.class);
			if(StrKit.notNull(train)){
				if(StrKit.notBlank(train.getId())){
					train.setUpdateBy(getUser().getId());
					train.setUpdateDate(new Date());
					Db.update("delete from sys_user_train where train_id = ?",train.getId());
					String[] useridstr =userids.split("[|]"); 
					for(String userid:useridstr){
						UserTrain userTrain = new UserTrain();
						userTrain.setTrainId(train.getId());
						userTrain.setUserId(userid);
						userTrain.save();
					}
					train.update();
				}else{
					train.setId(createUUid());
					train.setCreateDate(new Date());
					train.setCreatorId(getUser().getId());
					train.setUpdateBy(getUser().getId());
					train.setUpdateDate(new Date());
					train.setIsdel(0);
					train.save();
					String[] useridstr =userids.split("[|]"); 
					for(String userid:useridstr){
						UserTrain userTrain = new UserTrain();
						userTrain.setTrainId(train.getId());
						userTrain.setUserId(userid);
						userTrain.save();
					}
				}
			}
		flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		redirect("/train/addTrainInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author cg
	 * 查询培训详细
	 * */
	public void addTrainInfo(){
		String id = getPara("id");
		Train train = null;
		if(StrKit.notBlank(id)){
			train = train.dao.findById(id);
		}else{
			train = new Train();
		}
		String usernamesview = "";
		String userids ="";
		List<User> userlist = new ArrayList<User>();
		userlist = User.dao.find("select t1.* from sys_user t1,sys_user_train t2 where t2.train_id = ? and t2.user_id = t1.id ",id);
		if(userlist.size()>0){
			for(User user:userlist){
				usernamesview += user.getName() +"|";
				userids += user.getId() + "|";
			}
		}
		List<Curriculum> curriculumlist = new ArrayList<Curriculum>();
		curriculumlist = Curriculum.dao.find("select * from sys_curriculum where isenable = 1 and isdel = 0 ");
		setAttr("curriculumlist", curriculumlist);
		setAttr("flagcg",getPara("flagcg"));
		setAttr("train", train);
		setAttr("usernamesview", usernamesview);
		setAttr("userids", userids);
		render("trainInfo.jsp");
	}
	/**
	 * @author cg
	 * 删除培训
	 * */
	public void delTrain(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_train set isdel = 1 where id = ? ",id);
			}
			returninfo.setResult(0);
			returninfo.setResultInfo("删除成功！");
		}catch(Exception ex){
			ex.printStackTrace();
			returninfo.setResult(1);
			returninfo.setResultInfo("删除失败！");
		}
		setAttr("returninfo", returninfo);
		renderJson();
	}
}
