package org.tcs.iagri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/home")
	public String openHomePage(Model model) {

		return "home";
	}
	
	@RequestMapping("/weather")
	public String openWeather(Model model) {

		return "weather";
	}
}
