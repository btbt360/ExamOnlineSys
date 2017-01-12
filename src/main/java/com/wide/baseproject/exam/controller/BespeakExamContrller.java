package com.wide.baseproject.exam.controller;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;

/**
 * @author cg
 * 预约考试
 * */
public class BespeakExamContrller extends BaseController {

	private static BespeakExamContrller bespeakExamContrller = Enhancer.enhance(BespeakExamContrller.class);
	
	/**
	 * @author cg
	 * 考试管理--考试预约
	 * 
	 * */
	public void add(){
		
		render("bespeaklist.jsp");
	}
	
	/**
	 * @author cg
	 * 新建预约考试
	 * 
	 * */
	public void addbespeak(){
		
		render("bespeakinfo.jsp");
	}
	
	/**
	 * @author cg
	 * 保存预约考试
	 * 
	 * */
	public void savebespeak(){
		
		redirect("/bespeak/add?message=success", true);
	}
	
	/**
	 * @author cg
	 * 预约考试发布
	 * 
	 * */
	public void releasebespeak(){
		
		renderJson();
	}
	/**
	 * @author cg
	 * 预约考试删除
	 * 
	 * */
	public void deletebespeak(){
		
		renderJson();
	}
	/**
	 * @author cg
	 * 预约考试查询
	 * 
	 * */
	public void addquerybespeak(){
		
		render("querybespeak.jsp");
	}
	
	/**
	 * @author cg
	 * 考生日程预约考试
	 * 
	 * */
	public void addschedulebespeak(){
		
		render("schedulebespeak.jsp");
	}
	/**
	 * @author cg
	 * 考生列表预约考试
	 * 
	 * */
	public void addsubscribelist(){
		
		render("subscribelist.jsp");
	}

	/**
	 * @author cg
	 * 考生添加预约考试
	 * 
	 * */
	public void savebespeakinfo(){
		String flag = getPara("flag");
		if(flag.equals("1")){
			redirect("/bespeak/addschedulebespeak?message=success", true);			
		}else{
			redirect("/bespeak/addsubscribelist?message=success", true);
		}
	}
	/**
	 * @author cg
	 * 考生取消预约考试
	 * 
	 * */
	public void cancelbespeak(){
		String flag = getPara("flag");//1为日程展示 2为列表展示
		if(flag.equals("1")){
			redirect("/bespeak/addschedulebespeak?message=success", true);			
		}else{
			renderJson();
		}
	}
	/**
	 * @author cg
	 * 考生预约考试查询
	 * 
	 * */
	public void queryexamineebespeak(){
		
		render("examineebespeak.jsp");
	}
}
