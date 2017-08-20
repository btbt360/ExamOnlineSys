package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseExercise<M extends BaseExercise<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setUserId(java.lang.String userId) {
		set("user_id", userId);
	}

	public java.lang.String getUserId() {
		return get("user_id");
	}

	public void setSubjectId(java.lang.String subjectId) {
		set("subject_id", subjectId);
	}

	public java.lang.String getSubjectId() {
		return get("subject_id");
	}

	public void setItembankId(java.lang.String itembankId) {
		set("itembank_id", itembankId);
	}

	public java.lang.String getItembankId() {
		return get("itembank_id");
	}

	public void setSumcount(java.lang.Integer sumcount) {
		set("sumcount", sumcount);
	}

	public java.lang.Integer getSumcount() {
		return get("sumcount");
	}

	public void setAlreadycount(java.lang.Integer alreadycount) {
		set("alreadycount", alreadycount);
	}

	public java.lang.Integer getAlreadycount() {
		return get("alreadycount");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setCreatorId(java.lang.String creatorId) {
		set("creator_id", creatorId);
	}

	public java.lang.String getCreatorId() {
		return get("creator_id");
	}

	public void setCreateDate(java.util.Date createDate) {
		set("create_date", createDate);
	}

	public java.util.Date getCreateDate() {
		return get("create_date");
	}

	public void setUpdateDate(java.util.Date updateDate) {
		set("update_date", updateDate);
	}

	public java.util.Date getUpdateDate() {
		return get("update_date");
	}

	public void setUpdateBy(java.lang.String updateBy) {
		set("update_by", updateBy);
	}

	public java.lang.String getUpdateBy() {
		return get("update_by");
	}

	public void setRemark(java.lang.String remark) {
		set("remark", remark);
	}

	public java.lang.String getRemark() {
		return get("remark");
	}

	public void setIsenable(java.lang.Integer isenable) {
		set("isenable", isenable);
	}

	public java.lang.Integer getIsenable() {
		return get("isenable");
	}

	public void setIsdel(java.lang.Integer isdel) {
		set("isdel", isdel);
	}

	public java.lang.Integer getIsdel() {
		return get("isdel");
	}

	public void setExercisetype(java.lang.Integer exercisetype) {
		set("exercisetype", exercisetype);
	}

	public java.lang.Integer getExercisetype() {
		return get("exercisetype");
	}

}
