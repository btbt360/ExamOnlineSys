package com.wide.common.model;

import java.util.List;

import com.wide.common.model.base.BaseExaminee;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QueryExaminee;
import com.wide.util.DateUtil;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Examinee extends BaseExaminee<Examinee> {
	public static final Examinee dao = new Examinee();

	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryExaminee queryExaminee, int flag) {
		// TODO Auto-generated method stub
		 String select = "";
		 StringBuilder sqlExceptSelect = new StringBuilder("");
		 if(flag==2){
			 select = "select t1.id,t.code,t.name,t.starttime,t.endtime,t1.examineename,t1.totalscore,t1.status ";
			 sqlExceptSelect.append((" from sys_exam t, sys_examinee t1 "));
			 sqlExceptSelect.append(whereQuery(queryExaminee,flag));
			 sqlExceptSelect.append(orderbyQuery(queryExaminee,flag));
		 }else{
			 select = "select t.id,t.seatno,t.examineename,t1.cardno,t.fingerprint,t.sculpturepath,t.status";
			 sqlExceptSelect.append((" from sys_examinee t ,sys_user t1"));
			 sqlExceptSelect.append(whereQuery(queryExaminee,flag));
			 sqlExceptSelect.append(orderbyQuery(queryExaminee,flag));
		 } 
		 return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
		}
		/**
		 * query where查询
		 * 
		 * */
		private String whereQuery(QueryExaminee queryExaminee,int flag){
			String where="";
			if(flag==2){
				where = where+" where 1=1  and t.isdel = 0 and t.isenable = 1 and t.id = t1.exam_id ";
				if(!TypeChecker.isEmpty(queryExaminee.getExamId())){
					where += " and t.id = '"+queryExaminee.getExamId()+"'";
				}
				if(!TypeChecker.isEmpty(queryExaminee.getExamineeId())){
					where += " and t1.id = '"+queryExaminee.getExamineeId()+"'";
				}
				if(!TypeChecker.isEmpty(queryExaminee.getStarttime())){
					where += " and t.starttime > '"+queryExaminee.getStarttime()+"'";
				}
				if(!TypeChecker.isEmpty(queryExaminee.getEndtime())){
					where += " and t.endtime < '"+queryExaminee.getEndtime()+"'";
				}
			}else{
				where = where+" where 1=1  and t.isdel = 0 and t.isenable = 1 and t.user_id = t1.id ";
				if(queryExaminee.getExamId()!=null&&!queryExaminee.getExamId().equals("")){
					where += " and t.exam_id = '"+queryExaminee.getExamId()+"'";
				}
				if(queryExaminee.getExampapers_id()!=null&&!queryExaminee.getExampapers_id().equals("")){
					where += " and t.exampapers_id = '"+queryExaminee.getExampapers_id()+"'";
				}
				if(queryExaminee.getName()!=null&&!queryExaminee.getName().equals("")){
					where += " and t.examineename like '%"+queryExaminee.getName()+"%'";
				}
				if(queryExaminee.getExamineeId()!=null&&!queryExaminee.getExamineeId().equals("")){
					where += " and t.id ='"+queryExaminee.getExamineeId()+"'";
				}
			}
			return where;
			
		}
		/**
		 * query order by 
		 * 
		 * */
		private String orderbyQuery(QueryExaminee queryExaminee,int flag){
			String orderby  = "";
			if(flag==2){
				orderby = " order by t.create_date desc ";
			}else{
				orderby = " order by t.seatno, t.create_date desc ";
			}
			return orderby;
			
		}
		
		/**
		 * 通过exam_id查询考生列表
		 * @param examId
		 * @return
		 */
		public List<Examinee> getExamineeByExamId(String examId){
			List<Examinee> list = find("select t.* from sys_examinee t where t.isenable = 1 and t.exam_id = ?",examId);
			return list;
		}
	}
