package com.wide.baseproject.resource.service;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.Dict;
import com.wide.common.model.Itembank;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.Questions;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryQuestion;
import com.wide.viewmodel.DataTablesModel;

public class QuestionsService {

	public DataTablesModel getPageQuestion(int pageNum, int pageSize, QueryQuestion question) {
		// TODO Auto-generated method stub
		DataTablesModel questionpage = Questions.dao.pageDataTables(pageNum, pageSize, question);
		if (questionpage != null && !questionpage.equals("")) {
			List<List<String>> rows = questionpage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					int num = (pageNum-1)*pageSize+(i+1);
					List<String> row = rows.get(i);
					row.set(5, Integer.parseInt((row.get(5) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.add(6, "<a href ='#' onclick=edit('" + row.get(0).trim()
							+ "') >修改</a> | <a href='#' onclick=del('" + row.get(0).trim() + "') >删除</a>"  );
					List<Questionoptions> list =Questionoptions.dao.findByQuestionId(row.get(0).trim());
					String option = "";
					if(list.size()>0){
						for(Questionoptions q:list){
							option = option + "</br>"+q.getCode()+"、"+q.getContant()+"。";
						}
					}
					row.set(0, num+"");
					if(Integer.parseInt(row.get(1))<3){
						row.set(3, row.get(3)+option);
					}
					row.set(1, Dict.dao.getDictByKeyType(row.get(1),"1002"));
				}
			}
		}
		return questionpage;
	}

	public List<Questionoptions> getQuestionoptionsByQuestionId(String id) {
		// TODO Auto-generated method stub
		return Questionoptions.dao.findByQuestionId(id);
	}
	
	

}
