package com.wide.baseproject.exercise.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.jfinal.aop.Enhancer;
import com.jfinal.plugin.activerecord.Db;
import com.wide.base.BaseController;
import com.wide.base.RenturnInfo;
import com.wide.baseproject.exercise.service.SimulationService;
import com.wide.common.model.Dict;
import com.wide.common.model.Exercise;
import com.wide.common.model.Questions;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExercise;
import com.wide.util.TypeChecker;
import com.wide.viewmodel.DataTablesModel;

public class SimulationController extends BaseController{
	private static final SimulationService simulationService = Enhancer.enhance(SimulationService.class);
	
	/**
	 * @author lubin
	 *  模拟考试添加
	 * 
	 * */
	public void addExercise(){
		List<Dict> dictlist = new ArrayList<Dict>();
		dictlist = Dict.dao.getDictByType("1002");
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		setAttr("dictlist", dictlist);
		setAttr("subjectlist",subjectlist);
		render("simulationList.jsp");
		
	}
	
	/**
	 * @author lubin
	 * 模拟考试列表
	 * */
	public void getExerciselist(){
		QueryExercise queryExercise = new QueryExercise();
		queryExercise.setName(getPara("name"));
		queryExercise.setItembankid(getPara("itembankid"));
		queryExercise.setSubjectid(getPara("subjectid"));
		queryExercise.setUserid(getUser().getId());
		DataTablesModel exercisepage = simulationService.getPageExercise(getParaToInt("page")
				.intValue(), getParaToInt("rp").intValue(), queryExercise);
		this.renderJson(exercisepage);
	}
	/**
	 * @author lubin
	 * 模拟考试添加详细
	 * 
	 * */
	public void addExerciseInfo(){
		List<Subject> subjectlist = new ArrayList<Subject>();
		subjectlist = Subject.dao.getAllSubject();
		String id = getPara("id");
		Exercise exercise = null;
		String subjectname = "";
		Subject subject = new Subject();
		if(id!=null&&!id.equals("")){
			exercise = Exercise.dao.findById(id);
			subject = Subject.dao.findById(exercise.getSubjectId());
			subjectname = subject.getName();
		}else{
			exercise = new Exercise();
		}
		setAttr("flagcg", getPara("flagcg"));
		setAttr("exercise", exercise);
		setAttr("subjectname", subjectname);
		setAttr("subjectlist",subjectlist);
		render("simulationInfo.jsp");
	}
	/**
	 * @author lubin
	 * 模拟考试保存
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
				exercise.setExercisetype(1);
				exercise.setIsdel(0);
				exercise.save();
			}
			flagcg = 1;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		redirect("/simulation/addExerciseInfo?flagcg="+flagcg, true);
	}
	/**
	 * @author lubin
	 * 模拟考试删除
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
	/**
	 * @author cg
	 * 开始模拟考试
	 * */
	public void startExercise(){
		String exerciseid = getPara("exerciseid");
		int sort=!TypeChecker.isEmpty(getPara("sort"))?getParaToInt("sort"):0;
		int flag = !TypeChecker.isEmpty(getPara("flag"))?getParaToInt("flag"):0;
		String username = getUser().getName();
		List<Questions> questionslist = new ArrayList<Questions>();
		Exercise exercise = new Exercise();
		Questions questions= new Questions();
		try{
			if(!TypeChecker.isEmpty(exerciseid)){
				exercise = Exercise.dao.findById(exerciseid);
				if(!TypeChecker.isEmpty(exercise)){
					questionslist= simulationService.findQuestionsByItSu(exercise,sort,flag);
					if(questionslist.size()>0){
						questions=questionslist.get(0);
					}
				}
				if(flag==0){
					exercise.setAlreadycount(sort==0?exercise.getAlreadycount():sort);
					exercise.update();
				}else if(flag==1){
					exercise.setAlreadycount(0);
					exercise.update();
				}
				
			}
			if(TypeChecker.isEmpty(questions.getId())){
				questions.setTitle("<h1>模拟考试已经结束!</h1>");
				setAttr("flag", 1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		setAttr("username", username);
		setAttr("questions", questions);
		setAttr("exerciseid", getPara("exerciseid"));
		setAttr("sort",exercise.getAlreadycount()+1);
		render("startSimulation.jsp");
	}
}
