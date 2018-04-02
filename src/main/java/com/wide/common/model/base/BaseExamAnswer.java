package com.wide.common.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.wide.config.DbModel;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseExamAnswer<M extends BaseExamAnswer<M>> extends DbModel<M> implements IBean {

	public void setId(java.lang.String id) {
		set("id", id);
	}

	public java.lang.String getId() {
		return get("id");
	}

	public void setExamineeId(java.lang.String examineeId) {
		set("examinee_id", examineeId);
	}

	public java.lang.String getExamineeId() {
		return get("examinee_id");
	}

	public void setExamId(java.lang.String examId) {
		set("exam_id", examId);
	}

	public java.lang.String getExamId() {
		return get("exam_id");
	}

	public void setQuestionId(java.lang.String questionId) {
		set("question_id", questionId);
	}

	public java.lang.String getQuestionId() {
		return get("question_id");
	}

	public void setAnswerinfo(java.lang.String answerinfo) {
		set("answerinfo", answerinfo);
	}

	public java.lang.String getAnswerinfo() {
		return get("answerinfo");
	}

	public void setAnswerscores(java.lang.Double answerscores) {
		set("answerscores", answerscores);
	}

	public java.lang.Double getAnswerscores() {
		return get("answerscores");
	}

	public void setJudgetype(java.lang.Integer judgetype) {
		set("judgetype", judgetype);
	}

	public java.lang.Integer getJudgetype() {
		return get("judgetype");
	}

	public void setJudgepeopleid(java.lang.String judgepeopleid) {
		set("judgepeopleid", judgepeopleid);
	}

	public java.lang.String getJudgepeopleid() {
		return get("judgepeopleid");
	}

	public void setJudgepeoplename(java.lang.String judgepeoplename) {
		set("judgepeoplename", judgepeoplename);
	}

	public java.lang.String getJudgepeoplename() {
		return get("judgepeoplename");
	}

	public void setJudgetime(java.util.Date judgetime) {
		set("judgetime", judgetime);
	}

	public java.util.Date getJudgetime() {
		return get("judgetime");
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
