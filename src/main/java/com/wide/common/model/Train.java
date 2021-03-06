package com.wide.common.model;

import com.jfinal.kit.StrKit;
import com.wide.common.model.base.BaseTrain;
import com.wide.common.model.query.QueryCurriculum;
import com.wide.common.model.query.QueryTrain;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Train extends BaseTrain<Train> {
	public static final Train dao = new Train();

	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryTrain querytrain) {
		// TODO Auto-generated method stub
		String select = "select id,trainname,trainstarttime,trainendtime,traininfo,curriculum_id ";
	    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_train ");
	    /**
	    if (search!=null&&!search.equals("")) {
	        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
	        parameters.add("%" + search + "%");
	        parameters.add("%" + search + "%");
	    } 
	     **/
	    sqlExceptSelect.append(whereQuery(querytrain));
	    sqlExceptSelect.append(orderbyQuery(querytrain));
	    
	    return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
	}
	/**
	 * query where查询
	 * 
	 * */
	private String whereQuery(QueryTrain querytrain){
		String where=" where 1=1  and isdel = 0 ";
		if(StrKit.notBlank(querytrain.getCurriculumid())){
			where += " and curriculum_id  = '"+querytrain.getCurriculumid()+"'";
		}
		if(StrKit.notBlank(querytrain.getStarttime())){
			where  +=" and trainstarttime > '"+querytrain.getStarttime()+"'";
		}
		if(StrKit.notBlank(querytrain.getEndtime())){
			where  +=" and trainstarttime < '"+querytrain.getEndtime()+"'";
		}
		return where;
		
	}
	/**
	 * query order by 
	 * 
	 * */
	private String orderbyQuery(QueryTrain querytrain){
		String orderby = " order by create_date desc ";
		return orderby;
		
	}
}
