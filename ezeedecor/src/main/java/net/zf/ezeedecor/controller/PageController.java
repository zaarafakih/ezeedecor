package net.zf.ezeedecor.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("userClickHome", true);
		return mv;
	}
	
	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}
	
	@RequestMapping(value ="/design")
	public ModelAndView design() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Design");
		mv.addObject("userClickDesign", true);
		return mv;
	}
	
	@RequestMapping(value ="/makeover")
	public ModelAndView makeover() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Makeover");
		mv.addObject("userClickMakeover", true);
		return mv;
	}
	
	@RequestMapping(value ="/samples")
	public ModelAndView samples() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Samples");
		mv.addObject("userClickSamples", true);
		return mv;
	}

	
	
	
	
	
	
	
	/*
	 * @RequestMapping(value="/test") public ModelAndView
	 * test(@RequestParam(value="greetings",required=false)String greetings){
	 * if(greetings==null){ greetings="hello"; } ModelAndView mv= new
	 * ModelAndView("page"); mv.addObject("greetings",greetings ); return mv; }
	 * 
	 * @RequestMapping(value="/test/{greetings}") public ModelAndView
	 * test(@PathVariable("greetings")String greetings){ if(greetings==null){
	 * greetings="hello"; } ModelAndView mv= new ModelAndView("page");
	 * mv.addObject("greetings",greetings ); return mv; }
	 */

}
