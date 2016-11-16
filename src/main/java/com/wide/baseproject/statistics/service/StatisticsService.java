package com.wide.baseproject.statistics.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.wide.common.model.Cases;
import com.wide.common.model.Exam;
import com.wide.common.model.ExamAnswer;
import com.wide.common.model.Examinee;
import com.wide.common.model.ExampapersQtypes;
import com.wide.common.model.Office;
import com.wide.common.model.Questionoptions;
import com.wide.common.model.query.QueryStatistics;
import com.wide.viewmodel.DataTablesModel;
import com.wide.viewmodel.ViewChartData;

public class StatisticsService {

	public List<ViewChartData> examineeChartDatas(String starttimes, String endtimes, String examid) {
		// TODO Auto-generated method stub
		List<ViewChartData> listv = new ArrayList<ViewChartData>();
		String whereStr = whereStr(starttimes,endtimes,examid);
		List<Exam> listexam = Exam.dao.find("select * from sys_exam where 1=1 and isdel = 0 and isenable =1 "+whereStr);
		if(listexam.size()>0){
			for(Exam exam:listexam){
				ViewChartData  vcd= new ViewChartData();
				vcd.setKaoshixStr(exam.getName());
				List<Examinee> listNoqualified = Examinee.dao.getExamineeByExamIdType(exam.getId(),0);
				List<Examinee> listQualified = Examinee.dao.getExamineeByExamIdType(exam.getId(),1);
				List<Examinee> listExcellent = Examinee.dao.getExamineeByExamIdType(exam.getId(),2);
				vcd.setNoqualified(listNoqualified.size());
				vcd.setQualified(listQualified.size());
				vcd.setExcellent(listExcellent.size());
				listv.add(vcd);
			}
		}
		return listv;
	}
	
	
	
	public String whereStr(String starttimes, String endtimes, String examid){
		String whereStr = " ";
		if(!StrKit.isBlank(starttimes)){
			whereStr += " and starttime > '"+starttimes+" 00:00:00'";
		}
		if(!StrKit.isBlank(endtimes)){
			whereStr += " and endtime < '"+endtimes+" 23:59:59'";
		}
		if(!StrKit.isBlank(examid)){
			whereStr += " and id = '"+examid+"'";
		}
		return whereStr;
	}



	public List<ViewChartData> dapartmentChartDatas(String starttimes, String endtimes, String examid) {
		// TODO Auto-generated method stub
		List<ViewChartData> listv = new ArrayList<ViewChartData>();
		String whereStr = "";
		if(!StrKit.isBlank(starttimes)){
			whereStr += " and t4.starttime > '"+starttimes+" 00:00:00'";
		}
		if(!StrKit.isBlank(endtimes)){
			whereStr += " and t4.endtime < '"+endtimes+" 23:59:59'";
		}
		if(!StrKit.isBlank(examid)){
			whereStr += " and t4.id = '"+examid+"'";
		}
		List<Office> listoffice =Office.dao.find("select * from sys_office where type=2 and del_flag = 0 ");
		if(listoffice.size()>0){
			for(Office off:listoffice){
				ViewChartData vcd = new ViewChartData();
				vcd.setKaoshixStr(off.getName());
				List<Examinee> listNoqualified = Examinee.dao.getDapartmentExamineeByType(off.getId(),0,whereStr);
				List<Examinee> listQualified = Examinee.dao.getDapartmentExamineeByType(off.getId(),1,whereStr);
				List<Examinee> listExcellent = Examinee.dao.getDapartmentExamineeByType(off.getId(),2,whereStr);
				vcd.setNoqualified(listNoqualified.size());
				vcd.setQualified(listQualified.size());
				vcd.setExcellent(listExcellent.size());
				listv.add(vcd);
			}
		}
		
		return listv;
	}



	public List<ViewChartData> postChartDatas(String starttimes, String endtimes, String examid) {
		// TODO Auto-generated method stub
				List<ViewChartData> listv = new ArrayList<ViewChartData>();
				String whereStr = "";
				if(!StrKit.isBlank(starttimes)){
					whereStr += " and t3.starttime > '"+starttimes+" 00:00:00'";
				}
				if(!StrKit.isBlank(endtimes)){
					whereStr += " and t3.endtime < '"+endtimes+" 23:59:59'";
				}
				if(!StrKit.isBlank(examid)){
					whereStr += " and t3.id = '"+examid+"'";
				}
				List<Office> listoffice =Office.dao.find("select * from sys_office where type=3 and del_flag = 0 ");
				if(listoffice.size()>0){
					for(Office off:listoffice){
						ViewChartData vcd = new ViewChartData();
						vcd.setKaoshixStr(off.getName());
						List<Examinee> listNoqualified = Examinee.dao.getDapartmentExamineeByType(off.getId(),0,whereStr);
						List<Examinee> listQualified = Examinee.dao.getDapartmentExamineeByType(off.getId(),1,whereStr);
						List<Examinee> listExcellent = Examinee.dao.getDapartmentExamineeByType(off.getId(),2,whereStr);
						vcd.setNoqualified(listNoqualified.size());
						vcd.setQualified(listQualified.size());
						vcd.setExcellent(listExcellent.size());
						listv.add(vcd);
					}
				}
		return listv;
	}



	public DataTablesModel getPageErrorCountfind(int pageNum, int pageSize, QueryStatistics queryStatistics) {
		// TODO Auto-generated method stub
				// tring select = "select t.name,t.code,t2.title,t2.questionanswer,count(*),t2.questionanswerinfo ";
				DataTablesModel errorCountpage = ExamAnswer.dao.getPageErrorCountfind(pageNum, pageSize, queryStatistics);
				if (errorCountpage != null && !errorCountpage.equals("")) {
					List<List<String>> rows = errorCountpage.getRows();
					if (rows.size() > 0) {
						for (int i = 0; i < rows.size(); i++) {
							List<String> row = rows.get(i);
							String id = errorCountpage.getIds().get(i)+"";
							List<Questionoptions> list =Questionoptions.dao.findByQuestionId(id.trim());
							String option = "";
							if(list.size()>0){
								for(Questionoptions q:list){
									option = option + "</br>"+q.getCode()+"、"+q.getContant()+"。";
								}
							}
							row.set(2, row.get(2)+option);
						}
					}
				}
			return errorCountpage;
	}

}
