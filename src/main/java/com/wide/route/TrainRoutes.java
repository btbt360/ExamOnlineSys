package com.wide.route;

import com.jfinal.config.Routes;
import com.wide.baseproject.exam.controller.AchievementController;
import com.wide.baseproject.exam.controller.BespeakExamContrller;
import com.wide.baseproject.exam.controller.ErrorSubjectController;
import com.wide.baseproject.exam.controller.ExamController;
import com.wide.baseproject.exam.controller.ExamineeController;
import com.wide.baseproject.exam.controller.ExampapersController;
import com.wide.baseproject.exam.controller.InvigilateController;
import com.wide.baseproject.train.controller.CurriculumController;
import com.wide.baseproject.train.controller.TrainController;

public class TrainRoutes extends Routes{

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/train",TrainController.class,"/pages/train/");
		add("/curriculum",CurriculumController.class,"/pages/train/");
	}

}
