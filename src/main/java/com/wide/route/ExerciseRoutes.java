package com.wide.route;

import com.jfinal.config.Routes;
import com.wide.baseproject.exam.controller.ExamController;
import com.wide.baseproject.exercise.controller.ExerciseController;
import com.wide.baseproject.exercise.controller.SimulationController;

public class ExerciseRoutes extends Routes{

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/exercise",ExerciseController.class,"/pages/exercise/");
		add("/simulation",SimulationController.class,"/pages/exercise/");
	}

}
