package com.wide.baseproject.exam.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.wide.common.model.Exam;
import com.wide.common.model.Examinee;
import com.wide.common.model.query.QueryExam;
import com.wide.common.model.query.QueryExaminee;
import com.wide.constant.EnumExamineeType;
import com.wide.viewmodel.DataTablesModel;

public class InvigilateService{

	public DataTablesModel getPageInvigilate(int pageNum, int pageSize, QueryExam queryExam) {
		// TODO Auto-generated method stub
		DataTablesModel invigilatepage = Exam.dao.pageDataTables(pageNum, pageSize, queryExam,1);
		if (invigilatepage != null && !invigilatepage.equals("")) {
			List<List<String>> rows = invigilatepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String id = row.get(0).trim();
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3));
					row.set(3, row.get(4));
					row.set(4, row.get(5)+" 小时");
					row.set(5, row.get(6));
					row.set(6, row.get(7)+(row.get(8)!=null&&!row.get(8).equals("")?"、"+row.get(8):""));
					row.set(7, EnumExamineeType.getFromKey(Integer.parseInt(row.get(9))));
					if(Integer.parseInt(row.get(9))<2){
						row.set(8, "<a href ='#' onclick=alink('"+id+"') >开始监考</a>");						
					}else{
						row.set(8, "");						
					}
					row.remove(9);
				}
			}
		}
		return invigilatepage;
	}

	public DataTablesModel getPageExaminee(int pageNum, int pageSize, QueryExaminee queryExaminee) {
		// TODO Auto-generated method stub
		DataTablesModel examineepage = Examinee.dao.pageDataTables(pageNum, pageSize, queryExaminee,1);
		if (examineepage != null && !examineepage.equals("")) {
			List<List<String>> rows = examineepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String path="xFilePath_"+i;
					String id = examineepage.getIds().get(0)+"";
					String type = row.get(5);
					row.set(3, row.get(3)!=null&&!row.get(3).equals("")?"指纹匹配成功":"<input type='button' class='btn btn-primary' value='请匹配指纹' onclick=fingerprint('"+id+"') />");
					row.set(4, row.get(4)!=null&&!row.get(4).equals("")?"<img src='"+row.get(4)+"' />":"<input id='"+path+"' type='text' style='display: table-cell;vertical-align: middle;margin-top:3%;' />&nbsp;&nbsp;<input type='button' class='btn btn-primary' value='选择附件' onclick=BrowseServer('"+path+"') />");					
					if(Integer.parseInt(type)<2&&Integer.parseInt(type)>0){
						row.set(5, "<a href ='#' onclick=goDown('"+id+"') >下机</a> | <a href ='#' onclick=oAbsent('"+id+"') >缺考</a>");						
					}else{
						row.set(5, "");						
					}
				}
			}
		}
		return examineepage;
	}

	public void gettofinish(String id) {
		// TODO Auto-generated method stub
		List<Examinee> elist = new ArrayList<Examinee>();
		elist=Examinee.dao.find("select * from sys_examinee where isdel = 0 and isenable = 1 and exam_id ='"+id+"'");
		if(elist.size()>0){
			for(Examinee ee:elist){
				if(ee.getFingerprint()!=null&&!ee.getFingerprint().equals("")){
					Db.update("update sys_examinee set status = 3 where id ='"+ee.getId()+"'");
				}
			}
		}
		if(id!=null&&!id.equals("")){
			Db.update("update sys_examinee set status = 2 where exam_id = '"+id+"' and status not in (3,4)");
		}
	}
	

}
