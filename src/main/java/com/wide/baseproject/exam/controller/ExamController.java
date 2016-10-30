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
import com.wide.viewmodel.DataTablesModel;

public class ExamController extends BaseController{
	private static final ExamService examService = Enhancer.enhance(ExamService.class);
	
	/**
	 * @author lubin
	 *  考试添加
	 * 
	 * */
	public void addExam(){
		render("examList.jsp");
	}
	
	/**
	 * @author lubin
	 * 考试列表
	 * */
	public void getExamlist(){
		QueryExam queryExam = new QueryExam();
		queryExam.setCode(getPara("code"));
		queryExam.setName(getPara("name"));
		DataTablesModel subjectpage = examService.getPageExam(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExam,0);
		this.renderJson(subjectpage);
	}
	/**
	 * @author lubin
	 * 考试添加详细
	 * 
	 * */
	public void addExamInfo(){
		String id = getPara("id");
		List<Exampapers> exampaperslist = new ArrayList<Exampapers>();
		exampaperslist = Exampapers.dao.getExampapersAll();
		
		List<Examinee> examineeList = Examinee.dao.getExamineeByExamId(id);
		String usernames = "";
		String userids = "";
		if (examineeList.size() > 0) {
			for (Examinee o : examineeList) {
				usernames = usernames + "|" + o.getName();
				userids = userids + o.getUserId() + "|";
			}
		}
		Exam exam = null;
		if(id!=null&&!id.equals("")){
			exam = Exam.dao.findById(id);
		}else{
			exam = new Exam();
		}
		setAttr("flagcg", getPara("flagcg"));
		setAttr("exampaperslist", exampaperslist);
		setAttr("exam", exam);
		setAttr("usernames", usernames);
		setAttr("usernamesview", usernames);
		setAttr("userids", userids);
		render("examInfo.jsp");
	}
	/**
	 * @author lubin
	 * 考试保存
	 * 
	 * */
	@Before(Tx.class)
	public void saveExam(){
		int flagcg=0;

		String userids = getPara("userids");
		String usernames = getPara("usernames");
		String[] str = userids.split("[|]");
		String[] strName = usernames.split("[|]");
		try{
			Exam exam = getModel(Exam.class)==null||getModel(Exam.class).equals("")?new Exam():getModel(Exam.class);
			if(exam.getId()!=null&&!exam.getId().equals("")){
				try{
					Db.query("set foreign_key_checks=0;");
					Db.update(" delete from sys_examinee where exam_id = ? ", exam.getId());
					Db.query("set foreign_key_checks=1;");
				}catch(Exception ex){
					ex.printStackTrace();
				}

				for(int i=0;i<str.length;i++){
					Examinee examinee = new Examinee();
					examinee.setId(createUUid());
					examinee.setUserId(str[i]);
					examinee.setExamId(exam.getId());
					examinee.setExampapersId(exam.getExampapersId());
					examinee.setName(strName[i]);
					examinee.setCreatorId(getUser().getId());
					examinee.setCreateDate(new Date());
					examinee.setUpdateBy(getUser().getId());
					examinee.setUpdateDate(new Date());
					examinee.setIsdel(0);
					examinee.setIsenable(1); //启用
					examinee.save();
				}
				exam.setNumber(str.length);
				exam.setUpdateBy(getUser().getId());
				exam.setUpdateDate(new Date());
				exam.update();
			}else{
				String id = createUUid();
				Date starttime = exam.getStarttime();
				exam.setId(id);
				exam.setNumber(str.length);
				exam.setCreatorId(getUser().getId());
				exam.setCreateDate(new Date());
				exam.setUpdateBy(getUser().getId());
				exam.setUpdateDate(new Date());
				exam.setIsdel(0);
				exam.save();
				
				for(int i=0;i<str.length;i++){
					Examinee examinee = new Examinee();
					examinee.setId(createUUid());
					examinee.setUserId(str[i]);
					examinee.setExamId(exam.getId());
					examinee.setExampapersId(exam.getExampapersId());
					examinee.setName(strName[i]);
					examinee.setCreatorId(getUser().getId());
					examinee.setCreateDate(new Date());
					examinee.setUpdateBy(getUser().getId());
					examinee.setUpdateDate(new Date());
					examinee.setIsdel(0);
					examinee.setIsenable(1); //启用
					examinee.save();
				}
			}
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		redirect("/exam/addExamInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author lubin
	 * 考试删除
	 * */
	public void delExam(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_exam set isdel = 1 where id = ? ",id);
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
	
	public void countScore(){
		returninfo = new RenturnInfo();
		List<ExamAnswer> answerList = new ArrayList<ExamAnswer>();
		answerList = ExamAnswer.dao.getExamAnswerList("28fafb16-382a-4ec3-98bd-0140cdf7cecb", "ff8c748b-c5ac-47d3-807f-58ef75552255");
		if(answerList.size() >0){
			for(ExamAnswer examAnswer:answerList){
				Questions questions = Questions.dao.findById(examAnswer.getQuestionId());
				if(questions != null){
					if(examAnswer.getAnswerinfo().equals(questions.getQuestionanswer())){
						ExampapersQuestion exampapersQuestion  = ExampapersQuestion.dao.getExampapersQuestion(examAnswer.getQuestionId());
						try{
							Db.update("update sys_exam_answer t set t.scores=?,t.update_date=?,t.update_by=? where id=?",exampapersQuestion.getScores(),new Date(),getUser().getId(),examAnswer.getId());
							System.out.println("成功");
							returninfo.setResult(0);
							returninfo.setResultInfo("更新成功！");
						}catch(Exception ex){
							ex.printStackTrace();
							returninfo.setResult(1);
							returninfo.setResultInfo("更新失败！");
						}
					}
				}
			}
		}
		setAttr("returninfo", returninfo);
		renderJson();
	}
	
	 public static void main(String args[]) { 
	       String id = createUUid();
	       System.out.println("id:"+id+"</br>");
	       List<ExamAnswer> answerList = new ArrayList<ExamAnswer>();
			answerList = ExamAnswer.dao.getExamAnswerList("28fafb16-382a-4ec3-98bd-0140cdf7cecb", "ff8c748b-c5ac-47d3-807f-58ef75552255");
			if(answerList.size() >0){
				for(ExamAnswer examAnswer:answerList){
					Questions questions = Questions.dao.findById(examAnswer.getQuestionId());
					if(questions != null){
						if(examAnswer.getAnswerinfo().equals(questions.getQuestionanswer())){
							ExampapersQuestion exampapersQuestion  = ExampapersQuestion.dao.findById(examAnswer.getQuestionId());
							try{
								Db.update("update sys_exam_answer t set t.scroes = ? where id = ?",exampapersQuestion.getScores(),examAnswer.getId());
								System.out.println("成功");
							}catch(Exception ex){
								ex.printStackTrace();
								System.out.println("失败");
							}
						}
					}
				}
			}
	  } 
	
	
}
