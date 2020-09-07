package com.przepisy.przepisy.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.przepisy.przepisy.auth.model.Comment;
import com.przepisy.przepisy.auth.service.CommentService;

import java.security.Principal;
import java.util.Optional;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;


}