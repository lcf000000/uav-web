package com.lcf.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.lcf.util.common.BoxStruct;
import com.lcf.util.common.SotResultStruct;

/*
class SotBox {
	public int x;
	public int y;
	public int w;
	public int h;
}

class SotResult {
	public double precison;
	public double success;
}
*/
public class EvaluateUtil {
	
	private static int attNum = 12;
	
	private final static Logger log = LoggerFactory.getLogger(EvaluateUtil.class);
	

	/**
     * 计算中点距离
     * @param  grand truth rectangle
     * @param  user result rectangle
     * @return precision
     */
	public static boolean centerPre(BoxStruct gt, BoxStruct ur) {
		
		double pThreshold = 20;
		
		boolean precision;;
		
		double gtCenter_x = gt.x + gt.w / 2.0;
		double gtCenter_y = gt.y + gt.h / 2.0;
		double urCenter_x = ur.x+ ur.w / 2.0;
		double urCenter_y = ur.y + ur.h / 2.0;
		
		if (Math.pow((gtCenter_x - urCenter_x), 2) + Math.pow((gtCenter_y - urCenter_y), 2) 
			< Math.pow(pThreshold,  2)) {
			
			precision = true;
		} else {
			precision = false;
		}
		
		log.info("CenterPre Done!");
		return precision;
	}
	
	/**
     * 计算iou
     * @param  grand truth rectangle
     * @param  user result rectangle
     * @return iou precision
     */
	public static boolean iou(BoxStruct gt, BoxStruct ur) {
		
		double sThreshold = 0.5;
		
		boolean iou;
		
		double iou_x1 = Math.max((gt.x - gt.x / 2.0), (ur.x - ur.w / 2.0));
		double iou_y1 = Math.min((gt.y + gt.y / 2.0), (ur.y + ur.h / 2.0));
		
		double iou_x2 = Math.min((gt.x + gt.w / 2.0), (ur.x + ur.w / 2.0));
		double iou_y2 = Math.max((gt.y - gt.h / 2.0), (ur.y - ur.h / 2.0));
		
		double w = Math.abs(iou_x2 - iou_x1);
		double h = Math.abs(iou_y2 - iou_y1);
		
		double lou = (w * h) / (gt.w * gt.h + ur.w * gt.h - w * h);
		
		if (lou > sThreshold) {
			iou = true;
		} else {
			iou = false;
		}
		log.info("lou Done!");
		return iou;
	}
	
	public static List<String> getFileList(File file) {

		List<String> result = new ArrayList<String>();

		if (!file.isDirectory()) {
			System.out.println(file.getAbsolutePath());
			result.add(file.getAbsolutePath());
		} else {
			File[] directoryList = file.listFiles(new FileFilter() {
				public boolean accept(File file) {
					if (file.isFile() && (file.getName().indexOf("txt") > -1 || file.getName().indexOf("mat") > -1)) {
						return true;
					} else {
						return false;
					}
				}
			});
			for (int i = 0; i < directoryList.length; i++) {
				result.add(directoryList[i].getPath());
			}
		}

		return result;
	}
	
