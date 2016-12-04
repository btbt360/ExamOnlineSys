package com.wide.baseproject.exam.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.jfinal.plugin.activerecord.Db;
import com.wide.common.model.Dict;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Questionoptions;
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
	public String getQuestions(String exampapersid, String examid, String examineeid, int sort) {
		// TODO Auto-generated method stub
		List<Object[]> listobj =new ArrayList<Object[]> ();
		String restrhead = "";
		String restrbody = "";
		//查询考试问题表
		listobj = Db.query("select t3.id,t2.sort,t3.title,t3.questiontype from sys_exam t,sys_exampapers t1,sys_exampapers_question t2,sys_questions t3 where "+
					"t.exampapers_id = t1.id and t1.id=t2.exampapers_id and t2.question_id = t3.id and t1.id= ? and t.id = ? and t2.sort = ? order by t2.sort asc ",
					exampapersid,examid,sort==0?1:sort);
		if(listobj.size()>0){
			Object[] ob = listobj.get(0);
			restrhead ="<legend>"+Dict.dao.getDictByKeyType(ob[3]+"","1002")+"</legend>"
					+ "<div class='control-group'>"
					+ "<div class='controls'><div style='span1 text-right'>"+ob[1]+"、</div><div style='span10 text-left'>"+ob[2]
					+ "</div></div></div>";
			restrbody= getrestrbody(ob[3]+"",ob[0]+"",examineeid,examid,(Integer.parseInt(ob[1]+"")+1));
		}
		return restrhead+restrbody;
	}

	public String getrestrbody(String instr,String questionid,String examineeid,String examid,int sort){
		String restrbody= "";
		List<ExamAnswer> listea = new ArrayList<ExamAnswer>();
		List<Questionoptions> listqp = new ArrayList<Questionoptions>();
		ExamAnswer ea = new ExamAnswer();
		listea = ExamAnswer.dao.find("select * from sys_exam_answer where examinee_id = ? and exam_id = ? and question_id = ? ",examineeid,examid,questionid);
		if(listea.size()>0){
			ea = listea.get(0);
		}
		
		if(Integer.parseInt(instr)==1)
		{//单选题
			listqp = Questionoptions.dao.findByQuestionId(questionid);
			String str = "";
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
					+ "<label class='control-label'>&nbsp;&nbsp;选项：</label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"')>下一题</button></div>";
		}else if(Integer.parseInt(instr)==2){
			//多选题
			listqp = Questionoptions.dao.findByQuestionId(questionid);
			String str = "";
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
					+ "<label class='control-label'>&nbsp;&nbsp;选项：</label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"')>下一题</button></div>";
		}else if(Integer.parseInt(instr)==3){//判断题
			String str = "";
			if(!TypeChecker.isEmpty(ea.getId())){
				if(ea.getAnswerinfo().equals("0")){
					str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption' checked /> 否"+
				          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption'  /> 是";
				}else{
					str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption'  否/> "+
					          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption' checked /> 是";
				}
			}else{
				str = str+"&nbsp;&nbsp;<input type='radio' id='answeroption_0' value='0' name='answeroption' /> 否"+
				          "&nbsp;&nbsp;<input type='radio' id='answeroption_1' value='1' name='answeroption' /> 是";
			}
			String hqid="answeroption_";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;选项：</label>"
					+ "<div class='controls'>"+str
					+ "</div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"')>下一题</button></div>";
		}else if(Integer.parseInt(instr)==4){//问答题
			String str = "";
			if(!TypeChecker.isEmpty(ea.getId())){
				str = ea.getAnswerinfo();
			}
			String hqid="answerwd";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;回答：</label>"
					+ "<div class='controls'><textarea id='answerwd' name='answerwd' rows='5' style='width: 50%;' placeholder='请输入答案!'>"+str
					+ "</textarea></div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"')>下一题</button></div>";
		}else if(Integer.parseInt(instr)==5){//填空题
			String str = "";
			if(!TypeChecker.isEmpty(ea.getId())){
				str = ea.getAnswerinfo();
			}
			String hqid="answerwd";
			restrbody = "<div class='control-group'>"
					+ "<label class='control-label'>&nbsp;&nbsp;回答：</label>"
					+ "<div class='controls'><textarea id='answerwd' name='answerwd' rows='5' style='width: 50%;' placeholder='请输入答案!'>"+str
					+ "</textarea></div></div>"
					+"<div class='form-actions'>"
					+ "<button type='button' class='btn btn-primary' onclick=nextQuestion('"+sort+"','"+hqid+"','"+questionid+"')>下一题</button></div>";
		
		}
		
		return restrbody;
	}
}
