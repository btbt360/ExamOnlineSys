package com.wide.common.model;

import com.wide.common.model.base.BaseExam;
import com.wide.common.model.query.QueryExam;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Exam extends BaseExam<Exam> {
	public static final Exam dao = new Exam();
	
	
	@SuppressWarnings("rawtypes")
	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryExam queryExam,int i) {
		// TODO Auto-generated method stub
	    String select = "select id,name,starttime,duration,address,number,status,isenable";
	    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_exam ");
	    /**
	    if (search!=null&&!search.equals("")) {
	        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
	        parameters.add("%" + search + "%");
	        parameters.add("%" + search + "%");
	    } 
	     **/
	    sqlExceptSelect.append(whereQuery(queryExam));
	    sqlExceptSelect.append(orderbyQuery(queryExam));
	    
	    return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
	}
	/**
	 * query where查询
	 * 
	 * */
	private String whereQuery(QueryExam query){
		String where=" where 1=1  and isdel = 0 ";
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
	private String orderbyQuery(QueryExam query){
		String orderby = " order by create_date desc ";
		return orderby;
		
	}
}
