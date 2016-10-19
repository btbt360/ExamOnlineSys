package com.wide.common.model;

import java.util.List;

import com.wide.common.model.base.BaseSubject;
import com.wide.common.model.query.QuerySubject;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Subject extends BaseSubject<Subject> {
	public static final Subject dao = new Subject();

	/**
	 * 
	 * */
	public List<Subject> getAllSubject(){
		List<Subject> list =find("select * from sys_subject where isdel = 0 and isenable = 1 ");
		return list;
	}
	/**
	 * DT
	 * */
	@SuppressWarnings("rawtypes")
	public DataTablesModel pageDataTables(int pageNum, int pageSize, QuerySubject querySubject) {
		// TODO Auto-generated method stub
	    String select = "select id,name,code,info,isenable";
	    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_subject ");
	    /**
	    if (search!=null&&!search.equals("")) {
	        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
	        parameters.add("%" + search + "%");
	        parameters.add("%" + search + "%");
	    } 
	     **/
	    sqlExceptSelect.append(whereQuery(querySubject));
	    sqlExceptSelect.append(orderbyQuery(querySubject));
	    
	    return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
	}
	/**
	 * query where查询
	 * 
	 * */
	private String whereQuery(QuerySubject query){
		String where=" where 1=1  and isdel = 0 and isenable = 1 ";
		if(query.getName()!=null&&!query.getName().equals("")){
			where += " and name like '%"+query.getName()+"%'";
		}
		if(query.getCode()!=null&&!query.getCode().equals("")){
			where  +=" and code = '"+query.getCode()+"'";
		}
		
		return where;
		
	}
	/**
	 * query order by 
	 * 
	 * */
	private String orderbyQuery(QuerySubject query){
		String orderby = " order by create_date desc ";
		return orderby;
		
	}
}
