package com.wide.baseproject.resource.controller;

import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.resource.service.CaseService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.baseproject.resource.service.TextbookService;
import com.wide.common.model.Cases;
import com.wide.common.model.Subject;
import com.wide.common.model.Textbook;
import com.wide.common.model.query.QueryCase;
import com.wide.common.model.query.QuerySubject;
import com.wide.viewmodel.DataTablesModel;

public class TextbookController extends BaseController{
	
	private static final TextbookService textbookService = Enhancer.enhance(TextbookService.class);
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	

	/**
	 * @author cg
	 * 进入教材类型
	 * */
	public void add(){
		QuerySubject querySubject = new QuerySubject();
		List<Subject> subjectlist = subjectService.getSubjecyListAll(querySubject);
		setAttr("subjectlist", subjectlist);
		render("textbookList.jsp");
		
	}
	
	/**
	 * @author cg
	 * 查询教材类型
	 * */
	public void find(){
		QueryCase queryCase = new QueryCase();
		queryCase.setCasetitle(getPara("code"));
		queryCase.setName(getPara("name"));
		DataTablesModel casepage = textbookService.getPageCase(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryCase);
		this.renderJson(casepage);
		
	}
	
	/**
	 * @author cg
	 * 保存教材类型
	 * */
	public void addinfo(){
		String id = getPara("id");
		Textbook textbook = null;
		QuerySubject querySubject = new QuerySubject();
		List<Subject> subjectlist = subjectService.getSubjecyListAll(querySubject);
		Subject subject = new Subject();
		String subjectname = "";
		if(id!=null&&!id.equals("")){
			textbook = Textbook.dao.findById(id);
			subject = Subject.dao.findById(textbook.getSubjectId());
			subjectname = subject.getName();
		}else{
			textbook = new Textbook();
		}
		setAttr("flagcg", getPara("flagcg"));
		setAttr("textbook", textbook);
		setAttr("subjectname", subjectname);
		setAttr("subjectlist", subjectlist);
		render("textbookInfo.jsp");
		
	}
	
	/**
	 * @author cg
	 * 提交案例
	 * 
	 * */
	public void save(){
		int flagcg=0;
		try{
			Textbook textbook = getModel(Textbook.class)==null||getModel(Textbook.class).equals("")?new Textbook():getModel(Textbook.class);
			if(StrKit.notBlank(textbook.getId())){
				textbook.setUpdateBy(getUser().getId());
				textbook.setUpdateDate(new Date());
				textbook.update();
			}else{
				textbook.setId(createUUid());
				textbook.setCreatorId(getUser().getId());
				textbook.setCreateDate(new Date());
				textbook.setUpdateBy(getUser().getId());
				textbook.setUpdateDate(new Date());
				textbook.setIsdel(0);
				textbook.save();
			}
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		redirect("/textbook/addinfo?flagcg="+flagcg, true);
	}
	/**
	 * @author cg
	 * 删除教材类型
	 * */
	public void del(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_textbook set isdel = 1 where id = ? ",id);
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
