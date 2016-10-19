package com.wide.baseproject.resource.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;
import com.wide.baseproject.resource.service.CaseService;
import com.wide.baseproject.resource.service.QuestionsService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.common.model.Dict;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryQuestion;
import com.wide.common.model.query.QuerySubject;
import com.wide.viewmodel.DataTablesModel;

public class QuestionsController extends BaseController{
	
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	private static final CaseService caseService = Enhancer.enhance(CaseService.class);
	private static final QuestionsService questionsService = Enhancer.enhance(QuestionsService.class);
	
	/**
	 * @author cg
	 * 进入试题管理
	 * */
	public void add(){
		List<Dict> dictlist = new ArrayList<Dict>();
		dictlist = Dict.dao.getDictByType("1002");
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		setAttr("dictlist", dictlist);
		setAttr("subjectlist",subjectlist);
		render("questionList.jsp");
		
	}
	
	/**
	 * @author cg
	 * 查询试题管理
	 * */
	public void find(){
		QueryQuestion question = new QueryQuestion();
		question.setCode(getPara("code"));
		question.setItembankid(getPara("itembankid"));
		question.setQuestionstype(getPara("questionstype"));
		question.setSubjectid(getPara("subjectid"));
		DataTablesModel questiontpage = questionsService.getPageQuestion(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), question);
		this.renderJson(questiontpage);
		
	}
	
	
	/**
	 * @author cg
	 * 添加试题信息
	 * */
	public void addinfo(){
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		setAttr("subjectlist",subjectlist);
		render("questionInfo.jsp");
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
