package com.wide.baseproject.statistics.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.ExamService;
import com.wide.common.model.Exam;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Examinee;
import com.wide.common.model.Exampapers;
import com.wide.common.model.ExampapersQuestion;
import com.wide.common.model.Office;
import com.wide.common.model.Questions;
import com.wide.common.model.Subject;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryExam;
import com.wide.util.DateUtil;
import com.wide.viewmodel.DataTablesModel;

public class StatisticsController extends BaseController{
	private static final ExamService examService = Enhancer.enhance(ExamService.class);
	
	/**
	 * @author lubin
	 *  考生成绩统计
	 * 
	 * */
	public void examineeCount(){
		render("examineeCount.jsp");
	}
	

	/**
	 * @author lubin
	 *  考试按部门统计
	 * 
	 * */
	public void dapartmentCount(){
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		
		setAttr("exampaperslist", exampaperslist);
		render("dapartmentCount.jsp");
	}
	
	/**
	 * @author lubin
	 *  考试按岗位统计
	 * 
	 * */
	public void postCount(){
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		
		setAttr("exampaperslist", exampaperslist);
		render("postCount.jsp");
	}
	
	
	/**
	 * @author lubin
	 *  按错误率统计
	 * 
	 * */
	public void errorrateCount(){
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		
		setAttr("exampaperslist", exampaperslist);
		render("errorrateCount.jsp");
	}
	
	

	/**
	 * @author lubin
	 *  考试统计
	 * 
	 * */
	public void examCount(){
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		
		setAttr("exampaperslist", exampaperslist);
		render("examCount.jsp");
	}
	
	
}
