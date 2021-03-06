package com.wide.common.model;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.base.BaseMenu;
import com.jfinal.plugin.activerecord.Db;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Menu extends BaseMenu<Menu> {
	public static final Menu dao = new Menu();
	
	public List<Menu> getMenuAll(){
		List<Menu> list= find("select * from sys_menu where del_flag = 0 order by sort asc");
		return list;
		
	}

	public List<Menu> findByPid(String id) {
		// TODO Auto-generated method stub
		List<Menu> list = new ArrayList<Menu>();
		list= find("select * from sys_menu where del_flag = 0 and parent_id = '"+id+"'");
		return list;
	}

	public List<Object[]> findByMenuPid(String id) {
		// TODO Auto-generated method stub
		List<Object[]> list = new ArrayList<Object[]>();
		list= Db.query("select t1.id,t1.parent_id,t1.name,t2.id from sys_menu t1,sys_right t2 where t1.del_flag = 0 and t1.id = t2.resourcesid and t2.resourcestype = 1 "
				+ "and t1.parent_id = '"+id+"'");
		return list;
	}
	/**
	 * 
	 * 迭代查询机构
	 * */
	public static void sortList(List<Menu> list, List<Menu> sourcelist, String parentId, boolean cascade){
		for (int i=0; i<sourcelist.size(); i++){
			Menu e = sourcelist.get(i);
			if ( e.getParentId() != null && e.getParentId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Menu child = sourcelist.get(j);
						if (child.getParentId() != null && child.getParentId().equals(e.getId())){
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	
	}
}
