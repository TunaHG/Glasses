package com.multi.glasses;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Repository
public class WeatherDAO {
	
	String[] keys = {"0210", "0510", "0810", "1110", "1410", "1710", "2010", "2310"};
	
	// 초단기실황 시간설정
	public WeatherVO getBaseDatetime(WeatherVO vo) {
		
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
				vo.setBaseTime(shour + "30");
			} else if ( Integer.parseInt(smin) >= 10 ) {
				vo.setBaseTime(shour + "00");
			} else {
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				cal.add(Calendar.HOUR, -1);
				vo.setBaseTime(fhour.format(cal.getTime()) + "30");
			}
			
			// setBaseDate
			vo.setBaseDate(fdate.format(now));
			
			fdate.clone();
			fhour.clone();	fmin .clone();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	// 동네예보 시간설정
	public WeatherVO getVilageDatetime(WeatherVO vo) {
		
		try {
			
			SimpleDateFormat fdate = new SimpleDateFormat( "yyyyMMdd" );
			SimpleDateFormat ftime = new SimpleDateFormat( "HHmm" );
			Date now = new Date();
			
			// setBaseTime
			String stime = ftime.format(now);	// 현재시간
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(now);
			
//			- Base_time : 0200, 0500, 0800, 1100, 1400, 1700, 2000, 2300 (1일 8회)
//			- Fcst_time : 0600, 0900, 1200, 1500, 1800, 2100, 2400, 0300
			
			if ( Integer.parseInt(stime) <= 130 ) {
				cal.add(Calendar.HOUR, -1);
				vo.setVilageTime("2000");
			} else if ( Integer.parseInt(stime) <= 430 ) {
				cal.add(Calendar.HOUR, -1);
				vo.setVilageTime("2300");
			} else if ( Integer.parseInt(stime) <= 730 ) {
				vo.setVilageTime("0200");
			} else if ( Integer.parseInt(stime) <= 1030 ) {
				vo.setVilageTime("0500");
			} else if ( Integer.parseInt(stime) <= 1330 ) {
				vo.setVilageTime("0800");
			} else if ( Integer.parseInt(stime) <= 1630 ) {
				vo.setVilageTime("1100");
			} else if ( Integer.parseInt(stime) <= 1930 ) {
				vo.setVilageTime("1400");
			} else if ( Integer.parseInt(stime) <= 2230 ) {
				vo.setVilageTime("1700");
			} else {
				vo.setVilageTime("2000");
			}
			
			vo.setVilageDate(fdate.format(cal.getTime()));
			
			fdate.clone();
			ftime.clone();
			
			System.out.println("vilage : " + vo.getVilageDate() + "/" + vo.getVilageTime());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	public WeatherVO getWeatherData() {
		WeatherVO vo = new WeatherVO();
		this.getBaseWeather(vo);
		this.getVilageWeather(vo);
		
		System.out.println(vo);
		
		return vo;
		
	}
	
	// 초단기실황 날씨 조회
	public WeatherVO getBaseWeather(WeatherVO vo) {
		
		vo = this.getBaseDatetime(vo);
		
		// 동네예보	
//		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
		// 초단기예보	getUltraSrtNcst
		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?";
		String key = "serviceKey=AbJoP9SJs6N2YUUVHIZmETyEHDN0zvFnQfsaqJiIX7Vc8aaOfeIWLaCUI16d%2FAzzOgxpgzrCtQZU8Gyw%2B5QI%2FQ%3D%3D";
		String url_date = "&base_date=" + vo.getBaseDate();
		String url_time = "&base_time=" + vo.getBaseTime();
		String subUrl = "&nx=61&ny=125&numOfRows=10&pageNo=1&dataType=json";
		
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
			for (int i = 0; i < data.size(); i++) {
//				System.out.println(data.get(i));
				if( data.get(i).get("category").equals("T1H") ) {
					vo.setTemp((String) data.get(i).get("obsrValue"));
				}
				if( data.get(i).get("category").equals("PTY") ) {
//					String rainfall = (String) data.get(i).get("obsrValue");
//					if (rainfall.equals("0")) {
//						rainfall = "none";
//					} else if (rainfall.equals("1")) {
//						rainfall = "rain";
//					} else if (rainfall.equals("2")) {
//						rainfall = "both";
//					} else {
//						rainfall = "snow";
//					}
					
//					vo.setRainfall(rainfall);	// rainfall
					vo.setRainfall((String) data.get(i).get("obsrValue"));
				}
			}
			
			System.out.println("초단기 : "+vo);
			
			br.close();
			
//			mv.addObject("t1h", data.get(3).get("obsrValue"));
//			mv.setViewName("weathertest");
//			vo.setTemp((String)data.get(3).get("obsrValue"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	// 동네예보 날씨 조회
	public WeatherVO getVilageWeather(WeatherVO vo) {
		
		vo = this.getVilageDatetime(vo);
		
		String preUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?";
		String key = "serviceKey=AbJoP9SJs6N2YUUVHIZmETyEHDN0zvFnQfsaqJiIX7Vc8aaOfeIWLaCUI16d%2FAzzOgxpgzrCtQZU8Gyw%2B5QI%2FQ%3D%3D";
		String url_date = "&base_date=" + vo.getVilageDate();
		String url_time = "&base_time=" + vo.getVilageTime();
		String subUrl = "&nx=61&ny=125&numOfRows=10&pageNo=1&dataType=json";
		
		try {
			
			URL url = new URL(preUrl + key + url_date + url_time + subUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			ObjectMapper mapper = new ObjectMapper();
			
			// 동네예보
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			StringBuilder sb = new StringBuilder();
			sb.append(br.readLine());
			
			// json - items
			String result = sb.substring(sb.indexOf("["), sb.indexOf("]")+1);
			
			List<Map<String, Object>> data = mapper.readValue(result, new TypeReference<List<Map<String, Object>>>(){});
			System.out.println("동네예보");
			for (int i = 0; i < data.size(); i++) {
				System.out.println(data.get(i));
				if( data.get(i).get("category").equals("SKY") ) {
					
//					String sky = (String) data.get(i).get("fcstValue");
//					if (sky.equals("1")) {
//						sky = "sunny";
//					} else if (sky.equals("3")) {
//						sky = "cloud";
//					} else if (sky.equals("4")) {
//						sky = "heavy";
//					}
//					
//					vo.setSky(sky);
					vo.setSky((String) data.get(i).get("fcstValue"));
				}
			}
			
			System.out.println("동네 : "+vo);
			
			br.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	

}
