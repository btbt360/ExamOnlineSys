package com.wide.baseproject.exam.controller;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.wide.base.BaseController;
import com.wide.baseproject.exam.service.ErrorSubjectService;
import com.wide.common.model.Dict;
import com.wide.common.model.query.QueryError;
import com.wide.common.model.query.QueryQuestion;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;
import com.wide.common.model.Error;

public class ErrorSubjectController extends BaseController {
	private static final ErrorSubjectService errorSubjectService = Enhancer.enhance(ErrorSubjectService.class);
	
	/**
	 * @author cg
	 * 进入我的错题
	 * 
	 * */
	public void adderror(){
		List<Dict> dictlist = new ArrayList<Dict>();
		dictlist = Dict.dao.getDictByType("1002");
		setAttr("dictlist", dictlist);
		render("myError.jsp");
	}
	/**
	 * @author cg
	 * 查询错题
	 * 
	 * */
	public void getErrorList(){
		QueryError qe = new QueryError();
		qe.setQuestiontype(getPara("questiontype"));
		DataTablesModel errorpage = errorSubjectService.getPageError(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), qe);
		this.renderJson(errorpage);
	}
	/**
	 * @author cg
	 * 移除错题
	 * 
	 * */
	public void removenError(){
		String errorid = getPara("errorid");
		try{
			if(!TypeChecker.isEmpty(errorid)){
				Error.dao.deleteById(errorid);
			}
			setAttr("message", "移除成功！");
		}catch(Exception e){
			setAttr("message", "移除失败！");
			e.printStackTrace();
		}
		renderJson();
	}
	
	/**
	 * @author cg
	 * 错题练习
	 * 
	 * */
	public void errorpritics(){
		List<Error> listerror = new ArrayList<Error>();
		listerror = Error.dao.find("select * from sys_error where user_id = ? and isdel=0 and isenable = 1 ",getUser().getId());
		setAttr("count", listerror.size());
		render("myErrorMain.jsp");
	}
	
	/**
	 * @author cg
	 * 错题开始练习
	 * 
	 * */
	public void errorStart(){
		
		render("myErrorStart.jsp");
	}
}
