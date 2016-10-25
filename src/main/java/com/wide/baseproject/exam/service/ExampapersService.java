package com.wide.baseproject.exam.service;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.Exam;
import com.wide.common.model.Exampapers;
import com.wide.common.model.ExampapersQtypes;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.query.QueryExampapers;
import com.wide.constant.EnumExamineeType;
import com.wide.viewmodel.DataTablesModel;

public class ExampapersService {

	public DataTablesModel getPageExampapers(int pageNum, int pageSize, QueryExampapers queryExampapers) {
		// TODO Auto-generated method stub
		DataTablesModel invigilatepage = Exampapers.dao.pageDataTables(pageNum, pageSize, queryExampapers);
		if (invigilatepage != null && !invigilatepage.equals("")) {
			List<List<String>> rows = invigilatepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = row.get(0).trim();
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3)+" 分");
					row.set(3, row.get(4)+" 次");
					row.set(4, row.get(5)+" 题");
					row.set(5, Integer.parseInt((row.get(6) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.set(6, "<a href ='#' onclick=edit('"+id+"') >修改</a> | <a href='#' onclick=del('"+id+"') >删除</a>");
				}
			}
		}
		return invigilatepage;
	}

	public void saveOrUpdateExampapers(Exampapers exampapers, List<ExampapersQtypes> eqlist, int flag) {
		// TODO Auto-generated method stub
		if(flag==0){
			exampapers.update();
		}else{
			exampapers.save();
		}
		saveExampapersTypes(exampapers.getId(),eqlist);
	}

	private void saveExampapersTypes(String id, List<ExampapersQtypes> eqlist) {
		// TODO Auto-generated method stub
		List<ExampapersQtypes> list = new ArrayList<ExampapersQtypes>();
		list=ExampapersQtypes.dao.findByExampapersId(id);
		if(list.size()>0){
			for(ExampapersQtypes eql:list){
				eql.delete();
			}
		}
		if(eqlist.size()>0){
			for(ExampapersQtypes eqn:eqlist){
				eqn.save();
			}
		}
	}

}
