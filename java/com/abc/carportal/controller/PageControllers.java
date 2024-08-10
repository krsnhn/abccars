package com.abc.carportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
class PageControllers {
	

	    @GetMapping("/home")
	    public String showHomePage() {
	        return "home";
	    }
	    
}
