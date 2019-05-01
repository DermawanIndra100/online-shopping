package net.kzn.onlineshopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
	
	
	@RequestMapping(value = {"/", "/home", "index"})
	public ModelAndView index(){
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("greeting","Welcome to Spring Web MVC");
		return mv;
	}
	
	//use query string with '?' ex : http://localhost:8080/onlineshopping/test?greeting=hahahhaha
//	@RequestMapping(value = "/test")
//	public ModelAndView test(@RequestParam("greeting")String greeting){
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting",greeting);
//		return mv;
//	}
	
	//use query string without '?' ex : http://localhost:8080/onlineshopping/test -> hello there
//	@RequestMapping(value = "/test")
//	public ModelAndView test(@RequestParam(value="greeting", required=false)String greeting){
//		if(greeting==null){
//			greeting = "Hallo there";
//		}
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting",greeting);
//		return mv;
//	}
	
	//link with clean url ex: http://localhost:8080/onlineshopping/test/hello -> hello
//	@RequestMapping(value = "/test/{greeting}")
//	public ModelAndView test(@PathVariable("greeting")String greeting){
//		if(greeting==null){
//			greeting = "Hallo there";
//		}
//		ModelAndView mv = new ModelAndView("page");
//		mv.addObject("greeting",greeting);
//		return mv;
//	}
	
	
}
