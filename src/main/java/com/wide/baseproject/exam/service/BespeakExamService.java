package com.wide.baseproject.exam.service;

import java.util.Date;
import java.util.List;

import com.wide.common.model.Bespeakexam;
import com.wide.common.model.Error;
import com.wide.common.model.query.QueryBespeak;
import com.wide.util.DateUtil;
import com.wide.viewmodel.DataTablesModel;

public class BespeakExamService {

	public DataTablesModel getPageBespeak(int pageNum, int pageSize, QueryBespeak qb) {
		// TODO Auto-generated method stub
		DataTablesModel bespeakpage = Bespeakexam.dao.pageDataTables(pageNum, pageSize, qb);
		if (bespeakpage != null && !bespeakpage.equals("")) {
			List<List<String>> rows = bespeakpage.getRows();
			if (rows.size() > 0) {
			for (int i = 0; i < rows.size(); i++) {
	
				List<String> row = rows.get(i);
				String id = row.get(0).trim();
				row.set(0, row.get(1));
				row.set(1, row.get(2));
				row.set(2, row.get(3));
				row.set(3, row.get(4));
				row.set(4, row.get(5));
				row.set(5, "");
				row.set(6, Integer.parseInt((row.get(6) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
				row.set(7, "");
				if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(3)))>0){
					row.set(5, "<span class='label'>考试已结束</span>");
					row.set(7, "");
				}else if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(3)))<0 && (DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(2)))>=0){
						row.set(5, "<span class='label label-success'>考试正在进行中</span>");
						row.set(7, "");
				}else if((DateUtil.compare_date(DateUtil.toDateTimeStr(new Date()), row.get(2)))<0){
					row.set(5, "<span class='label label-info'>可以预约考试</span>");
					row.set(7, "<a href ='#' onclick=edit('" + id
							+ "') >修改</a> | <a href='#' onclick=del('" + id + "') >删除</a>"  );
				 }
			   }
			}
		}
		return bespeakpage;
		
	}

}