	/**
     * 单目标跟踪评测
     * @param request
     * @param  groud truth file
     * @param  user result file
     * @return evaluation result
     */ 
	public static SotResultStruct sotEvaluate(String groudtruth, String userResult) throws IOException {
		// ur = userResult; gt = groudTruth
		File gtf = new File(groudtruth);
		File urf = new File(userResult);
		List<String> gtList = new ArrayList<String>();
		List<String> urList = new ArrayList<String>();
		
		gtList = getFileList(gtf);
		urList = getFileList(urf);
		
		//String fileNameTmp = urList.get(urList.size() - 1);
		String suffixName = urList.get(urList.size() - 1).substring(urList.get(urList.size() - 1).lastIndexOf("."));
		if (suffixName != ".txt") {
			suffixName = ".mat";
		} 

		if (gtList.isEmpty()) {
			log.info("The path of groudTruth is empty!!!");
		}
		
		if (gtList.size() != urList.size()) {
			log.info("The number of user files is not accurate!");
		}
		
		String gtTmp = "";
		String urTmp = "";
		String attTmp;
		int[] attCnt = new int[attNum];
		int[] attFlag = new int[attNum];
		int[] attP = new int[attNum];
		int[] attIOU = new int[attNum];

		double fps = 0;
		int iouCnt = 0, centerCnt = 0, objects = 0;
		
		BoxStruct gtBox = new BoxStruct();
		BoxStruct urBox = new BoxStruct();
		SotResultStruct res = new SotResultStruct();
		
		for (String filename : gtList) {
            String subfileName = filename.substring(filename.lastIndexOf('\\') + 1, filename.length());
			BufferedReader gt = new BufferedReader(new FileReader(new File(filename)));
			BufferedReader ur = new BufferedReader(new FileReader(new File(userResult + subfileName)));
			BufferedReader att = new BufferedReader(new FileReader(new File(groudtruth + "att/" + subfileName)));
			
			while((gtTmp = gt.readLine()) != null && (attTmp = att.readLine()) != null) {
				objects ++;
				String[] gtStr = gtTmp.split(",");
				String[] attStr = attTmp.split(",");
				gtBox.x = Double.parseDouble(gtStr[0]);
				gtBox.y = Double.parseDouble(gtStr[1]);
				gtBox.w = Double.parseDouble(gtStr[2]);
				gtBox.h = Double.parseDouble(gtStr[3]);
				
				for (int i = 0; i < attNum; i ++) {
					attCnt[i] += Integer.parseInt(attStr[i]);
					attFlag[i] = Integer.parseInt(attStr[i]);
				}
				
				if ((urTmp = ur.readLine()) != null) {
					String[] urStr = urTmp.split(",");
					
					urBox.x = Double.parseDouble(urStr[0]);
					urBox.y = Double.parseDouble(urStr[1]);
					urBox.w = Double.parseDouble(urStr[2]);
					urBox.h = Double.parseDouble(urStr[3]);
					fps += Double.parseDouble(urStr[4]);
				}
				
				if (iou(gtBox, urBox)) {
					iouCnt ++;
					
					for (int i = 0; i < attNum; i ++) {
						if (attFlag[i] == 1) {
							attP[i] ++;
						}
					}
				}
				if (centerPre(gtBox, urBox)) {
					centerCnt ++;
					for (int i = 0; i < attNum; i ++) {
						if (attFlag[i] == 1) {
							attIOU[i] ++;
						}
					}
				}
			}
			
			gt.close();
			ur.close();
			att.close();
		}
			
		for (int i = 0; i < attNum; i ++) {
			if (attCnt[i] == 0) {
				attCnt[i] = Integer.MAX_VALUE;
			}
				
		}	
		
		res.setPrecision((double)centerCnt / objects);
		res.setIOU ((double)iouCnt / objects);
		res.setFPS(fps / objects);
		res.arc_p = (double)attP[0] / attCnt[0];
		res.bc_p = (double)attP[1] / attCnt[1];
		res.cm_p = (double)attP[2] / attCnt[2];
		res.fm_p = (double)attP[3] / attCnt[3];
		res.foc_p = (double)attP[4] / attCnt[4];
		res.iv_p = (double)attP[5] / attCnt[5];
		res.lr_p = (double)attP[6] / attCnt[6];
		res.ov_p = (double)attP[7] / attCnt[7];
		res.poc_p = (double)attP[8] / attCnt[8];
		res.sob_p = (double)attP[9] / attCnt[9];
		res.sv_p = (double)attP[10] / attCnt[10];
		res.vc_p = (double)attP[11] / attCnt[11];
		
		res.arc_iou = (double)attIOU[0] / attCnt[0];
		res.bc_iou = (double)attIOU[1] / attCnt[1];
		res.cm_iou = (double)attIOU[2] / attCnt[2];
		res.fm_iou = (double)attIOU[3] / attCnt[3];
		res.foc_iou = (double)attIOU[4] / attCnt[4];
		res.iv_iou = (double)attIOU[5] / attCnt[5];
		res.lr_iou = (double)attIOU[6] / attCnt[6];
		res.ov_iou = (double)attIOU[7] / attCnt[7];
		res.poc_iou = (double)attIOU[8] / attCnt[8];
		res.sob_iou = (double)attIOU[9] / attCnt[9];
		res.sv_iou = (double)attIOU[10] / attCnt[10];
		res.vc_iou = (double)attIOU[11] / attCnt[11];
		
		log.info("Evaluate Done!");
		return res;
	}
	
};