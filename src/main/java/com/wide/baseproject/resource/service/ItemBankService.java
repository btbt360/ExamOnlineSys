package com.wide.baseproject.resource.service;

import java.util.List;

import com.wide.common.model.Cases;
import com.wide.common.model.Dict;
import com.wide.common.model.Itembank;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryCase;
import com.wide.common.model.query.QueryItemBank;
import com.wide.viewmodel.DataTablesModel;

public class ItemBankService {

	public DataTablesModel getPageItemBank(int pageNum, int pageSize, QueryItemBank queryitembank) {
		// TODO Auto-generated method stub
		DataTablesModel queryitempage = Itembank.dao.pageDataTables(pageNum, pageSize, queryitembank);
		
		if (queryitempage != null && !queryitempage.equals("")) {
			List<List<String>> rows = queryitempage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String str = row.get(5)+"";
					row.set(5, Integer.parseInt((row.get(6) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.set(6, "<a href ='#' onclick=checkinfo('" + row.get(0).trim() + "') >查看试题</a> | <a href ='#' onclick=edit('" + row.get(0).trim() + "') >修改</a> | <a href='#' onclick=del('" + row.get(0).trim() + "') >删除</a>"  );
					row.set(0, row.get(1));
					//查询科目名称
					Subject sub=Subject.dao.findById(row.get(2));
					row.set(1, sub!=null&&!sub.equals("")?sub.getName():"");//
					row.set(2, row.get(3)+"题");
					//查询数据字典名称
					row.set(3, Dict.dao.getDictByKeyType(row.get(4),"1002"));
					row.set(4, str+"次");
					
				}
			}
		}
		return queryitempage;
		
	}

	public static List<Itembank> getItembankBySubjectId(String subjectid) {
		// TODO Auto-generated method stub
		return Itembank.dao.find("select * from sys_itembank where isdel = 0 and isenable = 1 and subject_id = ? ",subjectid);
	}



}
