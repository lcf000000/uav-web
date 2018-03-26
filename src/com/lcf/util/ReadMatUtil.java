package com.lcf.util;

import com.jmatio.io.MatFileReader;
import com.jmatio.types.MLArray;
import com.jmatio.types.MLDouble;
import com.jmatio.types.MLStructure;

public class ReadMatUtil {
	
	public static double[][] getMatRes(MLStructure mat) {
		MLArray res = mat.getField("res");
		MLDouble d_res = (MLDouble) res;
		double [][] resArray = d_res.getArray();
		return resArray;
	}
	
	public static double[][] getMatFps(MLStructure mat) {
		MLArray fps = mat.getField("fps");
		MLDouble d_fps = (MLDouble) fps;
		double [][] fpsArray = d_fps.getArray();
		return fpsArray;
	}
	
	public static MLStructure ReadMat(String matPath) throws Exception {
		MatFileReader read = new MatFileReader(matPath);
		MLArray mlArray = read.getMLArray("res");
		MLStructure ms = (MLStructure) mlArray;
		return ms;
	}
}