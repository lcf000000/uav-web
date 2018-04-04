/**
 * 
 */
package com.lcf.model;

/**
 * @author lcf
 * 2014-8-1
 */
public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String realname;
	private String country;
	private String org;
	private String regtime;
	private int right;
	private int motcnt;
	private int detcnt;
	private int sotcnt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getOrg() {
		return org;
	}
	public void setOrg(String org) {
		this.org = org;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public int getRight() {
		return right;
	}
	public void setRight(int right) {
		this.right = right;
	}
	public int getMotcnt() {
		return motcnt;
	}
	public void setMotcnt(int motcnt) {
		this.motcnt = motcnt;
	}
	public int getSotcnt() {
		return sotcnt;
	}
	public void setSotcnt(int sotcnt) {
		this.sotcnt = sotcnt;
	}
	public int getDetcnt() {
		return detcnt;
	}
	public void setDetcnt(int detcnt) {
		this.detcnt = detcnt;
	}
}
