package com.wide.baseproject.exam.service;

import java.util.List;

import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Examinee;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.query.QueryExaminee;
import com.wide.constant.EnumExamineeType;
import com.wide.viewmodel.DataTablesModel;

public class AchievementService {

	public DataTablesModel getPageExamineeJudge(int pageNum, int pageSize, QueryExaminee queryExaminee) {
		// TODO Auto-generated method stub
		//select = "select t1.id,t.code,t.name,t.starttime,t.endtime,t1.name,t1.totalscore,t1.status ";
		DataTablesModel examineepage = Examinee.dao.pageDataTables(pageNum, pageSize, queryExaminee,2);
		if (examineepage != null && !examineepage.equals("")) {
			List<List<String>> rows = examineepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = examineepage.getIds().get(0)+"";
					row.set(2, row.get(2).split("[.]")[0]);
					row.set(3, row.get(3).split("[.]")[0]);
					row.set(6, EnumExamineeType.getFromKey(Integer.parseInt(row.get(6))));
					row.add(7, "<button type='button' class='btn btn-primary' onclick=addJudgeList('"+id+"')>人工审核</button>");
				}
			}
		}
		return examineepage;
	}

	public DataTablesModel getPageJudgeSalf(int pageNum, int pageSize, QueryExaminee queryExaminee) {
		// TODO Auto-generated method stub
		DataTablesModel examineepage = ExamAnswer.dao.pageDataTables(pageNum, pageSize, queryExaminee);
		if (examineepage != null && !examineepage.equals("")) {
			List<List<String>> rows = examineepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = examineepage.getIds().get(0)+"";
					String judgetype = row.get(6);
					if(row.get(2).equals("0")||row.get(2)=="0"){
						row.set(2, "错");
					}else if(row.get(2).equals("1")||row.get(2)=="1"){
						row.set(2, "对");
					}
					if(row.get(4).equals("0")||row.get(4)=="0"){
						row.set(4, "错");
					}else if(row.get(4).equals("1")||row.get(4)=="1"){
						row.set(4, "对");
					}
					List<Questionoptions> list =Questionoptions.dao.findByQuestionId(id);
					String option = "";
					if(list.size()>0){
						for(Questionoptions q:list){
							option = option + "</br>"+q.getCode()+"、"+q.getContant()+"。";
						}
					}
					row.set(1, row.get(1)+option);
					if(Integer.parseInt(judgetype)==0){
						row.set(5, "<input class='input-mini' name='score_"+i+"' id='score_"+i+"' type='number' value='"+row.get(5)+"'>");
						row.set(6, "<button type='button' class='btn btn-success' onclick=addpass('"+id+"','score_"+i+"')>通过</button>");
					}else{
						row.set(6, "已通过人工验证");
					}
					
				}
			}
		}
		return examineepage;
	}

}
