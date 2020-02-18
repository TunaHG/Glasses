package com.multi.glasses;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class WeatherDAO {
	
	String today = "20200218";
	String time = "1249";
	
	String[] keys = {"0210", "0510", "0810", "1110", "1410", "1710", "2010", "2310"};
	
	
	public WeatherVO getBaseTime(WeatherVO vo) {
		
		String baseTime;
		
		try {
			
			SimpleDateFormat fdate = new SimpleDateFormat( "yyyyMMdd" );
			SimpleDateFormat fhour = new SimpleDateFormat( "HH" );
			SimpleDateFormat fmin = new SimpleDateFormat( "mm" );
//			Date now = format.parse("202001010005");
			Date now = new Date();
			
			// setBaseTime
			String shour = fhour.format(now);
			String smin = fmin.format(now);
			
			if( Integer.parseInt(smin) >= 40 ) {
				baseTime = shour + "40";
				vo.setBaseTime(baseTime);
			} else if ( Integer.parseInt(smin) >= 10 ) {
				baseTime = shour + "10";
				vo.setBaseTime(baseTime);
			} else {
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				cal.add(Calendar.HOUR, -1);
				baseTime = fhour.format(cal.getTime()) + "40";
				vo.setBaseTime(baseTime);
			}
//			System.out.println(baseTime);
			
			// setBaseDate
			vo.setBaseDate(fdate.format(now));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public WeatherVO getWeatherData() {
		
		WeatherVO vo = new WeatherVO();
		this.getBaseTime(vo);
		
		// 동네예보	
//		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
		// 초단기예보	getUltraSrtNcst
		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?";
		String key = "serviceKey=AbJoP9SJs6N2YUUVHIZmETyEHDN0zvFnQfsaqJiIX7Vc8aaOfeIWLaCUI16d%2FAzzOgxpgzrCtQZU8Gyw%2B5QI%2FQ%3D%3D";
		String url_date = "&base_date=" + vo.getBaseDate();
		String url_time = "&base_time=" + vo.getBaseTime();
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
//			for (int i = 0; i < data.size(); i++) {
//				System.out.println(data.get(i));
//			}
			
			br.close();
			
			vo.setTemp((String)data.get(3).get("obsrValue"));
//			mv.addObject("t1h", data.get(3).get("obsrValue"));
//			mv.setViewName("weathertest");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	

}
