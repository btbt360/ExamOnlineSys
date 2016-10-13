package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseExaminee<M extends BaseExaminee<M>> extends Model<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setExampapersId(java.lang.String exampapersId) {
		set("exampapers_id", exampapersId);
	}

	public java.lang.String getExampapersId() {
		return get("exampapers_id");
	}

	public void setExamId(java.lang.String examId) {
		set("exam_id", examId);
	}

	public java.lang.String getExamId() {
		return get("exam_id");
	}

	public void setUserId(java.lang.String userId) {
		set("user_id", userId);
	}

	public java.lang.String getUserId() {
		return get("user_id");
	}

	public void setStatus(java.lang.Integer status) {
		set("status", status);
	}

	public java.lang.Integer getStatus() {
		return get("status");
	}

	public void setFingerprint(java.lang.String fingerprint) {
		set("fingerprint", fingerprint);
	}

	public java.lang.String getFingerprint() {
		return get("fingerprint");
	}

	public void setTicketcode(java.lang.String ticketcode) {
		set("ticketcode", ticketcode);
	}

	public java.lang.String getTicketcode() {
		return get("ticketcode");
	}

	public void setSeatno(java.lang.Integer seatno) {
		set("seatno", seatno);
	}

	public java.lang.Integer getSeatno() {
		return get("seatno");
	}

	public void setMacaddress(java.lang.String macaddress) {
		set("macaddress", macaddress);
	}

	public java.lang.String getMacaddress() {
		return get("macaddress");
	}

	public void setIpaddress(java.lang.String ipaddress) {
		set("ipaddress", ipaddress);
	}

	public java.lang.String getIpaddress() {
		return get("ipaddress");
	}

	public void setPhotoname(java.lang.String photoname) {
		set("photoname", photoname);
	}

	public java.lang.String getPhotoname() {
		return get("photoname");
	}

	public void setPhotocontant(byte[] photocontant) {
		set("photocontant", photocontant);
	}

	public byte[] getPhotocontant() {
		return get("photocontant");
	}

	public void setExtension(java.lang.String extension) {
		set("extension", extension);
	}

	public java.lang.String getExtension() {
		return get("extension");
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
	
	public void setTotalscore(java.lang.Integer totalscore) {
		set("totalscore", totalscore);
	}

	public java.lang.Integer getTotalscore() {
		return get("totalscore");
	}
	
	public void setScoreslevel(java.lang.Integer scoreslevel) {
		set("scoreslevel", scoreslevel);
	}

	public java.lang.Integer getScoreslevel() {
		return get("scoreslevel");
	}

}
