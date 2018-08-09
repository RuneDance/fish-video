package com.fishvideo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
	
	@RequestMapping("/demo")
	public String Hello() {
		return "Hello Spring Boot~";
	}
	
}
