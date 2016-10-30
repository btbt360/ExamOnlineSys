package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.IBean;
import com.wide.config.DbModel;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseExam<M extends BaseExam<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setCode(java.lang.String code) {
		set("code", code);
	}

	public java.lang.String getCode() {
		return get("code");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setStarttime(java.util.Date starttime) {
		set("starttime", starttime);
	}

	public java.util.Date getStarttime() {
		return get("starttime");
	}

	public void setEndtime(java.util.Date endtime) {
		set("endtime", endtime);
	}

	public java.util.Date getEndtime() {
		return get("endtime");
	}

	public void setDuration(java.lang.Double duration) {
		set("duration", duration);
	}

	public java.lang.Double getDuration() {
		return get("duration");
	}

	public void setAddress(java.lang.String address) {
		set("address", address);
	}

	public java.lang.String getAddress() {
		return get("address");
	}

	public void setNumber(java.lang.Integer number) {
		set("number", number);
	}

	public java.lang.Integer getNumber() {
		return get("number");
	}

	public void setInvigilatenameone(java.lang.String invigilatenameone) {
		set("invigilatenameone", invigilatenameone);
	}

	public java.lang.String getInvigilatenameone() {
		return get("invigilatenameone");
	}

	public void setInvigilatenametwo(java.lang.String invigilatenametwo) {
		set("invigilatenametwo", invigilatenametwo);
	}

	public java.lang.String getInvigilatenametwo() {
		return get("invigilatenametwo");
	}

	public void setDemand(java.lang.String demand) {
		set("demand", demand);
	}

	public java.lang.String getDemand() {
		return get("demand");
	}

	public void setInstitution(java.lang.String institution) {
		set("institution", institution);
	}

	public java.lang.String getInstitution() {
		return get("institution");
	}

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
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
	
	public void setExampapersId(java.lang.String exampapersId) {
		set("exampapers_id", exampapersId);
	}

	public java.lang.String getExampapersId() {
		return get("exampapers_id");
	}
	
	public void setEnddistancetime(java.lang.Integer enddistancetime) {
		set("enddistancetime", enddistancetime);
	}

	public java.lang.Integer getEnddistancetime() {
		return get("enddistancetime");
	}
	
	public void setSelectedfinish(java.lang.Integer selectedfinish) {
		set("selectedfinish", selectedfinish);
	}

	public java.lang.Integer getSelectedfinish() {
		return get("selectedfinish");
	}
	
}
