package com.wide.baseproject.resource.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.resource.service.ItemBankService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.baseproject.sys.service.DictService;
import com.wide.common.model.Dict;
import com.wide.common.model.Itembank;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryItemBank;
import com.wide.viewmodel.DataTablesModel;

public class ItemBankController extends BaseController{
	private static final ItemBankService itembankService = Enhancer.enhance(ItemBankService.class);
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	private static final DictService dictService = Enhancer.enhance(DictService.class);
	/**
	 * @author cg
	 * 进入题库
	 * */
	public void add(){
		List<Subject> subjectlist = subjectService.getSubjecyListAll();
		List<Dict> dictlist = Dict.dao.getDictByType("1002");
		setAttr("subjectlist", subjectlist);
		setAttr("dictlist", dictlist);
		render("itembankList.jsp");
	}
	
	/**
	 * @author cg
	 * 查询题库
	 * */
	public void find(){
		QueryItemBank queryitembank = new QueryItemBank();
		queryitembank.setName(getPara("name"));
		queryitembank.setQuestionType(getParaToInt("questiontype"));
		queryitembank.setSubjectid(getPara("subjectid"));
		DataTablesModel itembank = itembankService.getPageItemBank(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryitembank);
		this.renderJson(itembank);
		
	}
	
	/**
	 * @author cg
	 * 题库基本信息
	 * 
	 * */
	public void addinfo(){
		String id = getPara("id");
		Itembank itembank = null;
		List<Subject> subjectlist = subjectService.getSubjecyListAll();
		if(id!=null&&!id.equals("")){
			itembank = Itembank.dao.findById(id);
		}else{
			itembank = new Itembank();
		}
		List<Dict> dictlist = Dict.dao.getDictByType("1002");
		setAttr("itembank", itembank);
		setAttr("flagcg", getPara("flagcg"));
		setAttr("subjectlist", subjectlist);
		setAttr("dictlist", dictlist);
		render("itembankInfo.jsp");
	}
	
	/**
	 * @author cg
	 * 提交题库
	 * */
	public void save(){
		int flagcg=0;
		try{
			Itembank itembank = getModel(Itembank.class)==null||getModel(Itembank.class).equals("")?new Itembank():getModel(Itembank.class);
			if(itembank.getId()!=null&&!itembank.getId().equals("")){
				itembank.setUpdateBy(getUser().getId());
				itembank.setUpdateDate(new Date());
				itembank.update();
			}else{
				itembank.setId(createUUid());
				itembank.setCreatorId(getUser().getId());
				itembank.setCreateDate(new Date());
				itembank.setUpdateBy(getUser().getId());
				itembank.setUpdateDate(new Date());
				itembank.setIsdel(0);
				itembank.save();
			}
			flagcg =1;
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		redirect("/item/addinfo?flagcg="+flagcg, true);
		
	}
	
	/**
	 * @author cg
	 * 删除题库
	 * */
	public void del(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_itembank set isdel = 1 where id = ? ",id);
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
	/**
	 * @author cg
	 * 导入题库
	 * 
	 * */
	public void importExcel(){
		returninfo = new RenturnInfo();
		
		renderJson();
	}
	/**
	 * @author cg
	 * 二级联动查询题库
	 * */
	public void getSelectSubject(){
		String subjectid= getPara("id");
		List<Itembank> list  = new ArrayList<Itembank>();
		list= ItemBankService.getItembankBySubjectId(subjectid);
		renderJson(list);
	}
	/**
	 * @author cg
	 * 根据题库编码查询试题类型
	 * */
	public void getQuestionTypeByItemBankId(){
		String itemBankId= getPara("id");
		Itembank itembank=Itembank.dao.findById(itemBankId);
		Dict questiontype = Dict.dao.getDictObjBykeyType(itembank!=null&&!itembank.equals("")?itembank.getQuestiontype()+"":"", "1002");
		setAttr("questiontype", questiontype);
		renderJson();
	}

}
