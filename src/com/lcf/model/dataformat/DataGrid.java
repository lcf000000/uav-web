package com.lcf.model.dataformat;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 后台向前台返回JSON，用于easyui的datagrid
 * 
 * @author zh
 * 
 */
public class DataGrid implements Serializable {

	private Long total;	// 总记录数
	private int Draw;
	private int pageNum;
	private int pageSize;
	private int recordsFiltered;
	private String error;
	private List data = new ArrayList<>();
	public DataGrid(){
		super();
	}
	public DataGrid(long total, List data){  
        super();  
        this.total = total;  
        this.data = data;  
    }  
	
	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getDraw() {
		return Draw;
	}

	public void setDraw(int draw) {
		Draw = draw;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRecordsFiltered() {
		return recordsFiltered;
	}
	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}

}
