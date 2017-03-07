package com.users;

public class User {
// Hello

	private String firstName;
	private String surname;
	private String loginName;
	private int age;
	private String email;
	private String pass;
	
	public String getloginName(){
		return loginName;
	}
	public void setloginName(String newloginName){
		this.loginName = newloginName;
	}
	
	public String getPass(){
		return pass;
	}
	public void setPass(String newPass){
		this.pass = newPass;
	}

	public String getFirstName(){
		return firstName;
	}
	public void setFirstName(String newFirstName){
		this.firstName = newFirstName;
	}
	
	public String getSurname (){
		return surname;
	}
	public void setSurname(String newSurname){
		this.surname = newSurname;
	}
	
	public String getEmail (){
		return email;
	}
	public void setEmail(String newEmail){
		this.email = newEmail;
	}
	
	public int getAge(){
		return age;
		
	}
	public void setAge(int newAge) {
		this.age = newAge;
	}
	
}
