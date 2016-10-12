package com.wide.route;

import com.jfinal.config.Routes;
import com.wide.baseproject.resource.controller.SubjectController;

public class ResourceRoutes extends Routes{

	@Override
	public void config() {
		// TODO Auto-generated method stub
		add("/Subject",SubjectController.class,"/pages/resource/");
	}

}
