package com.multi.glasses;

import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;


/*
 *	날씨 테스트 코드 
 */
@Controller
public class WeatherController {
	
	@RequestMapping("/weather")
	@ResponseBody
	public ModelAndView weatherTest() {
		ModelAndView mv = new ModelAndView();
		
		// 동네예보	
//		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
		// 초단기예보	getUltraSrtNcst
		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?";
		String key = "serviceKey=AbJoP9SJs6N2YUUVHIZmETyEHDN0zvFnQfsaqJiIX7Vc8aaOfeIWLaCUI16d%2FAzzOgxpgzrCtQZU8Gyw%2B5QI%2FQ%3D%3D";
		String url_date = "&base_date=20200218";
		String url_time = "&base_time=1230";
		String subUrl = "&nx=61&ny=125&numOfRows=164&pageNo=1&dataType=json";
		
		try {
			
			URL url = new URL(preUrl + key + url_date + url_time + subUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			ObjectMapper mapper = new ObjectMapper();
			
			// 동네예보
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			StringBuilder sb = new StringBuilder();
			sb.append(br.readLine());
			
			String result = sb.substring(sb.indexOf("["), sb.indexOf("]")+1);
			
			List<Map<String, Object>> data = mapper.readValue(result, new TypeReference<List<Map<String, Object>>>(){});
//			System.out.println(data);
			for (int i = 0; i < data.size(); i++) {
				System.out.println(data.get(i));
			}
			
			br.close();
			
			mv.addObject("t1h", data.get(3).get("obsrValue"));
			mv.setViewName("weathertest");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}

}
