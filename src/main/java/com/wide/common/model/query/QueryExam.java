package com.wide.common.model.query;

import java.util.Date;

public class QueryExam {

	private String name;
	private Date starttimes;
	private Date endtimes;
	private String code;
	private String userid;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStarttimes() {
		return starttimes;
	}

	public void setStarttimes(Date starttimes) {
		this.starttimes = starttimes;
	}

	public Date getEndtimes() {
		return endtimes;
	}

	public void setEndtimes(Date endtimes) {
		this.endtimes = endtimes;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
