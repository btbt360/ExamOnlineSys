package com.wide.common.model;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;

/**
 * Generated by JFinal, do not modify this file.
 * <pre>
 * Example:
 * public void configPlugin(Plugins me) {
 *     ActiveRecordPlugin arp = new ActiveRecordPlugin(...);
 *     _MappingKit.mapping(arp);
 *     me.add(arp);
 * }
 * </pre>
 */
public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("sys_area", "id", Area.class);
		arp.addMapping("sys_case", "id", Case.class);
		arp.addMapping("sys_dict", "id", Dict.class);
		arp.addMapping("sys_error", "id", Error.class);
		arp.addMapping("sys_exam", "id", Exam.class);
		arp.addMapping("sys_exam_answer", "id", ExamAnswer.class);
		arp.addMapping("sys_examinee", "id", Examinee.class);
		arp.addMapping("sys_exampapers", "id", Exampapers.class);
		arp.addMapping("sys_exampapers_qtypes", "id", ExampapersQtypes.class);
		arp.addMapping("sys_exampapers_question", "id", ExampapersQuestion.class);
		arp.addMapping("sys_exercise", "id", Exercise.class);
		arp.addMapping("sys_exercise_question", "id", ExerciseQuestion.class);
		arp.addMapping("sys_folder", "id", Folder.class);
		arp.addMapping("sys_itembank", "id", Itembank.class);
		arp.addMapping("sys_log", "id", Log.class);
		arp.addMapping("sys_menu", "id", Menu.class);
		arp.addMapping("sys_office", "id", Office.class);
		// Composite Primary Key order: office_id,user_id
		arp.addMapping("sys_office_user", "office_id,user_id", OfficeUser.class);
		arp.addMapping("sys_questionoptions", "id", Questionoptions.class);
		arp.addMapping("sys_questions", "id", Questions.class);
		arp.addMapping("sys_right", "id", Right.class);
		arp.addMapping("sys_role", "id", Role.class);
		// Composite Primary Key order: office_id,role_id
		arp.addMapping("sys_role_office", "office_id,role_id", RoleOffice.class);
		// Composite Primary Key order: right_id,role_id
		arp.addMapping("sys_role_right", "right_id,role_id", RoleRight.class);
		arp.addMapping("sys_subject", "id", Subject.class);
		arp.addMapping("sys_textbook", "id", Textbook.class);
		arp.addMapping("sys_user", "id", User.class);
		// Composite Primary Key order: role_id,user_id
		arp.addMapping("sys_user_role", "role_id,user_id", UserRole.class);
	}
}

