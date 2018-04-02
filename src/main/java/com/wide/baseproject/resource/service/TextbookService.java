package com.wide.baseproject.resource.service;

import java.util.List;

import com.wide.common.model.Cases;
import com.wide.common.model.Textbook;
import com.wide.common.model.query.QueryCase;
import com.wide.viewmodel.DataTablesModel;

public class TextbookService {
	public DataTablesModel getPageCase(int pageNum, int pageSize, QueryCase queryCase) {
		// TODO Auto-generated method stub
		DataTablesModel textbookpage = Textbook.dao.pageDataTables(pageNum, pageSize, queryCase);
		
		if (textbookpage != null && !textbookpage.equals("")) {
			List<List<String>> rows = textbookpage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = row.get(0);
					String url = row.get(4);
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3));
					row.set(3, row.get(5));
					row.set(4, Integer.parseInt((row.get(6) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.set(5, "<a href ='#' onclick=edit('" + id.trim()
							+ "') >修改</a> | <a href='#' onclick=del('" + id.trim() + "') >删除</a> | <a href='#' onclick=BrowseServer('xFilePath'); >下载</a>"  );
					row.remove(6);
				}
			}
		}
		return textbookpage;
		
	}

}
