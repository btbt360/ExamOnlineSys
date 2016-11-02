package com.wide.baseproject.exam.service;

import java.util.List;

import com.wide.common.model.Cases;
import com.wide.common.model.query.QueryError;
import com.wide.viewmodel.DataTablesModel;
import com.wide.common.model.Error;
import com.wide.common.model.Itembank;
import com.wide.common.model.Questionoptions;
public class ErrorSubjectService {

	public DataTablesModel getPageError(int pageNum, int pageSize, QueryError qe) {
		// TODO Auto-generated method stub
		DataTablesModel errorpage = Error.dao.pageDataTables(pageNum, pageSize, qe);
		if (errorpage != null && !errorpage.equals("")) {
			List<List<String>> rows = errorpage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = errorpage.getIds().get(i) + "";
					List<Questionoptions> list = Questionoptions.dao.findByQuestionId(row.get(5));
					String option = "";
					if (list.size() > 0) {
						for (Questionoptions q : list) {
							option = option + "</br>" + q.getCode() + "、" + q.getContant() + "。";
						}
					}
					row.set(0,row.get(0)+option);
					row.set(1, Itembank.dao.findById(row.get(1)).getName());
					row.set(5,"<a href='#' onclick=removenerror('"+id+"') >移除</a>");
				}
			}
		}
		return errorpage;
	}

}
