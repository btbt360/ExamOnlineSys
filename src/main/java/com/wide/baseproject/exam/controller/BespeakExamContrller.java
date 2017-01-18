package com.wide.baseproject.exam.controller;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;
import com.wide.baseproject.exam.service.BespeakExamService;
import com.wide.common.model.query.QueryBespeak;
import com.wide.viewmodel.DataTablesModel;

/**
 * @author cg
 * 预约考试
 * */
public class BespeakExamContrller extends BaseController {

	private static BespeakExamService bespeakExamService = Enhancer.enhance(BespeakExamService.class);
	
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
	 * 考试管理--考试预约
	 * 
	 * */
	public void getbespeak(){
		QueryBespeak qb = new QueryBespeak();
		qb.setStarttime(getPara("startime"));
		qb.setEndtime(getPara("endtime"));
		qb.setNum(getParaToInt("num"));
		qb.setBetype(getParaToInt("betype"));
		DataTablesModel bespeakpage = bespeakExamService.getPageBespeak(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), qb);
		renderJson(bespeakpage);
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
		int oldtype = getParaToInt("oldtype");
		if(oldtype==1){
			//正在预约考试查询
		}else if(oldtype ==2){
			//结束预约考试查询
		}
		render("querybespeak.jsp");
	}
	/**
	 * @author cg
	 * 考生考试日程预约
	 * 
	 * */
	public void addusersubscribe(){
		
		render("usersubscribe.jsp");
	}
	/**
	 * @author cg
	 * 我的预约
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

}
