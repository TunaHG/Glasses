package com.multi.glasses;

import java.net.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


/*
 *	날씨 테스트 코드 
 */
@Controller
public class WeatherController {
	
	@RequestMapping("/weather")
	@ResponseBody
	public ModelAndView weatherTest() {
		ModelAndView mv = new ModelAndView();
		
		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
		String key = "serviceKey=AbJoP9SJs6N2YUUVHIZmETyEHDN0zvFnQfsaqJiIX7Vc8aaOfeIWLaCUI16d%2FAzzOgxpgzrCtQZU8Gyw%2B5QI%2FQ%3D%3D";
		String url_date = "&base_date=20200216";
		String url_time = "&base_time=1100";
		String subUrl = "&nx=61&ny=125&numOfRows=162&pageNo=1&dataType=json";
		
		try {
			
			URL url = new URL(preUrl + key + url_date + url_time + subUrl);
			
			
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
		
		
		
		
		return mv;
	}

}
