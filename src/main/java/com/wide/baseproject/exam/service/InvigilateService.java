package com.wide.baseproject.exam.service;

import java.util.List;

import com.wide.common.model.Exam;
import com.wide.common.model.query.QueryExam;
import com.wide.constant.EnumExamineeType;
import com.wide.viewmodel.DataTablesModel;

public class InvigilateService{

	public DataTablesModel getPageInvigilate(int pageNum, int pageSize, QueryExam queryExam) {
		// TODO Auto-generated method stub
		DataTablesModel invigilatepage = Exam.dao.pageDataTables(pageNum, pageSize, queryExam,1);
		if (invigilatepage != null && !invigilatepage.equals("")) {
			List<List<String>> rows = invigilatepage.getRows();
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
					row.set(7, EnumExamineeType.getFromKey(Integer.parseInt(row.get(9))));
					if(Integer.parseInt(row.get(9))<2){
						row.set(8, "<a href ='#' onclick=alink('"+id+"') >开始监考</a>");						
					}else{
						row.set(8, "");						
					}
					row.remove(9);
				}
			}
		}
		return invigilatepage;
	}
	

}
