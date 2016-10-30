package com.wide.baseproject.exercise.service;

import java.util.ArrayList;
import java.util.List;

import com.wide.common.model.Exercise;
import com.wide.common.model.Itembank;
import com.wide.common.model.Subject;
import com.wide.common.model.query.QueryExercise;
import com.wide.common.model.query.QuerySubject;
import com.wide.viewmodel.DataTablesModel;

public class ExerciseService {

	public DataTablesModel getPageExercise(int pageNum, int pageSize, QueryExercise queryExercise) {
		// TODO Auto-generated method stub
		DataTablesModel exercisepage = Exercise.dao.pageDataTables(pageNum, pageSize, queryExercise);
		
		if (exercisepage != null && !exercisepage.equals("")) {
			List<List<String>> rows = exercisepage.getRows();
			if (rows.size() > 0) {
				for (int i = 0; i < rows.size(); i++) {
					List<String> row = rows.get(i);
					Subject subject = new Subject();
					subject = Subject.dao.getSubjectNameById(row.get(2));
					
					Itembank itembank = new Itembank();
					itembank = Itembank.dao.getItemBankNameById(row.get(3));
					String info = row.get(5);
					row.set(5, Integer.parseInt((row.get(6) + "")) == 1 ? "<font color='#00ff66'>启用</font>" : "<font color='#C9C9C9'>禁用</font>");
					row.set(6, "<a href ='#' onclick=edit('" + row.get(0).trim()
							+ "') >修改</a> | <a href='#' onclick=del('" + row.get(0).trim() + "') >删除</a>"  );
					row.set(0, row.get(1));
					row.set(1, subject.getName());
					row.set(2, itembank.getName());
					row.set(3, row.get(4));
					row.set(4, info);
				}
			}
		}
		return exercisepage;
		
	}

}
