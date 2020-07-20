package com.nikhil.restController;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class restHelloController {
	
	@RequestMapping(value = "/hello")
	public String sayHi() {
		return "Hi";
	}
}
