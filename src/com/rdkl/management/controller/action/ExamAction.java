package com.rdkl.management.controller.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.rdkl.common.domain.exam.AnswerSheet;
import com.rdkl.common.domain.exam.AnswerSheetItem;
import com.rdkl.common.domain.exam.ExamPaper;
import com.rdkl.common.domain.exam.Message;
import com.rdkl.management.service.ExamPaperService;
import com.rdkl.management.service.ExamService;

@Controller
public class ExamAction {
	@Autowired
	private ExamPaperService examPaperService;
	@Autowired
	private ExamService examService;
	@RequestMapping(value = "/api/exampaper/{id}", method = RequestMethod.GET)
	public @ResponseBody ExamPaper getExamPaper(@PathVariable("id") int id){
		ExamPaper paper = examPaperService.getExamPaperById(id);
		return paper;
	}
	
	@RequestMapping(value = "/api/answersheet", method = RequestMethod.POST)
	public @ResponseBody Message submitAnswerSheet(@RequestBody AnswerSheet answerSheet){

		List<AnswerSheetItem> itemList = answerSheet.getAnswerSheetItems();
		
		//全部是客观题，则状态更改为已阅卷
		int approved = 3;
		for(AnswerSheetItem item : itemList){
			if(item.getQuestionTypeId() != 1 && item.getQuestionTypeId() != 2 && item.getQuestionTypeId() != 3){
				approved = 2;
				break;
			}
		}
		Gson gson = new Gson();		
		examService.updateUserExamHist(answerSheet, gson.toJson(answerSheet),approved);
		
		return new Message();
	}
	
}