package com.lcf.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.lcf.model.Information;

public interface InformationMapper {
	
	public Information findInfoByLoc(@Param("location") Integer location);
	
	public Information findInfoById(@Param("id") Integer id);
	
	public List<Information> getInfoList(@Param("info")Information info);

	public void addInfo(Information info);

	public void editInfo(Information info);
	
	public void deleteInfo(int id);
}
