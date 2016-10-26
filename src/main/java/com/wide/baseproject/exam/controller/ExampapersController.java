package com.wide.baseproject.exam.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.ExampapersService;
import com.wide.baseproject.resource.service.QuestionsService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.common.model.Dict;
import com.wide.common.model.Exampapers;
import com.wide.common.model.ExampapersQtypes;
import com.wide.common.model.Itembank;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExampapers;
import com.wide.common.model.query.QueryQuestion;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;

public class ExampapersController extends BaseController {
	private static final QuestionsService questionsService = Enhancer.enhance(QuestionsService.class);
	private static final ExampapersService exampapersService = Enhancer.enhance(ExampapersService.class);
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	
	
	/**
	 * @author cg
	 * 进入试卷
	 * */
	public void add(){
		render("exampapersList.jsp");
	}
	
	/**
	 * @author cg
	 * 查询试卷
	 * */
	public void find(){
		QueryExampapers queryExampapers = new QueryExampapers();
		queryExampapers.setCode(getPara("code"));
		queryExampapers.setName(getPara("name"));
		queryExampapers.setCreatetimes(getParaToDate("createtimes"));
		queryExampapers.setCreatetimee(getParaToDate("createtimee"));
		DataTablesModel exampaperspage = exampapersService.getPageExampapers(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExampapers);
		this.renderJson(exampaperspage);
		
	}
	
	/**
	 * @author cg
	 * 保存试卷
	 * */
	public void addinfo(){
		String id = getPara("id");
		Exampapers exampapers = null;
		List<ExampapersQtypes> questiontypelist = new ArrayList<ExampapersQtypes>();
		if(id!=null&&!id.equals("")){
			exampapers = Exampapers.dao.findById(id);
			questiontypelist=ExampapersQtypes.dao.findByExampapersId(id);
		}else{
			exampapers = new Exampapers();
		}
		setAttr("flagcg", getPara("flagcg"));
		List<Dict> dictlist = Dict.dao.getDictByType("1002");
		setAttr("dictlist", dictlist);
		setAttr("exampapers", exampapers);
		setAttr("numcount",questiontypelist!=null&&!questiontypelist.equals("")?questiontypelist.size():0);
		setAttr("questiontypelist", questiontypelist);
		render("exampapersInfo.jsp");
		
	}
	
	/**
	 * @author cg
	 * 提交试卷
	 * 
	 * */
	@Before(Tx.class)
	public void save(){
		int flagcg=0;
		try{
			List<ExampapersQtypes> eqlist = new ArrayList<ExampapersQtypes>();
			int flag=0;
			Exampapers exampapers = getModel(Exampapers.class)==null||getModel(Exampapers.class).equals("")?new Exampapers():getModel(Exampapers.class);
			if(exampapers.getId()!=null&&!exampapers.getId().equals("")){
				exampapers.setUpdateBy(getUser().getId());
				exampapers.setUpdateDate(new Date());
			}else{
				exampapers.setId(createUUid());
				exampapers.setCreatorId(getUser().getId());
				exampapers.setCreateDate(new Date());
				exampapers.setUpdateBy(getUser().getId());
				exampapers.setUpdateDate(new Date());
				exampapers.setIsdel(0);
				flag = 1;
			}
				int numcount = getParaToInt("numcount");
				if(numcount>0){
					for(int i = 0 ;i<numcount+1;i++){
						if(getPara("questiontype"+i)!=null&&!getPara("questiontype"+i).equals("")&&getPara("sumscore"+i)!=null&&!getPara("sumscore"+i).equals("")&&getPara("sumquestion"+i)!=null&&!getPara("sumquestion"+i).equals("")){
							
							ExampapersQtypes eq = new ExampapersQtypes();
							eq.setId(createUUid());
							eq.setExampapersId(exampapers.getId());
							eq.setTypeId(Integer.parseInt(getPara("questiontype"+i)));
							eq.setTypename(Dict.dao.getDictByKeyType(getPara("questiontype"+i),"1002"));
							eq.setSumscores(Integer.parseInt(getPara("sumscore"+i)));
							eq.setSumtotal(Integer.parseInt(getPara("sumquestion"+i)));
							eqlist.add(eq);
						}
					}
				}
				exampapersService.saveOrUpdateExampapers(exampapers,eqlist,flag);
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		redirect("/exampapers/addinfo?flagcg="+flagcg, true);
	}
	/**
	 * @author cg
	 * 删除试卷
	 * */
	public void del(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_exampapers set isdel = 1 where id = ? ",id);
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
	 * 进入选择试题
	 * 
	 * */
	public void addExampapersChoose(){
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		List<Subject> subjectlist = subjectService.getSubjecyListAll();
		List<Dict> dictlist = Dict.dao.getDictByType("1002");
		setAttr("subjectlist", subjectlist);
		setAttr("dictlist", dictlist);
		setAttr("exampaperslist", exampaperslist);
		render("exampapersChoose.jsp");
	}
	/**
	 * @author cg
	 *  查询试题
	 * 
	 * */
	public void finaQuestionsChoose(){
		QueryQuestion question = new QueryQuestion();
		question.setItembankids(getPara("itembankid"));
		question.setQuestionstype(getPara("questiontypeid"));
		question.setSubjectid(getPara("subjectid"));
		question.setExampapersid(getPara("exampapersid"));
		DataTablesModel questiontpage = questionsService.getPageQuestion(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), question,1);
		this.renderJson(questiontpage);
	}
	/**
	 * @author cg
	 * 根据科目编码和试题类型查询题库
	 * */
	public void getItembankBySubQtid(){
		String questiontypeid = getPara("questiontypeid");
		String subjectid = getPara("subjectid");
		List<Itembank> list = new ArrayList<Itembank>();
		if(!TypeChecker.isEmpty(questiontypeid)&&!TypeChecker.isEmpty(subjectid)){
			list = Itembank.dao.find("select * from sys_itembank t where t.isenable = 1 and t.isdel = 0 and questiontype = ? and subject_id = ?",questiontypeid,subjectid);
		}
		renderJson(list);
	}
	
}
