package com.wide.baseproject.exam.service;

import java.util.Date;
import java.util.List;

import com.wide.common.model.Exam;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QuerySubject;
import com.wide.util.DateUtil;
import com.wide.viewmodel.DataTablesModel;

public class ExamService {

	public DataTablesModel getPageExam(int pageNum, int pageSize, QueryExam queryExam,int flag) {

		// TODO Auto-generated method stub

		DataTablesModel exampage = Exam.dao.pageDataTables(pageNum, pageSize, queryExam,0);

		if (exampage != null && !exampage.equals("")) {
			List<List<String>> rows = exampage.getRows();
			if (rows.size() > 0) {
			for (int i = 0; i < rows.size(); i++) {
	
				List<String> row = rows.get(i);
				String id = row.get(0).trim();
				
				row.set(0, row.get(1));
				row.set(1, row.get(2));
				row.set(2, row.get(3));
				row.set(3, row.get(4));
				row.set(4, row.get(5)+" 小时");
				row.set(5, row.get(6));
				row.set(6, row.get(7)+(row.get(8)!=null&&!row.get(8).equals("")?"、"+row.get(8):""));
				row.set(7, "");
				row.set(8, "");
				if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(3)))>0){
					row.set(7, "<span class='label'>考试结束</span>");
				}else if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(3)))<0 && (DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(2)))>=0){
					row.set(7, "<span class='label label-success'>正在考试</span>");
					
				}else if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(2)))<0){
					row.set(7, "<span class='label label-info'>未开始考试</span>");
				}
				row.set(8, "<a href ='#' onclick=edit('" + id
						+ "') >修改</a> | <a href='#' onclick=del('" + id + "') >删除</a>"  );
			    row.remove(9);
	
			   }
	
			}

		}

		return exampage;
	}

}
