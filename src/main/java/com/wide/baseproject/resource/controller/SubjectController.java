package com.wide.baseproject.resource.controller;

import com.jfinal.aop.Enhancer;
import com.jfinal.core.Controller;
import com.wide.baseproject.resource.service.SubjectService;

public class SubjectController extends Controller{
	private static final SubjectService subjectService = Enhancer.enhance(SubjectService.class);
	
	

}
