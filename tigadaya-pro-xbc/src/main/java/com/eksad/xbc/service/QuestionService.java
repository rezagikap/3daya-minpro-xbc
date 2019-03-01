package com.eksad.xbc.service;
import java.util.List;

import com.eksad.xbc.model.QuestionModel;
public interface QuestionService {
	
	public List<QuestionModel> getList();
	public List<QuestionModel> search(String key);
	public QuestionModel getById (Integer id);
	public void insert(QuestionModel model);
	public void update(QuestionModel model);
	public void delete(QuestionModel model);
}
