package com.wide.baseproject.exam.controller;

import java.util.Date;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.ExamService;
import com.wide.common.model.Exam;
import com.wide.common.model.query.QueryExam;
import com.wide.viewmodel.DataTablesModel;

public class ExamController extends BaseController{
	private static final ExamService examService = Enhancer.enhance(ExamService.class);
	
	/**
	 * @author lubin
	 *  考试添加
	 * 
	 * */
	public void addExam(){
		render("examList.jsp");
	}
	
	/**
	 * @author lubin
	 * 考试列表
	 * */
	public void getExamlist(){
		QueryExam queryExam = new QueryExam();
		queryExam.setCode(getPara("code"));
		queryExam.setName(getPara("name"));
		DataTablesModel subjectpage = examService.getPageExam(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExam);
		this.renderJson(subjectpage);
	}
	/**
	 * @author lubin
	 * 考试添加详细
	 * 
	 * */
	public void addExamInfo(){
		String id = getPara("id");
		Exam exam = null;
		if(id!=null&&!id.equals("")){
			exam = Exam.dao.findById(id);
		}else{
			exam = new Exam();
		}
		setAttr("flagcg", getPara("flagcg"));
		setAttr("exam", exam);
		render("examInfo.jsp");
	}
	/**
	 * @author lubin
	 * 考试保存
	 * 
	 * */
	
	public void saveExam(){
		int flagcg=0;
		try{
			Exam exam = getModel(Exam.class)==null||getModel(Exam.class).equals("")?new Exam():getModel(Exam.class);
			if(exam.getId()!=null&&!exam.getId().equals("")){
				exam.setUpdateBy(getUser().getId());
				exam.setUpdateDate(new Date());
				exam.update();
			}else{
				
				exam.setId(createUUid());
				exam.setCode("1");
				exam.setCreatorId(getUser().getId());
				exam.setCreateDate(new Date());
				exam.setUpdateBy(getUser().getId());
				exam.setUpdateDate(new Date());
				exam.setIsdel(0);
				exam.save();
			}
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		redirect("/exam/addExamInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author lubin
	 * 考试删除
	 * */
	public void delExam(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_exam set isdel = 1 where id = ? ",id);
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
