package com.wide.baseproject.statistics.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.aop.Enhancer;
import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.ExamService;
import com.wide.baseproject.statistics.service.StatisticsService;
import com.wide.common.model.Dict;
import com.wide.common.model.Exam;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Examinee;
import com.wide.common.model.Exampapers;
import com.wide.common.model.ExampapersQuestion;
import com.wide.common.model.Office;
import com.wide.common.model.Questions;
import com.wide.common.model.Subject;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryCase;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QueryStatistics;
import com.wide.common.model.query.QueryUser;
import com.wide.constant.EnumFuncType;
import com.wide.constant.EnumOptType;
import com.wide.util.DateUtil;
import com.wide.util.ExportController;
import com.wide.viewmodel.DataTablesModel;
import com.wide.viewmodel.ViewChartData;

public class StatisticsController extends BaseController{
	private static final ExamService examService = Enhancer.enhance(ExamService.class);
	private static final StatisticsService statisticsService = Enhancer.enhance(StatisticsService.class);

	
	/**
	 * @author lubin
	 *  考生成绩统计
	 * 
	 * */
	public void examineeCount(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("examineeCount.jsp");
	}
	public void getExamineeCount(){
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttimes"));
		queryStatistics.setEndtime(getPara("endtimes"));
		DataTablesModel casepage = statisticsService.getPageExamExamineeCount(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryStatistics);
		this.renderJson(casepage);
	}
	/**
	 * @author cg
	 * @deprecated 考试统计导出
	 * */
	public void exportExam() {		
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttimes"));
		queryStatistics.setEndtime(getPara("endtimes"));
		List<Object[]> casepage = statisticsService.exportPageExamExamineeCount(Integer.MAX_VALUE, Integer.MAX_VALUE, queryStatistics);
		String[] heades = { "考试编码", "	考试名称", "考试总人数", "考试不合格人数", "考试合格人数", "考试优秀人数" };
		ExportController.exportXLSRecord(casepage, "考试统计", heades,
				"1", this.getResponse());
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("examineeCount.jsp");
		return;
	}
	
	
	/**
	 * @author cg
	 * 考生成绩统计图表数据
	 * */
	public void examineeChartDatas(){
		String starttimes = getPara("starttimes");
		String endtimes = getPara("endtimes");
		String examid = getPara("examid");
		List<ViewChartData> list = new ArrayList<ViewChartData>();
		list = statisticsService.examineeChartDatas(starttimes,endtimes,examid);
		renderJson(list);
	}

	/**
	 * @author lubin
	 *  考试按部门统计
	 * 
	 * */
	public void dapartmentCount(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("dapartmentCount.jsp");
	}
	
	/**
	 * @author cg
	 * 考试按部门图表数据
	 * */
	public void dapartmentChartDatas(){
		String starttimes = getPara("starttimes");
		String endtimes = getPara("endtimes");
		String examid = getPara("examid");
		List<ViewChartData> list = new ArrayList<ViewChartData>();
		list = statisticsService.dapartmentChartDatas(starttimes,endtimes,examid);
		renderJson(list);
	}
	
	/**
	 * @author lubin
	 *  考试按岗位统计
	 * 
	 * */
	public void postCount(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("postCount.jsp");
	}
	
	/**
	 * @author cg
	 * 考试按岗位图表数据
	 * */
	public void postChartDatas(){
		String starttimes = getPara("starttimes");
		String endtimes = getPara("endtimes");
		String examid = getPara("examid");
		List<ViewChartData> list = new ArrayList<ViewChartData>();
		list = statisticsService.postChartDatas(starttimes,endtimes,examid);
		renderJson(list);
	}
	
	/**
	 * @author lubin
	 *  按错误率统计
	 * 
	 * */
	public void errorrateCount(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("errorrateCount.jsp");
	}
	
