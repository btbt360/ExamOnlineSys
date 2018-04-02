package com.wide.baseproject.train.service;

import java.util.List;

import com.wide.base.BaseController;
import com.wide.common.model.Cases;
import com.wide.common.model.Curriculum;
import com.wide.common.model.query.QueryCurriculum;
import com.wide.viewmodel.DataTablesModel;

public class CurriculumService extends BaseController{

	public DataTablesModel getPageCase(int pageNum, int pageSize, QueryCurriculum queryCurriculum) {
		// TODO Auto-generated method stub
		DataTablesModel curriculumpage = Curriculum.dao.pageDataTables(pageNum, pageSize, queryCurriculum);
		
		if (curriculumpage != null && !curriculumpage.equals("")) {
			List<List<String>> rows = curriculumpage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = row.get(0);
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3));
					row.set(3, row.get(4));
					row.set(4, row.get(5));
					row.set(5, row.get(6));
					row.set(6, "<a href='#' onclick=edit('"+id+"')>修改</a> | <a href='#' onclick=del('"+id+"')>删除</a>");
				}
			}
		}
		return curriculumpage;
	}
	

}
