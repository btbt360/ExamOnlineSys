package com.wide.common.model;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.base.BaseQuestionoptions;

/**
 * Generated by JFinal.
 */
@SuppressWarnings("serial")
public class Questionoptions extends BaseQuestionoptions<Questionoptions> {
	public static final Questionoptions dao = new Questionoptions();
	/**
	 * 根据问题获取选项
	 * */
	public List<Questionoptions> findByQuestionId(String id) {
		// TODO Auto-generated method stub
		List<Questionoptions> list = new ArrayList<Questionoptions>();
		list = find("select * from sys_questionoptions where isenable = 1 and isdel = 0 and questions_id = ? order by code asc ", id);
		return list;
	}
}
