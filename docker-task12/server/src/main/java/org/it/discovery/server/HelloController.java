package org.it.discovery.server;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("greeting/{name}")
	public String sayHello(@PathVariable String name, HttpServletRequest req) {
		return "Hello, " + name + " from " + req.getServerName() + ":" +
			req.getServerPort();
	}

}