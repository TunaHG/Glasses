package com.multi.glasses;

public class MemberVO {
	String member_id, password, name, phone, allowed, house_id;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAllowed() {
		return allowed;
	}

	public void setAllowed(String allowed) {
		this.allowed = allowed;
	}

	public String getHouse_id() {
		return house_id;
	}

	public void setHouse_id(String house_id) {
		this.house_id = house_id;
	}

	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", allowed=" + allowed + ", house_id=" + house_id + "]";
	}
	
	
}
