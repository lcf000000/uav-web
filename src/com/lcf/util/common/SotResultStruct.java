package com.lcf.util.common;

public class SotResultStruct {
	private double precision;
	private double success;
	private double fps;
	
	public double arc_p;
	public double bc_p;
	public double cm_p;
	public double fm_p;
	public double foc_p;
	public double iv_p;
	public double lr_p;
	public double ov_p;
	public double poc_p;
	public double sob_p;
	public double sv_p;
	public double vc_p;
	
	public double arc_iou;
	public double bc_iou;
	public double cm_iou;
	public double fm_iou;
	public double foc_iou;
	public double iv_iou;
	public double lr_iou;
	public double ov_iou;
	public double poc_iou;
	public double sob_iou;
	public double sv_iou;
	public double vc_iou;
	
	public void setPrecision(double precision) {
		this.precision = precision;
	}
	
	public double getPrecision() {
		return precision;
	}
	
	public void setIOU(double success) {
		this.success = success;
	}
	
	public double getIOU() {
		return success;
	}
	
	public void setFPS(double fps) {
		this.fps = fps;
	}
	
	public double getFPS() {
		return fps;
	}
}