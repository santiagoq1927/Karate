package com.util.controllers;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class PostController {

	@PostMapping("/posts")
	public String peticionPost(HttpServletRequest request, @RequestBody Object body) {
		
		System.out.println(request.getHeader("jwt"));
		System.out.println(body.toString());
		
		return body.toString();
	}
	
	@PostMapping("/posts2")
	public String peticionPost2(HttpServletRequest request, @RequestBody String body) throws ParseException {
		
		System.out.println(request.getHeader("jwt"));
		
		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(body);
		
		System.out.println(object.get("nombre"));
		
		JSONObject object2 = (JSONObject) object.get("direccion");
		System.out.println(object2.get("calle"));
		
		return body;
	}
}
