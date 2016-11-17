package com.wide.common.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.wide.common.model.base.BaseExam;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QueryExaminee;
import com.wide.util.DateUtil;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Exam extends BaseExam<Exam> {
	public static final Exam dao = new Exam();
	
	
	@SuppressWarnings("rawtypes")
	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryExam queryExam) {
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
	
	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryExam queryExam,int pint) {
		// TODO Auto-generated method stub
		 String select = "select id,name,code,starttime,endtime,duration,number,invigilatenameone,invigilatenametwo,status";
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
	
	
	public DataTablesModel pageDataTables() {
		 QueryExam queryExam = new QueryExam();
		// TODO Auto-generated method stub
		 String select = "select id,name,code,starttime,endtime,duration,number,invigilatenameone,invigilatenametwo,status";
		    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_exam ");
		    /**
		    if (search!=null&&!search.equals("")) {
		        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
		        parameters.add("%" + search + "%");
		        parameters.add("%" + search + "%");
		    } 
		     **/
		    sqlExceptSelect.append(whereQuery(queryExam));
		    
		    return this.paginateDataTables(1, 1, select, sqlExceptSelect.toString());
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
		if(query.getStarttimes()!=null&&!query.getStarttimes().equals("")){
			where  +=" and starttime < '"+DateUtil.toDateTimeStr(query.getStarttimes())+"'";
		}
		if(query.getEndtimes()!=null&&!query.getEndtimes().equals("")){
			where  +=" and endtime > '"+DateUtil.toDateTimeStr(query.getEndtimes())+"'";
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
	
	/**
	 * 查询正在考试的信息
	 * @param officeId
	 * @return
	 */
	public  List<Exam> getExamList(){
		List<Exam> lists = find("select t.* from sys_exam t where 1=1 and t.isdel = 0 and t.starttime <'"+DateUtil.toDateTimeStr(new Date())+"' and t.endtime >= '"+DateUtil.toDateTimeStr(new Date())+"'");
		return lists;
	}
	
	public DataTablesModel pageExamRecord(int pageNum, int pageSize, QueryExaminee queryExaminee) {
		// TODO Auto-generated method stub
		String select = "select t.id,t.code,t.name,t.starttime, t.endtime,t1.examineename ,t1.totalscore ,t1.status,t1.isfinishjudge ";
	    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_exam t ,sys_examinee t1 ");
	    sqlExceptSelect.append(whereQueryExamRecord(queryExaminee));
	    sqlExceptSelect.append(orderbyQueryExamRecord(queryExaminee));
	    return this.paginateDataTables(pageNum, pageSize, select.toString(), sqlExceptSelect.toString());
	}
	
	/**
	 * query where查询
	 * 
	 * */
	private String whereQueryExamRecord(QueryExaminee queryExaminee){
		String where=" where t.id = t1.exam_id ";
		if(!TypeChecker.isEmpty(queryExaminee.getExamId())){
			where += " and t.id = '"+queryExaminee.getExamId()+"'";
		}
		if(!TypeChecker.isEmpty(queryExaminee.getExamineeId())){
			where  +=" and t1.id = '"+queryExaminee.getExamineeId()+"'";
		}
		if(!TypeChecker.isEmpty(queryExaminee.getUserid())){
			where  +=" and t1.user_id = '"+queryExaminee.getUserid()+"'";
		}
		return where;
		
	}
	/**
	 * query order by 
	 * 
	 * */
	private String orderbyQueryExamRecord(QueryExaminee queryExaminee){
		String orderby = " order by t.starttime desc ";
		return orderby;
		
	}

	public List<Exam> getList() {
		// TODO Auto-generated method stub
		return find("select * from sys_exam where isdel = 0 and isenable =1 ");
	}

	public List<Exam> findExamByOfficeId(String id,String whereStr) {
		// TODO Auto-generated method stub
		List<Exam> list = new ArrayList<Exam>();
		list = find("select DISTINCT t3.* from sys_examinee t,sys_office_user t1,sys_exam t3 where t.exam_id = t3.id and t.user_id = t1.user_id and t1.office_id = ? "+whereStr,id);		
		return list;
	}
	
}


