package com.myspring.springBBS.PopUp;

import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class PopUpController {
	private static final Logger logger = LoggerFactory.getLogger(PopUpController.class);
	
	@Autowired
	private ServletContext  application;
	
} //class END
