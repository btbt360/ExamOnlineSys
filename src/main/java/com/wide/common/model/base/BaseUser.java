package com.wide.common.model.base;

import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseUser<M extends BaseUser<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setLoginName(java.lang.String loginName) {
		set("login_name", loginName);
	}

	public java.lang.String getLoginName() {
		return get("login_name");
	}

	public void setPassword(java.lang.String password) {
		set("password", password);
	}

	public java.lang.String getPassword() {
		return get("password");
	}

	public void setNo(java.lang.String no) {
		set("no", no);
	}

	public java.lang.String getNo() {
		return get("no");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setEmail(java.lang.String email) {
		set("email", email);
	}

	public java.lang.String getEmail() {
		return get("email");
	}

	public void setPhone(java.lang.String phone) {
		set("phone", phone);
	}

	public java.lang.String getPhone() {
		return get("phone");
	}

	public void setMobile(java.lang.String mobile) {
		set("mobile", mobile);
	}

	public java.lang.String getMobile() {
		return get("mobile");
	}

	public void setUserType(java.lang.String userType) {
		set("user_type", userType);
	}

	public java.lang.String getUserType() {
		return get("user_type");
	}

	public void setPhoto(java.lang.String photo) {
		set("photo", photo);
	}

	public java.lang.String getPhoto() {
		return get("photo");
	}

	public void setLoginIp(java.lang.String loginIp) {
		set("login_ip", loginIp);
	}

	public java.lang.String getLoginIp() {
		return get("login_ip");
	}

	public void setLoginDate(java.util.Date loginDate) {
		set("login_date", loginDate);
	}

	public java.util.Date getLoginDate() {
		return get("login_date");
	}

	public void setLoginFlag(java.lang.String loginFlag) {
		set("login_flag", loginFlag);
	}

	public java.lang.String getLoginFlag() {
		return get("login_flag");
	}

	public void setCreateBy(java.lang.String createBy) {
		set("create_by", createBy);
	}

	public java.lang.String getCreateBy() {
		return get("create_by");
	}

	public void setCreateDate(java.util.Date createDate) {
		set("create_date", createDate);
	}

	public java.util.Date getCreateDate() {
		return get("create_date");
	}

	public void setUpdateBy(java.lang.String updateBy) {
		set("update_by", updateBy);
	}

	public java.lang.String getUpdateBy() {
		return get("update_by");
	}

	public void setUpdateDate(java.util.Date updateDate) {
		set("update_date", updateDate);
	}

	public java.util.Date getUpdateDate() {
		return get("update_date");
	}

	public void setRemarks(java.lang.String remarks) {
		set("remarks", remarks);
	}

	public java.lang.String getRemarks() {
		return get("remarks");
	}

	public void setDelFlag(java.lang.String delFlag) {
		set("del_flag", delFlag);
	}

	public java.lang.String getDelFlag() {
		return get("del_flag");
	}
	
	public void setCardno(java.lang.String cardno) {
		set("cardno", cardno);
	}

	public java.lang.String getCardno() {
		return get("cardno");
	}

	public void setFingerprintone(java.lang.String fingerprintone) {
		set("fingerprintone", fingerprintone);
	}

	public java.lang.String getFingerprintone() {
		return get("fingerprintone");
	}
	
	public void setFingerprinttwo(java.lang.String fingerprinttwo) {
		set("fingerprinttwo", fingerprinttwo);
	}

	public java.lang.String getFingerprinttwo() {
		return get("fingerprinttwo");
	}
	
	public void setIsonline(java.lang.Integer isonline) {
		set("isonline", isonline);
	}

	public java.lang.Integer getIsonline() {
		return get("isonline");
	}
}
