package com.multi.glasses;

public class WeatherVO {
		// T1H	 PTY	 SKY
	String temp, rainfall, sky;
	String baseDate, baseTime;		// 초단기
	String vilageDate, vilageTime;	// 동네예보

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public String getRainfall() {
		return rainfall;
	}

	public void setRainfall(String rainfall) {
		this.rainfall = rainfall;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

	public String getBaseDate() {
		return baseDate;
	}

	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}

	public String getBaseTime() {
		return baseTime;
	}

	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}
	
	public String getVilageDate() {
		return vilageDate;
	}

	public void setVilageDate(String vilageDate) {
		this.vilageDate = vilageDate;
	}

	public String getVilageTime() {
		return vilageTime;
	}

	public void setVilageTime(String vilageTime) {
		this.vilageTime = vilageTime;
	}

	@Override
	public String toString() {
		return "WeatherVO [base : " + baseDate + "/" + baseTime + 
				", vilage : " + vilageDate + "/" + vilageTime +
				", temp : " + temp + ", rainfall : " + rainfall + ", sky : " + sky + "]";
	}
	
	
		
}
