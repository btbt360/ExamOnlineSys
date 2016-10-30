package com.wide.common.model;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.User;
import com.wide.common.model.base.BaseUser;
import com.wide.common.model.query.QueryUser;
import com.wide.viewmodel.DataTablesModel;
import com.jfinal.plugin.activerecord.Page;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class User extends BaseUser<User> {
	public static final User dao = new User();
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
	 */
	public Page<User> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from sys_user order by id asc");
	}
	
	public List<User> findLogin(User user){
		
		List<User> users = find("select * from sys_user where login_name = ? and password = ? and login_flag=1 and del_flag = 0",user.getLoginName(),user.getPassword());		
		return users;
	}

	/**
	 * datatables 查询
	 * @param @param pageNum
	 * @param @param iDisplayLength
	 * @param @param select
	 * @param @param sqlExceptSelect
	 * @param @param search    设定文件
	 * @return void    返回类型
	 * @throws
	 */
	public DataTablesModel pageDataTables(int pageNum, int pageSize, QueryUser queryUser) {
	    final List<Object> parameters = new ArrayList<Object>();
	    String select = "select id,name,login_name,email,mobile,user_type,login_flag,isonline ";
	    StringBuilder sqlExceptSelect = new StringBuilder(" from sys_user  ");
	    /**
	    if (search!=null&&!search.equals("")) {
	        sqlExceptSelect.append(" AND (b.title like ? or b.content like ? )");
	        parameters.add("%" + search + "%");
	        parameters.add("%" + search + "%");
	    } 
	     **/
	    sqlExceptSelect.append(whereQuery(queryUser));
	    sqlExceptSelect.append(orderbyQuery(queryUser));
	    
	    return this.paginateDataTables(pageNum, pageSize, select, sqlExceptSelect.toString());
	}
	
	/**
	 * query where查询
	 * 
	 * */
	private String whereQuery(QueryUser query){
		String where=" where 1=1  and del_flag = 0 ";
		if(query.getUsername()!=null&&!query.getUsername().equals("")){
			where += " and name like '%"+query.getUsername()+"%'";
		}
		if(query.getUsertype()!=0){
			where  +=" and user_type = "+query.getUsertype();
		}
		if(query.getStarttime()!=null&&!query.getStarttime().equals("")){
			where  +=" and create_date >= '"+query.getStarttime()+"'";
		}
		if(query.getEndtime()!=null&&!query.getEndtime().equals("")){
			where  +=" and create_date <=  '"+query.getEndtime().replace("00:00:00", "23:59:59")+"'";
		}
		return where;
		
	}
	/**
	 * query order by 
	 * 
	 * */
	private String orderbyQuery(QueryUser query){
		String orderby = " order by create_date desc ";
		return orderby;
		
	}
   /**
    * 根据登录名和密码查询用户
    * @param loginname
    * @param password
    * @return Boolean 查询到为true
    */
	public Boolean getUserBylogininfo(String loginname, String password) {
		
		Boolean u =true;
		List<User> users = find("select * from sys_user where login_name = ? and password = ? and login_flag=1 and del_flag = 0",loginname,password);		
		if(users.size()>0){			
			u =true;
		}else{
			u=false;
		}
		return u;
	}


	public User findByUsername(String username) {
		
		// TODO Auto-generated method stub
		List<User> list = find("select * from sys_user where login_name = ? ",username);
		User user = new User();
		if(list!=null&&list.size()>0){
			user = list.get(0);
		}
		return user;
	}
	
	/**
	 * 通过机构id获取用户信息
	 * @param officeId
	 * @return
	 */
	public  List<User> getUserByOfficeId(String officeId){
		List<User> lists = find("select * from sys_user t1 where t1.id in (select t.user_id from sys_office_user t where 1=1 and t.office_id = ?)",officeId);
		return lists;
	}
	
	
}
