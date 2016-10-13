package com.wide.baseproject.resource.controller;

import java.util.Date;

import com.jfinal.aop.Enhancer;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QuerySubject;
import com.wide.common.model.query.QueryUser;
import com.wide.viewmodel.DataTablesModel;

public class SubjectController extends BaseController{
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	
	/**
	 * @author cg
	 *  科目添加
	 * 
	 * */
	public void addsub(){
		render("subjectList.jsp");
	}
	
	/**
	 * @author cg
	 * 科目列表
	 * */
	public void getsublist(){
		QuerySubject querySubject = new QuerySubject();
		querySubject.setCode(getPara("code"));
		querySubject.setName(getPara("name"));
		DataTablesModel subjectpage = subjectService.getPageSubject(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), querySubject);
		this.renderJson(subjectpage);
	}
	/**
	 * @author cg
	 * 科目添加详细
	 * 
	 * */
	public void addsubinfo(){
		String id = getPara("id");
		Subject subject = null;
		if(id!=null&&!id.equals("")){
			subject = Subject.dao.findById(id);
		}else{
			subject = new Subject();
		}
		setAttr("subject", subject);
		render("subjectInfo.jsp");
	}
	/**
	 * @author cg
	 * 科目保存
	 * 
	 * */
	
	public void savesub(){
		returninfo = new RenturnInfo();
		try{
			Subject subject = getModel(Subject.class)==null||getModel(Subject.class).equals("")?new Subject():getModel(Subject.class);
			if(subject.getId()!=null&&!subject.getId().equals("")){
				subject.setUpdateBy(getUser().getId());
				subject.setUpdateDate(new Date());
				subject.update();
			}else{
				subject.setId(createUUid());
				subject.setCreatorId(getUser().getId());
				subject.setCreateDate(new Date());
				subject.setUpdateBy(getUser().getId());
				subject.setUpdateDate(new Date());
				subject.setIsdel(0);
				subject.save();
			}
			returninfo.setResult(0);
			returninfo.setResultInfo("保存成功！");
		}catch(Exception ex){
			ex.printStackTrace();
			returninfo.setResult(1);
			returninfo.setResultInfo("保存失败！");
		}
		setAttr("returninfo", returninfo);
		render("subjectInfo.jsp");
	}
	/**
	 * @author cg
	 * 科目删除
	 * */
	public void delsub(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_subject set isdel = 1 where id = ? ",id);
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
