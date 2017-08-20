package com.wide.baseproject.train.controller;

import java.util.Date;

import com.jfinal.aop.Enhancer;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.train.service.CurriculumService;
import com.wide.common.model.Curriculum;
import com.wide.common.model.query.QueryCurriculum;
import com.wide.viewmodel.DataTablesModel;
//课程设计类
public class CurriculumController extends BaseController{

	private static final CurriculumService curriculumService = Enhancer.enhance(CurriculumService.class);
	
	/**
	 * @author cg
	 * 进入课程设计
	 * */
	public void addCurriculum(){
		
		render("curriculumList.jsp");
	}
	
	/**
	 * @author cg
	 * 查询课程设计
	 * */
	public void findCurriculum(){
		QueryCurriculum queryCurriculum = new QueryCurriculum();
		queryCurriculum.setCoursename(getPara("coursename"));
		queryCurriculum.setCoursetitle(getPara("coursetitle"));
		DataTablesModel curriculumpage = curriculumService.getPageCase(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryCurriculum);
		this.renderJson(curriculumpage);
	}
	/**
	 * @author cg
	 * 保存课程设计
	 * */
	public void saveCurriculum(){
		int flagcg=0;
		try{
		Curriculum curriculum = getModel(Curriculum.class);
		if(StrKit.notNull(curriculum)){
			if(StrKit.notBlank(curriculum.getId())){
				curriculum.setUpdateBy(getUser().getId());
				curriculum.setUpdateDate(new Date());
				curriculum.update();
			}else{
				curriculum.setId(createUUid());
				curriculum.setCreatorId(getUser().getId());
				curriculum.setCreateDate(new Date());
				curriculum.setUpdateBy(getUser().getId());
				curriculum.setUpdateDate(new Date());
				curriculum.save();
			}
		}
		flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		redirect("/curriculum/addCurriculumInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author cg
	 * 查询课程设计详细
	 * */
	public void addCurriculumInfo(){
		String id = getPara("id");
		Curriculum curriculum = null;
		if(StrKit.notBlank(id)){
			curriculum = curriculum.dao.findById(id);
		}else{
			curriculum = new Curriculum();
		}
		setAttr("flagcg",getPara("flagcg"));
		setAttr("curriculum", curriculum);
		render("curriculumInfo.jsp");
	}
	/**
	 * @author cg
	 * 删除课程设计
	 * */
	public void delCurriculum(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_curriculum set isdel = 1 where id = ? ",id);
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
