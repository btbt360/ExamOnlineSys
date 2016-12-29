package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseExampapersQtypes<M extends BaseExampapersQtypes<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setTypename(java.lang.String typename) {
		set("typename", typename);
	}

	public java.lang.String getTypename() {
		return get("typename");
	}

	public void setSumtotal(java.lang.Integer sumtotal) {
		set("sumtotal", sumtotal);
	}

	public java.lang.Integer getSumtotal() {
		return get("sumtotal");
	}

	public void setSumscores(java.lang.Double sumscores) {
		set("sumscores", sumscores);
	}

	public java.lang.Double getSumscores() {
		return get("sumscores");
	}

	public void setExampapersId(java.lang.String exampapersId) {
		set("exampapers_id", exampapersId);
	}

	public java.lang.String getExampapersId() {
		return get("exampapers_id");
	}

	public void setTypeId(java.lang.Integer typeId) {
		set("type_id", typeId);
	}

	public java.lang.Integer getTypeId() {
		return get("type_id");
	}

}
