package com.wide.baseproject.exam.service;

import com.wide.common.model.Bespeakexam;
import com.wide.common.model.Error;
import com.wide.common.model.query.QueryBespeak;
import com.wide.viewmodel.DataTablesModel;

public class BespeakExamService {

	public DataTablesModel getPageBespeak(int pageNum, int pageSize, QueryBespeak qb) {
		// TODO Auto-generated method stub
		DataTablesModel bespeakpage = Bespeakexam.dao.pageDataTables(pageNum, pageSize, qb);
		
		return null;
	}

}
