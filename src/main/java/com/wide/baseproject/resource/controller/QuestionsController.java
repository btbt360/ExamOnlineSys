package com.wide.baseproject.resource.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.resource.service.CaseService;
import com.wide.baseproject.resource.service.QuestionsService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.common.model.Dict;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.Questions;
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
		String id = getPara("id");
		Questions question = Questions.dao.findById(id!=null&&!id.equals("")?id:"");
		String questiontypename= "";
		List<Questionoptions> questionoptionslist  =new ArrayList<Questionoptions>();
		if(question!=null&&!question.equals("")){
			questiontypename = Dict.dao.getDictByKeyType(question.getQuestiontype()+"", "1002");
			questionoptionslist= questionsService.getQuestionoptionsByQuestionId(id);
		}
		setAttr("questiontypename",questiontypename);
		setAttr("question",question);
		setAttr("subjectlist",subjectlist);
		setAttr("questionoptionslist",questionoptionslist);
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
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_questions set isdel = 1 where id = ? ",id);
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
