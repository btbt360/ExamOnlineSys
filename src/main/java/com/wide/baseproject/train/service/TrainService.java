package com.wide.baseproject.train.service;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.kit.StrKit;
import com.wide.common.model.Curriculum;
import com.wide.common.model.Train;
import com.wide.common.model.User;
import com.wide.common.model.query.QueryCurriculum;
import com.wide.common.model.query.QueryTrain;
import com.wide.viewmodel.DataTablesModel;

public class TrainService {

	public DataTablesModel getPageCase(int pageNum, int pageSize, QueryTrain querytrain) {
		// TODO Auto-generated method stub
		DataTablesModel trainpage = Train.dao.pageDataTables(pageNum, pageSize, querytrain);
		
		if (trainpage != null && !trainpage.equals("")) {
			List<List<String>> rows = trainpage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					String userstr = "";
					String id = row.get(0);
					Curriculum curriculum = new Curriculum();
					if(StrKit.notBlank(row.get(5))){
						curriculum = Curriculum.dao.findById(row.get(5));
					}
					row.set(0, row.get(1));
					row.set(1, row.get(2));
					row.set(2, row.get(3));
					row.set(3, row.get(4));
					row.set(4, curriculum.getCoursename());
					List<User> userlist = new ArrayList<User>();
					userlist = User.dao.find("select t1.* from sys_user t1 , sys_user_train t2 where t1.id = t2.user_id and t2.train_id = ? ",id);
					if(userlist.size()>0){
						for(User user:userlist){
							userstr +=user.getName()+" | ";
						}
					}
					row.set(5, userstr);
					row.add(6, "<a href='#' onclick=edit('"+id+"')>修改</a> | <a href='#' onclick=del('"+id+"')>删除</a>");
				}
			}
		}
		return trainpage;
	}

}
