package com.codechobo;

public class User {

	private String id;
	private String password;
	private String email;
	private String name;
	private String birth;
	private String phone;
	private boolean isMan;
	
	public User(String id, String password, String email, String name, String birth, String phone, boolean isMan){
		this.id = id;
		this.password = password;
		this.email = email;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.isMan = isMan;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public boolean isMan() {
		return isMan;
	}
	public void setMan(boolean isMan) {
		this.isMan = isMan;
	}
	
	
	
}