	public void errorrateCountfind(){
		QueryStatistics queryStatistics = new QueryStatistics();
		String examid = getPara("examid");
		queryStatistics.setExamid(examid);
		DataTablesModel casepage = statisticsService.getPageErrorCountfind(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryStatistics);
		this.renderJson(casepage);
	}
	


	
	/**
	 * @author lubin
	 *  部门考试统计
	 * 
	 * */
	public void examCountDapartment(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		List<Dict> dictlit = Dict.dao.getDictByCType("1015");
		setAttr("examlist", examlist);
		setAttr("dictlit", dictlit);
		render("examCountDapartment.jsp");
	}
	/**
	 * @author lubin
	 *  部门考试统计
	 * 
	 * */
	public void examCountDapartmentfind(){
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttime"));
		queryStatistics.setEndtime(getPara("endtime"));
		DataTablesModel casepage = statisticsService.getPageExamCountDapartmentfind(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryStatistics);
		this.renderJson(casepage);
	}
	
	/**
	 * @author lubin
	 *  岗位考试统计
	 * 
	 * */
	public void examCountPost(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		List<Dict> dictlit = Dict.dao.getDictByCType("1015");
		setAttr("examlist", examlist);
		setAttr("dictlit", dictlit);
		render("examCountPost.jsp");
	}
	/**
	 * @author lubin
	 *  岗位考试统计
	 * 
	 * */
	public void examCountPostfind(){
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttime"));
		queryStatistics.setEndtime(getPara("endtime"));
		DataTablesModel casepage = statisticsService.getPageExamCountPostfind(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryStatistics);
		this.renderJson(casepage);
	}
	/**
	 * @author lubin
	 *  人员考试统计
	 * 
	 * */
	public void examCount(){
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		List<Dict> dictlit = Dict.dao.getDictByCType("1015");
		setAttr("examlist", examlist);
		setAttr("dictlit", dictlit);
		render("examCount.jsp");
	}
	/**
	 * @author lubin
	 *  人员考试统计
	 * 
	 * */
	public void examCountfind(){
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttime"));
		queryStatistics.setEndtime(getPara("endtime"));
		DataTablesModel casepage = statisticsService.getPageExamCountfind(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryStatistics);
		this.renderJson(casepage);
	}	

	/**
	 * @author cg
	 * @deprecated 考试人员统计导出
	 * */
	public void exportExamineeExam() {		
		QueryStatistics queryStatistics = new QueryStatistics();
		queryStatistics.setExamid(getPara("examid"));
		queryStatistics.setStarttime(getPara("starttimes"));
		queryStatistics.setEndtime(getPara("endtimes"));
		List<Object[]> casepage = statisticsService.getPageExamfind(Integer.MAX_VALUE, Integer.MAX_VALUE, queryStatistics);
		String[] heades = { "组织机构名称", "考生姓名", "考试次数", "考试不合格人数", "考试合格人数", "考试优秀人数" };
		ExportController.exportXLSRecord(casepage, "考试人员统计导出", heades,
				"1", this.getResponse());
		List<Exam> examlist =  Exam.dao.find("select * from sys_exam where isdel = 0 and isenable = 1 order by starttime desc");
		setAttr("examlist", examlist);
		render("examCount.jsp");
		return;
	}
	/**
	 * @author cg
	 * @deprecated 更新remarks
	 * */
	public void updateremark(){
		String id =getPara("id");
		String remark = getPara("remark");
		Examinee examinee = Examinee.dao.findById(id);
		int pass= 0;
		try{
			if(StrKit.notNull(examinee)){
				examinee.setRemark(remark);
				examinee.update();
			}
		}catch(Exception ex){
			ex.printStackTrace();
			pass = 1;
		}
		this.renderJson(pass);
	}
	/**
	 * @author cg
	 *  @deprecated 查看信息
	 * */
	public void checkinfo(){
		String id =getPara("id");
		Examinee examinee = Examinee.dao.findById(id);
		Exam exam = Exam.dao.findById(examinee.getExamId());
		examinee.setExamId(exam.getName());
		setAttr("examinee",examinee);
		render("examcheckInfo.jsp");
	}
}
