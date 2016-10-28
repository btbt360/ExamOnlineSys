package com.wide.baseproject.exam.controller;

import java.util.Date;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.InvigilateService;
import com.wide.common.model.Exam;
import com.wide.common.model.query.QueryExam;
import com.wide.viewmodel.DataTablesModel;

public class ExamineeController extends BaseController {
	private static final InvigilateService invigilateService = Enhancer.enhance(InvigilateService.class);

	/**
	 * @author cg
	 *  参加考试
	 * 
	 * */
	public void addJoinExam(){
		render("joinExamList.jsp");
	}
	
	/**
	 * @author cg
	 * 考试列表
	 * 考生 0
	 * */
	public void getJoinExamlist(){
		QueryExam queryExam = new QueryExam();
		queryExam.setName(getPara("name"));
		queryExam.setStarttimes(getParaToDate("starttimes"));
		queryExam.setEndtimes(getParaToDate("endtimes"));
		DataTablesModel invigilatepage = invigilateService.getPageInvigilate(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExam,0);
		this.renderJson(invigilatepage);
	}
	
	

}
