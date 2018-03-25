package com.lcf.util;

import com.jmatio.io.MatFileReader;
import com.jmatio.types.MLArray;
import com.jmatio.types.MLDouble;

public class ReadMatUtil { 
	public static double[][] ReadMat(String matPath, String matrixName) throws Exception {
		MatFileReader read = new MatFileReader(matPath);
		MLArray mlArray = read.getMLArray(matrixName);
		MLDouble d = (MLDouble) mlArray;
		double[][] matrix = (d.getArray());
		
		return matrix;
	}
}