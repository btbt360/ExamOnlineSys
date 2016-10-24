package com.wide.baseproject.exam.service;

import java.util.List;

import com.wide.common.model.Exam;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QuerySubject;
import com.wide.viewmodel.DataTablesModel;

public class ExamService {

	public DataTablesModel getPageExam(int pageNum, int pageSize, QueryExam queryExam) {
		// TODO Auto-generated method stub
		DataTablesModel exampage = Exam.dao.pageDataTables(pageNum, pageSize, queryExam);
		
		if (exampage != null && !exampage.equals("")) {
			List<List<String>> rows = exampage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					row.set(6, Integer.parseInt((row.get(7) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.set(7, "<a href ='#' onclick=edit('" + row.get(0).trim()
							+ "') >修改</a> | <a href='#' onclick=del('" + row.get(0).trim() + "') >删除</a>"  );
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3));
					row.set(3, row.get(4));
					row.set(4, row.get(5));
					row.set(5, row.get(6));
				}
			}
		}
		return exampage;
		
	}

}
