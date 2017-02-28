package com.wide.baseproject.exam.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.wide.common.model.Dict;
import com.wide.common.model.Error;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.ExampapersQtypes;
import com.wide.common.model.ExampapersQuestion;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.Questions;
import com.wide.common.model.User;
import com.wide.util.CGUtil;
import com.wide.util.TypeChecker;

public class ExamineeService {
	
	/**
	 * @author cg
	 * 查询考题 
	 * @param exampapersid String 试卷id  
	 * @param examid String 考试id
	 * @param examineeid String 考生id
	 * @param sort int 试题排序
	 * */
	public String getQuestions(String exampapersid, String examid, String examineeid, int sort,String[] arges) {
		// TODO Auto-generated method stub
		List<Object[]> listobj =new ArrayList<Object[]> ();
		String restrhead = "";
		String restrbody = "";
		//查询考试问题表
		listobj = Db.query("select t3.id,t2.sort,t3.title,t3.questiontype from sys_exam t,sys_exampapers t1,sys_exampapers_question t2,sys_questions t3 where "+
					"t.exampapers_id = t1.id and t1.id=t2.exampapers_id and t2.question_id = t3.id and t1.id= ? and t.id = ? and t2.sort = ? order by t2.sort asc ",
					exampapersid,examid,Integer.parseInt(arges.length>=sort?arges[sort-1]:sort+""));
		if(listobj.size()>0){
			Object[] ob = listobj.get(0);
			restrhead ="<legend>"+Dict.dao.getDictByKeyType(ob[3]+"","1002")+"</legend>"
					+ "<div class='control-group'>"
					+ "<div class='controls'><div style='span11 text-right'>"+(sort==0?1:sort)+"、"+ob[2]
					+ "</div></div></div>";
			restrbody= getrestrbody(ob[3]+"",ob[0]+"",examineeid,examid,(sort==0?1:sort)+1);
		}
		return restrhead+restrbody;
	}

