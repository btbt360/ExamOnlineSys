package com.wide.route;

import com.jfinal.config.Routes;
import com.wide.baseproject.exam.controller.InvigilateController;
import com.wide.baseproject.sys.controller.LogController;

public class ExamRoutes extends Routes{

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/invigilate",InvigilateController.class,"/pages/exam");
	}

}
