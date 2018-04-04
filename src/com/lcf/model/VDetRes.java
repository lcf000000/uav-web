package com.lcf.model;


public class VDetRes {
	private int id;
	private int user_id;
	private String date;
	private String name;
	private String language;
	private String environment;
	private String reference;
	private String resfile;
	private String descrip;
	private String code;
	
	public int getId() {
 		return id;
 	}
 	public void setId(int id) {
 		this.id = id;
 	}
 	
 	public int getUserId() {
 		return user_id;
 	}
 	public void getUserId(int user_id) {
 		this.user_id = user_id;
 	}
 	
 	public String getDate() {
 		return date;
 	}
 	public void setDate(String date) {
 		this.date = date;
 	}
 	
 	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
 	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	public String getEnvironment() {
		return environment;
	}
	public void setEnvironment(String environment) {
		this.environment = environment;
	}
	
	public String getReference() {
		return reference;
	}	
	public void setReference(String reference) {
		this.reference = reference;
	}
	
	public String getResfile() {
		return resfile;
	}
	public void setResfile(String resfile) {
		this.resfile = resfile;
	}
	
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	
 	public String getCode() {
 		return code;
 	}
 	public void setCode(String code) {
 		this.code = code;
 	}
}