	public String getrestrbody(String instr,String questionid,String examineeid,String examid,int sort){
		String restrbody= "";
		List<ExamAnswer> listea = new ArrayList<ExamAnswer>();
		List<Questionoptions> listqp = new ArrayList<Questionoptions>();
		listqp = Questionoptions.dao.findByQuestionId(questionid);
		ExamAnswer ea = new ExamAnswer();
		listea = ExamAnswer.dao.getEalist(examineeid,examid,questionid);
		if(listea.size()>0){
			ea = listea.get(0);
		}
		String str = "";
		if(Integer.parseInt(instr)==1)
		{
			//单选题
			if(listqp.size()>0){
				for(int i = 0;i<listqp.size();i++){
					if(listqp.get(i).getCode().equals(ea.getAnswerinfo())){
						str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_"+i+"' value='"+listqp.get(i).getCode()+"' name='answeroption' checked  />&nbsp;&nbsp;"+
								  listqp.get(i).getCode()+"、"+listqp.get(i).getContant()+"<br/>";
					}else{
						str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_"+i+"' value='"+listqp.get(i).getCode()+"' name='answeroption'  />&nbsp;&nbsp;"+
								  listqp.get(i).getCode()+"、"+listqp.get(i).getContant()+"<br/>";
					}
					
				}
			}
			String hqid="answeroption_";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;<h4>选项：</h4></label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary'  id='checknext' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"','"+ea.getAnswerinfo()+"')>保存并进入下一题</button></div>";
		}else if(Integer.parseInt(instr)==2){
			if(listqp.size()>0){
				for(int i = 0;i<listqp.size();i++){
					String answerinfo = StrKit.notNull(ea.getAnswerinfo())?ea.getAnswerinfo():"";
					if(answerinfo.indexOf(listqp.get(i).getCode())!=-1){
						str = str+"&nbsp;&nbsp;<input type='checkbox' id='answeroption_"+i+"' value='"+listqp.get(i).getCode()+"' name='answeroption_"+i+"' checked  />&nbsp;&nbsp;"+
								  listqp.get(i).getCode()+"、"+listqp.get(i).getContant()+"<br/>";
					}else{
						str = str+"&nbsp;&nbsp;<input type='checkbox' id='answeroption_"+i+"' value='"+listqp.get(i).getCode()+"' name='answeroption_"+i+"'  />&nbsp;&nbsp;"+
								  listqp.get(i).getCode()+"、"+listqp.get(i).getContant()+"<br/>";
					}
					
				}
			}
			String hqid="answeroption_";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;<h4>选项：</h4></label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' id='checknext' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"','"+ea.getAnswerinfo()+"')>保存并进入下一题</button></div>";
		}else if(Integer.parseInt(instr)==3){//判断题
			if(!TypeChecker.isEmpty(ea.getId())){
				if(ea.getAnswerinfo().equals("0")){
					str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption' checked /> 错"+
				          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption'  /> 对";
				}else{
					str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption'  /> 错"+
					          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption' checked /> 对";
				}
			}else{
				str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption' /> 错"+
				          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption' /> 对";
			}
			String hqid="answeroption_";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;<h4>选项：</h4></label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' id='checknext' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"','"+ea.getAnswerinfo()+"')>保存并进入下一题</button></div>";
		}else if(Integer.parseInt(instr)==4){//问答题
			if(!TypeChecker.isEmpty(ea.getId())){
				str = ea.getAnswerinfo();
			}
			String hqid="answerwd";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;<h4>回答：</h4></label>"
					+ "<div class='controls'><textarea id='answerwd' name='answerwd' rows='5' style='width: 50%;' placeholder='请输入答案!'>"+str
					+ "</textarea></div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' id='checknext' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"','"+ea.getAnswerinfo()+"')>保存并进入下一题</button></div>";
		}else if(Integer.parseInt(instr)==5){//填空题
			if(!TypeChecker.isEmpty(ea.getId())){
				str = ea.getAnswerinfo();
			}
			String hqid="answerwd";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;<h4>回答：</h4></label>"
					+ "<div class='controls'><textarea id='answerwd' name='answerwd' rows='5' style='width: 50%;' placeholder='请输入答案!'>"+str
					+ "</textarea></div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' id='checknext' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"','"+ea.getAnswerinfo()+"')>保存并进入下一题</button></div>";
		
		}
		
		return restrbody;
	}
	/**
	 * @author cg
	 * @param examid
	 * 根据考试编码查询考试的试题类型
	 * @return flag 0全部是选择题和判断题 1是杂题 
	 * */
	public int changeGet(String examid){
		int flag = 0;
		List<ExampapersQtypes> list = new ArrayList<ExampapersQtypes>();
		list = ExampapersQtypes.dao.find("SELECT t2.* FROM sys_exam t ,sys_exampapers t1, sys_exampapers_qtypes t2  WHERE "
				+ " t.id = ? AND t.exampapers_id = t1.id AND t1.id = t2.exampapers_id",examid);
		if(list.size()>0){
			for(ExampapersQtypes eq:list){
				if(eq.getTypeId()>3){
					flag = 1;
					break;
				}
			}
		}
		return flag;
	}
	/**
	 * @author cg
	 * @param answer
	 * @param questionid
	 * @param examineeid
	 * @param examid
	 * @param exampapersid
	 * @param user
	 * 保存试题
	 * 
	 * */
	public void getExamAnswer(String answer,String questionid,String examineeid,String examid,String exampapersid,
			User user)throws Exception{
		List<ExamAnswer> ealist = new ArrayList<ExamAnswer>();
		ExamAnswer ea = new ExamAnswer();
		Questions questions = Questions.dao.findById(questionid);
		if(StrKit.notBlank(answer)&&StrKit.notBlank(questionid)&&
				StrKit.notBlank(examineeid)&&StrKit.notBlank(examid)){
			ealist = ExamAnswer.dao.getEalist(examineeid, examid, questionid);
			ExampapersQuestion exampapersQuestion = ExampapersQuestion.dao
					.getExampapersQuestion(questionid, exampapersid);
			if(StrKit.notNull(questions)){
				if (ealist.size() > 0){
					ea = ealist.get(0);
					if (answer.equals(questions.getQuestionanswer())){
						if(StrKit.notNull(exampapersQuestion)){
							ea.setAnswerscores(exampapersQuestion.getScores());
						}
					}else{
						saveError(questionid,answer,user.getId(),examid);
					}
					ea.setAnswerinfo(answer);
					ea.setUpdateBy(user.getId());
					ea.setUpdateDate(new Date());
					ea.update();
				}else{
					if (answer.equals(questions.getQuestionanswer())){ 
						if (StrKit.notNull(exampapersQuestion)) {
							ea.setAnswerscores(exampapersQuestion.getScores());
						}
					}else{
						saveError(questionid,answer,user.getId(),examid);
					}
					ea.setId(CGUtil.createUUid());
					ea.setExamineeId(examineeid);
					ea.setExamId(examid);
					ea.setQuestionId(questionid);
					ea.setAnswerinfo(answer);
					ea.setCreatorId(user.getId());
					ea.setCreateDate(new Date());
					ea.setUpdateBy(user.getId());
					ea.setUpdateDate(new Date());
					ea.setIsenable(1);
					ea.setJudgetime(new Date());
					ea.save();
				}
			}
		}
	}
	/**
	 * @author cg
	 * 保存错题
	 * */
	public void saveError(String questionid, String answer, String userid,String examid) {
		// TODO Auto-generated method stub
		Questions questions = Questions.dao.findById(questionid);
		if (StrKit.notNull(questions)) {
			if (questions.getQuestionanswer() != answer) {
				List<Error> list = new ArrayList<Error>();
				list = Error.dao.find("select * from sys_error where question_id = ? and user_id = ? and recourse_id = ? and recourse_type = 1", questionid, userid,examid);
				if (list.size() <= 0) {
					Error error = new Error();
					error.setId(CGUtil.createUUid());
					error.setQuestionId(questionid);
					error.setUserId(userid);
					error.setRecourseId(examid);
					error.setRecourseType(1);
					error.setUpdateBy(userid);
					error.setUpdateDate(new Date());
					error.setCreateDate(new Date());
					error.setCreatorId(userid);
					error.setIsenable(1);
					error.setIsdel(0);
					error.save();
				}
			}
		}
	}
	/**
	 * @author cg
	 * 保存查询答案
	 * 
	 * */
	public String getAnswers(String exampapersid,String examineeid,String examid,String[] arges){
		String eqstr = "";
		List<ExampapersQuestion> listeq = new ArrayList<ExampapersQuestion>();
		listeq = ExampapersQuestion.dao.find(
				"select * from sys_exampapers_question where exampapers_id = ? order by sort asc ", exampapersid);
		if (listeq.size() > 0) {
			for (int i = 0; i < listeq.size(); i++) {
				List<ExamAnswer> listea = new ArrayList<ExamAnswer>();
				listea = ExamAnswer.dao.getEalist(examineeid, examid, listeq.get(Integer.parseInt(arges[i])-1).getQuestionId());
				Questions question = Questions.dao.findById(listeq.get(Integer.parseInt(arges[i])-1).getQuestionId());
				String answerTypestr = "answeroption_";
				if (StrKit.notNull(question)) {
					if (question.getQuestiontype() == 4 || question.getQuestiontype() == 5) {
						answerTypestr = "answerwd";
					}
				}
				if (listea.size() > 0) {
					eqstr = eqstr
							+ "<button type='button' class='btn btn-info' style='margin:3px;' onclick=updateanswer('"
							+ listeq.get(Integer.parseInt(arges[i])-1).getQuestionId() + "','" + (i+1) + "','"
							+ answerTypestr + "')>" + (i+1) + "</button>";
				} else {
					eqstr = eqstr
							+ "<button type='button' class='btn btn-defaul' style='margin:3px;' onclick=updateanswer('"
							+ listeq.get(Integer.parseInt(arges[i])-1).getQuestionId() + "','" + (i+1) + "','"
							+ answerTypestr + "')>" + (i+1) + "</button>";
				}
				if ((i+1) > 0 && (i+1) % 15 == 0) {
					eqstr = eqstr + "<br />";
				}
			}
		}
		return eqstr;
	}
}
