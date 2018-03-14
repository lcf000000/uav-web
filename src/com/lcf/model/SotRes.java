package com.lcf.model;

import java.sql.Timestamp;

public class SotRes {
	private int id;
	private int user_id;
	private Timestamp date;
	private String name;
	private String language;
	private String environment;
	private String reference;
	private String resfile;
	private String descrip;
	private String code;
	private int status;
	private double arc_p;
	private double bc_p;
	private double cm_p;
	private double fm_p;
	private double foc_p;
	private double iv_p;
	private double lr_p;
	private double ov_p;
	private double poc_p;
	private double sob_p;
	private double sv_p;
	private double vc_p;
	private double overall_p;
	private double arc_iou;
	private double bc_iou;
	private double cm_iou;
	private double fm_iou;
	private double foc_iou;
	private double iv_iou;
	private double lr_iou;
	private double ov_iou;
	private double poc_iou;
	private double sob_iou;
	private double sv_iou;
	private double vc_iou;
	private double overall_iou;
	private double speed;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public double getArcP() {
		return arc_p;
	}
	public void setArcP(double arc_p) {
		this.arc_p = arc_p;
	}
	public double getBcP() {
		return bc_p;
	}
	public void setBcP(double bc_p) {
		this.bc_p = bc_p;
	}
	public double getCmP() {
		return cm_p;
	}
	public void setCmP(double cm_p) {
		this.cm_p = cm_p;
	}
	public double getFmP() {
		return fm_p;
	}
	public void setFmP(double fm) {
		this.fm_p = fm_p;
	}
	public double getFocP() {
		return foc_p;
	}
	public void setFocP(double foc_p) {
		this.foc_p = foc_p;
	}
	public double getIvP() {
		return iv_p;
	}
	public void setIvP(double iv_p) {
		this.iv_p = iv_p;
	}
	public double getLrP() {
		return lr_p;
	}
	public void setLrP(double lr_p) {
		this.lr_p = lr_p;
	}
	public double getOvP() {
		return ov_p;
	}
	public void setOvP(double ov_p) {
		this.ov_p = ov_p;
	}
	public double getPocP() {
		return poc_p;
	}
	public void setPocP(double poc_p) {
		this.poc_p = poc_p;
	}
	public double getSobP() {
		return sob_p;
	}
	public void setSobP(double sob_p) {
		this.sob_p = sob_p;
	}
	public double getSvP() {
		return sv_p;
	}
	public void setSvP(double sv_p) {
		this.sv_p = sv_p;
	}
	public double getVcP() {
		return vc_p;
	}
	public void setVcP(double vc_p) {
		this.vc_p = vc_p;
	}
	public double getOverallP() {
		return overall_p;
	}
	public void setOverallP(double overall_p) {
		this.overall_p = overall_p;
	}
	public double getArcIOU() {
		return arc_iou;
	}
	public void setArcIOU(double arc_iou) {
		this.arc_iou = arc_iou;
	}
	public double getBcIOU() {
		return bc_iou;
	}
	public void setBcIOU(double bc_iou) {
		this.bc_iou = bc_iou;
	}
	public double getCmIOU() {
		return cm_iou;
	}
	public void setCmIOU(double cm_iou) {
		this.cm_iou = cm_iou;
	}
	public double getFmIOU() {
		return fm_iou;
	}
	public void setFmIOU(double fm_iou) {
		this.fm_iou = fm_iou;
	}
	public double getFocIOU() {
		return foc_iou;
	}
	public void setFocIOU(double foc_iou) {
		this.foc_iou = foc_iou;
	}
	public double getIvIOU() {
		return iv_iou;
	}
	public void setIvIOU(double iv_iou) {
		this.iv_iou = iv_iou;
	}
	public double getLrIOU() {
		return lr_iou;
	}
	public void setLrIOU(double lr_iou) {
		this.lr_iou = lr_iou;
	}
	public double getOvIOU() {
		return ov_iou;
	}
	public void setOvIOU(double ov_iou) {
		this.ov_iou = ov_iou;
	}
	public double getPocIOU() {
		return poc_iou;
	}
	public void setPocIOU(double poc_iou) {
		this.poc_iou = poc_iou;
	}
	public double getSobIOU() {
		return sob_iou;
	}
	public void setSobIOU(double sob_iou) {
		this.sob_iou = sob_iou;
	}
	public double getSvIOU() {
		return sv_iou;
	}
	public void setSvIOU(double sv_iou) {
		this.sv_iou = sv_iou;
	}
	public double getVcIOU() {
		return vc_iou;
	}
	public void setVcIOU(double vc_iou) {
		this.vc_iou = vc_iou;
	}
	public double getOverallIOU() {
		return overall_iou;
	}
	public void setOverallIOU(double overall_iou) {
		this.overall_iou = overall_iou;
	}
	public double getSpeed() {
		return speed;
	}
	public void setSpeed(double speed) {
		this.speed = speed;
	}
}
