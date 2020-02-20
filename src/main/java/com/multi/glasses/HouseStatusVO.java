package com.multi.glasses;

public class HouseStatusVO {
	
	String house_id, temperature;
	
	public String getHouse_id() {
		return house_id;
	}
	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	@Override
	public String toString() {
		return "HouseStatusVO [house_id=" + house_id + ", temperature=" + temperature + "]";
	}
	
}
