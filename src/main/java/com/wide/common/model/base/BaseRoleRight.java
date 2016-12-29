package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseRoleRight<M extends BaseRoleRight<M>> extends DbModel<M> implements IBean {

	public void setRoleId(java.lang.String roleId) {
		set("role_id", roleId);
	}

	public java.lang.String getRoleId() {
		return get("role_id");
	}

	public void setRightId(java.lang.String rightId) {
		set("right_id", rightId);
	}

	public java.lang.String getRightId() {
		return get("right_id");
	}

}
