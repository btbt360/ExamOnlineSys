package com.wide.baseproject.resource.controller;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;
import com.wide.baseproject.resource.service.CaseService;
import com.wide.baseproject.resource.service.QuestionsService;
import com.wide.baseproject.resource.service.SubjectService;

public class QuestionsController extends BaseController{
	
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	private static final CaseService caseService = Enhancer.enhance(CaseService.class);
	private static final QuestionsService questionsService = Enhancer.enhance(QuestionsService.class);
	
	/**
	 * @author cg
	 * 进入试题管理
	 * */
	public void add(){
		
		render("questionList.jsp");
		
	}
	
	/**
	 * @author cg
	 * 查询试题管理
	 * */
	public void find(){
		
		
	}
	
	/**
	 * @author cg
	 * 添加试题信息
	 * */
	public void addinfo(){
		
		
	}
	
	/**
	 * @author cg
	 * 保存试题管理
	 * */
	public void save(){
		
		
	}
	
	/**
	 * @author cg
	 * 删除试题管理
	 * */
	public void del(){
		
		
		
	}
}
