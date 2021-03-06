package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseCurriculum<M extends BaseCurriculum<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setCoursename(java.lang.String coursename) {
		set("coursename", coursename);
	}

	public java.lang.String getCoursename() {
		return get("coursename");
	}

	public void setCoursetitle(java.lang.String coursetitle) {
		set("coursetitle", coursetitle);
	}

	public java.lang.String getCoursetitle() {
		return get("coursetitle");
	}

	public void setCourselabel(java.lang.String courselabel) {
		set("courselabel", courselabel);
	}

	public java.lang.String getCourselabel() {
		return get("courselabel");
	}

	public void setCourseleaturer(java.lang.String courseleaturer) {
		set("courselecturer", courseleaturer);
	}

	public java.lang.String getCourseleaturer() {
		return get("courseleaturer");
	}

	public void setCoursematerial(java.lang.String coursematerial) {
		set("coursematerial", coursematerial);
	}

	public java.lang.String getCoursematerial() {
		return get("coursematerial");
	}

	public void setCourseinfo(java.lang.String courseinfo) {
		set("courseinfo", courseinfo);
	}

	public java.lang.String getCourseinfo() {
		return get("courseinfo");
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

}
