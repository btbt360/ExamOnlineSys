package com.wide.baseproject.exam.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exam.service.ExamineeService;
import com.wide.baseproject.exam.service.InvigilateService;
import com.wide.common.model.Exam;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Examinee;
import com.wide.common.model.ExampapersQuestion;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryExam;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;

public class ExamineeController extends BaseController {
	private static final InvigilateService invigilateService = Enhancer.enhance(InvigilateService.class);
	private static final ExamineeService examineeService = Enhancer.enhance(ExamineeService.class);

	/**
	 * @author cg
	 *  参加考试
	 * 
	 * */
	public void addJoinExam(){
		render("joinExamList.jsp");
	}
	
	/**
	 * @author cg
	 * 考试列表
	 * 考生 0
	 * */
	public void getJoinExamlist(){
		QueryExam queryExam = new QueryExam();
		queryExam.setName(getPara("name"));
		queryExam.setStarttimes(getParaToDate("starttimes"));
		queryExam.setEndtimes(getParaToDate("endtimes"));
		DataTablesModel invigilatepage = invigilateService.getPageInvigilate(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExam,0);
		this.renderJson(invigilatepage);
	}
	/**
	 * @author cg
	 * 进入考试
	 * */
	public void addStartExam(){
		Examinee examinee =null;
		Exam exam  = new Exam ();
		int quflag = 0;//开启试题 1开启 0未开启
		int anflag = 0;//开启答案 1开启 0未开启
		try{
			String examid = getPara("id");
			//1.查询考试
			exam = Exam.dao.findById(examid);
			List<Examinee> elist = new ArrayList<Examinee>();
			User user =getUser();
			elist=Examinee.dao.find("select * from sys_examinee where user_id = '"+user.getId()+"' and exam_id ='"+examid+"'");
			//2.查询考生
			examinee = elist.size()>0?elist.get(0):new Examinee();
			//3.查询考题
			quflag = 1;
			//4.查询答案
			anflag = 0;
			setAttr("quflag", quflag);
			setAttr("anflag", anflag);
			setAttr("exam",exam);
			setAttr("examinee",examinee);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		render("startExam.jsp");
	}
	
	/**
	 * @author cg
	 * 查询考题
	 * */
	public void getQuestions(){
		String exampapersid = getPara("exampapersid");
		String examid = getPara("examid");
		String examineeid = getPara("examineeid");
		String questionid = getPara("questionid");
		int sorts = getParaToInt("sorts");
		String qustrhead = "";
		String qustrbody = "";
		String qustrfoot = "";
		try{
			 qustrhead = "<div class='row-fluid'><div class='block'><div class='navbar navbar-inner block-header'><div class='muted pull-left'>试题</div></div><div class='block-content collapse in'><div class='span12'><fieldset>";
			 qustrbody = examineeService.getQuestions(exampapersid,examid,examineeid,questionid,sorts);
			 qustrfoot = "</fieldset></div></div></div></div>";
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		setAttr("questionstr", qustrhead+qustrbody+qustrfoot);
		renderJson();
	}
	
	/**
	 * @author cg
	 * 查询答案
	 * */
	public void getAnswers(){
		String exampapersid = getPara("exampapersid");
		String examid = getPara("examid");
		String examineeid = getPara("examineeid");
		String eqstr="";
		try{
			List<ExampapersQuestion>  listeq = new ArrayList<ExampapersQuestion>();
			listeq = ExampapersQuestion.dao.find("select * from sys_exampapers_question where exampapers_id = ? ",exampapersid);
			if(listeq.size()>0){
				for(int i=0;i<listeq.size();i++){
					List<ExamAnswer> listea = new ArrayList<ExamAnswer>();
					listea = ExamAnswer.dao.find("select * from sys_exam_answer where examinee_id = ? and exam_id = ? and question_id = ? ",examineeid,examid,listeq.get(i).getQuestionId());
					if(listea.size()>0){
						eqstr=eqstr+"<button type='button' class='btn btn-info' onclick=updateanswer('"+listeq.get(i).getQuestionId()+"')>"+listeq.get(i).getSort()+"</button>";
					}else{
						eqstr=eqstr+"<button type='button' class='btn btn-defaul' onclick=updateanswer('"+listeq.get(i).getQuestionId()+"')>"+listeq.get(i).getSort()+"</button>";
					}
					if(i/15==0){
						eqstr = eqstr+"<br />";
					}
				}
			}
			setAttr("eqstr", eqstr);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		renderJson();
	}
	
	/**
	 * @author cg
	 * 新建答案
	 * */
	public void getUpdateQuestionAnswer(){
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	/**
	 * @author cg
	 * 交卷
	 * */
	public void getHandExam(){
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
	/**
	 * @author cg
	 * 强行下机
	 * */
	public void getDownMachine(){
		try{
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
	}
}
