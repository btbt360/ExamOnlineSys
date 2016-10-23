package com.wide.baseproject.exam.controller;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;
import com.wide.baseproject.exam.service.InvigilateService;
import com.wide.common.model.query.QueryCase;
import com.wide.common.model.query.QueryExam;
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
	 * 开始考试
	 * */
	public void gettoStart(){
		
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
				.intValue(), getParaToInt("rp").intValue(), queryExam);
		this.renderJson(invigilatepage);
		
	}
	
	/**
	 * @author cg
	 * 考生下机
	 * */
	public void getgoDown(){
		
	}
	
	/**
	 * @author cg
	 * 考生缺考
	 * */
	public void gettoAbsent(){
		
	}	
	
	/**
	 * @author cg
	 * 结束考试
	 * */
	public void gettofinish(){
		
	}
}
