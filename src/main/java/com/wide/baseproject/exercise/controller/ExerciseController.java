package com.wide.baseproject.exercise.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exercise.service.ExerciseService;
import com.wide.baseproject.resource.service.QuestionsService;
import com.wide.baseproject.resource.service.SubjectService;
import com.wide.common.model.Dict;
import com.wide.common.model.Exercise;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExercise;
import com.wide.viewmodel.DataTablesModel;

public class ExerciseController extends BaseController{
	private static final ExerciseService exerciseService = Enhancer.enhance(ExerciseService.class);
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	
	/**
	 * @author lubin
	 *  考试添加
	 * 
	 * */
	public void addExercise(){
		List<Dict> dictlist = new ArrayList<Dict>();
		dictlist = Dict.dao.getDictByType("1002");
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		setAttr("dictlist", dictlist);
		setAttr("subjectlist",subjectlist);
		
		render("exerciseList.jsp");
		
	}
	
	/**
	 * @author lubin
	 * 考试列表
	 * */
	public void getExerciselist(){
		QueryExercise queryExercise = new QueryExercise();
		queryExercise.setName(getPara("name"));
		DataTablesModel exercisepage = exerciseService.getPageExercise(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExercise);
		this.renderJson(exercisepage);
	}
	/**
	 * @author lubin
	 * 考试添加详细
	 * 
	 * */
	public void addExerciseInfo(){
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		String id = getPara("id");
		Exercise exercise = null;
		if(id!=null&&!id.equals("")){
			exercise = Exercise.dao.findById(id);
		}else{
			exercise = new Exercise();
		}
		setAttr("flagcg", getPara("flagcg"));
		setAttr("exercise", exercise);
		setAttr("subjectlist",subjectlist);
		render("exerciseInfo.jsp");
	}
	/**
	 * @author lubin
	 * 考试保存
	 * 
	 * */
	
	public void saveExercise(){
		int flagcg=0;
		try{
			Exercise exercise = getModel(Exercise.class)==null||getModel(Exercise.class).equals("")?new Exercise():getModel(Exercise.class);
			if(exercise.getId()!=null&&!exercise.getId().equals("")){
				exercise.setUpdateBy(getUser().getId());
				exercise.setUpdateDate(new Date());
				exercise.update();
			}else{
				exercise.setId(createUUid());
				exercise.setUserId(getUser().getId());
				exercise.setCreatorId(getUser().getId());
				exercise.setCreateDate(new Date());
				exercise.setUpdateBy(getUser().getId());
				exercise.setUpdateDate(new Date());
				exercise.setIsdel(0);
				exercise.save();
			}
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
			
		}
		redirect("/exercise/addExerciseInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author lubin
	 * 考试删除
	 * */
	public void delExercise(){
		returninfo = new RenturnInfo();
		String id = getPara("id");
		try{
			if(id!=null&&!id.equals("")){
				Db.update("update sys_exercise set isdel = 1 where id = ? ",id);
			}
			returninfo.setResult(0);
			returninfo.setResultInfo("删除成功！");
		}catch(Exception ex){
			ex.printStackTrace();
			returninfo.setResult(1);
			returninfo.setResultInfo("删除失败！");
		}
		setAttr("returninfo", returninfo);
		renderJson();
	}
}
