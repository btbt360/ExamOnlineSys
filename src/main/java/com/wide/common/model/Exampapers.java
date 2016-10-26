package com.wide.common.model;

import java.util.List;

import com.wide.common.model.base.BaseExampapers;
import com.wide.common.model.query.QueryExaminee;
import com.wide.common.model.query.QueryExampapers;
import com.wide.util.DateUtil;
import com.wide.viewmodel.DataTablesModel;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Exampapers extends BaseExampapers<Exampapers> {
	public static final Exampapers dao = new Exampapers();

	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryExampapers queryExampapers) {
		// TODO Auto-generated method stub
		 String select = "select id,code,name,sumscore,usecount,sumquestion,isenable";
		    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_exampapers ");
		    /**
		    if (search!=null&&!search.equals("")) {
		        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
		        parameters.add("%" + search + "%");
		        parameters.add("%" + search + "%");
		    } 
		     **/
		    sqlExceptSelect.append(whereQuery(queryExampapers));
		    sqlExceptSelect.append(orderbyQuery(queryExampapers));
		    
		    return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
		}
		/**
		 * query where查询
		 * 
		 * */
		private String whereQuery(QueryExampapers queryExampapers){
			String where=" where 1=1  and isdel = 0 and isenable = 1 ";
			if(queryExampapers.getCode()!=null&&!queryExampapers.getCode().equals("")){
				where += " and code = '"+queryExampapers.getCode()+"'";
			}
			if(queryExampapers.getCreatetimes()!=null&&!queryExampapers.getCreatetimes().equals("")){
				where += " and create_date < '"+DateUtil.toDateTimeStr(queryExampapers.getCreatetimes())+"'";
			}
			if(queryExampapers.getCreatetimee()!=null&&!queryExampapers.getCreatetimee().equals("")){
				where += " and create_date > '"+queryExampapers.getCreatetimee()+"'";
			}
			if(queryExampapers.getName()!=null&&!queryExampapers.getName().equals("")){
				where += " and name =%'"+queryExampapers.getName()+"'%";
			}
			return where;
			
		}
		/**
		 * query order by 
		 * 
		 * */
		private String orderbyQuery(QueryExampapers queryExampapers){
			String orderby = " order by create_date desc ";
			return orderby;
			
		}
		
		public List<Exampapers> getExampapersAll(){
			String sql = "select * from sys_exampapers where isdel = 0 and isenable = 1";
			List<Exampapers> list = find(sql);
			return list;
		}
	}
