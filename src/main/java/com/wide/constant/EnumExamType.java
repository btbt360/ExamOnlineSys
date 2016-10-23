package com.wide.constant;

public enum EnumExamType {

	//考生状态 : 
	nostart(0,"未开始考试"),
	takingexam(1,"正在考试"),
	endexam(2,"完成考试"),
	notbeingexam(3,"未参加考试"),
	examcheat(4,"考试作弊");
	
	private int enumKey;
	private String enumText;

	private EnumExamType(int key, String text) {
		this.enumKey = key;
		this.enumText = text;
	}

	public int getEnumKey() {
		return enumKey;
	}

	public String getEnumText() {
		return enumText;
	}
	
	public static final String getFromKey(int key) {
		for (EnumExamType e : EnumExamType.values()) {
			if (e.getEnumKey()==key) {
				return e.getEnumText();
			}
		}
		return null;
	}
}
