package com.lcf.model;


public class DetRes {
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
	private double ap;
	private double ap5;       // apiou = 0.5
 	private double ap75;      // apiou = 0.75
 	private double aps;   // APSmall
 	private double apm;  // APMedium
 	private double apl;   // APLarge
 	private double arm1;    // ARMax1
 	private double arm10;   // ARMax10
 	private double arm100;  // ARMax100
 	private double ars;   // ARSmall
 	private double arm;  // ARMedium
 	private double arl;   // ARLarge
 	private double speed;
 	private int status;
 	
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
 	
 	public double getap() {
 		return ap;
 	}
 	public void setap(double ap) {
 		this.ap = ap;
 	}
 	
 	public double getap5() {
 		return ap5;
 	}
 	public void setap5(double ap5) {
 		this.ap5 = ap5;
 	}
 	
 	public double getap75() {
 		return ap75;
 	}
 	public void setap75(double ap75) {
 		this.ap75 = ap75;
 	}
 	
 	public double getaps() {
 		return aps;
 	}
 	public void setaps(double aps) {
 		this.aps = aps;
 	}
 	
 	public double getapm() {
 		return apm;
 	}
 	public void setapm(double apm) {
 		this.apm = apm;
 	}
 	
 	public double getapl() {
 		return apl;
 	}
 	public void setapl(double apl) {
 		this.apl = apl;
 	}
 	
 	public double getarm1() {
 		return arm1;
 	}
 	public void setarm1(double arm1) {
 		this.arm1 = arm1;
 	}
 	
 	public double getarm10() {
 		return arm10;
 	}
 	public void setarm10(double arm10) {
 		this.arm10 = arm10;
 	}
 	
 	public double getarm100() {
 		return arm100;
 	}
 	public void setarm100(double arm100) {
 		this.arm100 = arm100;
 	}
 	
 	public double getars() {
 		return ars;
 	}
 	public void setars(double ars) {
 		this.ars = ars;
 	}
 	
 	public double getarm() {
 		return arm;
 	}
 	public void setarm(double arm) {
 		this.arm = arm;
 	}
 	
 	public double getarl() {
 		return arl;
 	}
 	public void setar(double arl) {
 		this.arl = arl;
 	}
 	
 	public double getSpeed() {
		return speed;
	}
	public void setSpeed(double speed) {
		this.speed = speed;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}