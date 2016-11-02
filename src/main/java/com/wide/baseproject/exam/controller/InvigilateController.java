package com.wide.baseproject.exam.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wide.base.BaseController;
import com.wide.baseproject.exam.service.InvigilateService;
import com.wide.common.model.Exam;
import com.wide.common.model.Examinee;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QueryExaminee;
import com.wide.viewmodel.DataTablesModel;

public class InvigilateController  extends BaseController {

	private static final InvigilateService invigilateService = Enhancer.enhance(InvigilateService.class);
	
	/**
	 * @author cg
	 * 监考页面
	 * */
	public void add(){
		
		setAttr("username", getUser().getName());
		render("InvigilateList.jsp");
	}
	
	/**
	 * @author cg
	 * 监考页面
	 * */
	public void addmonitoringonline(){
		String examId=getPara("id");
		Exam ex = new Exam();
		ex = Exam.dao.findById(examId);
		List<Examinee> elist = new ArrayList<Examinee>();
		elist=Examinee.dao.find("select * from sys_examinee where isdel = 0 and isenable = 1 and exam_id = '"+examId+"'");
		setAttr("elist",elist);
		setAttr("examId",examId);
		setAttr("exam", ex);
		render("monitoringonline.jsp");
	}
	
	/**
	 * @author cg
	 * 监考图表
	 * */
	public void getTable(){
		QueryExam queryExam = new QueryExam();
		queryExam.setName(getPara("name"));
		queryExam.setStarttimes(getParaToDate("starttimes"));
		queryExam.setEndtimes(getParaToDate("endtimes"));
		DataTablesModel invigilatepage = invigilateService.getPageInvigilate(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExam,1);
		this.renderJson(invigilatepage);
		
	}
	
	/**
	 * @author cg
	 * 考生查询
	 * 
	 * */
	public void getEETable(){
		QueryExaminee queryExaminee = new QueryExaminee();
		queryExaminee.setName(getPara("name"));
		queryExaminee.setExamineeId(getPara("examineeId"));
		queryExaminee.setExamId(getPara("examId"));
		DataTablesModel invigilatepage = invigilateService.getPageExaminee(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExaminee);
		this.renderJson(invigilatepage);
	}
	
	/**
	 * @author cg
	 * 开始考试
	 * */
	public void gettoStart(){
		String id = getPara("id");
		if(id!=null&&!id.equals("")){
			Db.update("update sys_examinee set status = 1 where exam_id = '"+id+"'");
		}
		Exam exam = Exam.dao.findById(id);
		exam.setEnddistancetime(Integer.parseInt((exam.getDuration()*3600+"").split("[.]")[0]));
		exam.setStatus(1);
		exam.update();
		setAttr("message", exam.getDuration());
		renderJson();
	}
	
	/**
	 * @author cg
	 * 结束考试
	 * */
	@Before(Tx.class)
	public void gettofinish(){
		String id = getPara("id");
		try{
			invigilateService.gettofinish(id);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		setAttr("message", "考试结束");
		renderJson();
	}
	
	/**
	 * @author cg
	 * 考生下机
	 * */
	public void getgoDown(){
		String id = getPara("id");
		if(id!=null&&!id.equals("")){
			Db.update("update sys_examinee set status = 4 where id = '"+id+"'");
		}
		setAttr("message", "该考生已经下机");
		renderJson();
	}
	
	/**
	 * @author cg
	 * 考生指纹录入
	 * */
	public void getfingerprint(){
		String id = getPara("id");
		String fingerpath =getPara("fingerpath");
		if(id!=null&&!id.equals("")){
			invigilateService.getfingerprint(id,fingerpath);
		}
		setAttr("message", "该考生指纹录入");
		renderJson();
	}
	
	/**
	 * @author cg
	 * 考生头像上传
	 * */
	public void getSculpturepath(){
		String id = getPara("id");
		String sculpturepath =getPara("sculpturepath");
		if(id!=null&&!id.equals("")){
			Db.update("update sys_examinee set sculpturepath ='"+sculpturepath+"' where id ='"+id+"'");
		}
		setAttr("message", "该考生头像上传成功！");
		renderJson();
	}
	
	/**
	 * @author cg
	 * 考试剩余时间更新
	 * */
	public void getRemainingTime(){
		String id = getPara("id");
		int enddistancetime = getParaToInt("enddistancetime");
		if(id!=null&&!id.equals("")){
			Db.update("update sys_exam set enddistancetime ="+enddistancetime+" where id ='"+id+"'");
		}
		setAttr("message", "更新成功！");
		renderJson();
	}
	
	/**
	 * @author cg
	 * 考生缺考
	 * */
	public void gettoAbsent(){
		String id = getPara("id");
		if(id!=null&&!id.equals("")){
			Db.update("update sys_examinee set status = 3 where id = '"+id+"'");
		}
		setAttr("message", "该考生已经视为缺考");
		renderJson();
	}	
	
	/**
	 * @author cg
	 * 查询考生列表
	 * */
	public void getExamineeList(){
		String name=getPara("name");
		String examId=getPara("examId");
		List<Examinee> elist = new ArrayList<Examinee>();
		elist=Examinee.dao.find("select * from sys_examinee where name like %'"+name+"'% and exam_id ='"+examId+"'");
		renderJson(elist);
	}	

	/**
	 * @author cg
	 * 查询考生资格
	 * */
	public void getExaminee(){
		String examId=getPara("id");
		User user =getUser();
		List<Examinee> elist = new ArrayList<Examinee>();
		Examinee ee = new Examinee();
		Exam em = new Exam();
		em = Exam.dao.findById(examId);
		int flag = 0;
		elist=Examinee.dao.find("select * from sys_examinee where user_id = '"+user.getId()+"' and exam_id ='"+examId+"'");
		if(elist.size()>0){
			ee = elist.get(0);
			flag = ee.getStatus();
		}
		if(em.getStatus()<1){
			flag = 5;
		}
		setAttr("flag", flag);
		renderJson();
	}	
	
}
