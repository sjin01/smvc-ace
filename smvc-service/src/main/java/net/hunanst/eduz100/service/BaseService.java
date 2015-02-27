package net.hunanst.eduz100.service;

import java.util.List;

public interface BaseService<T> {
	
	public int deleteByPrimaryKey(Integer id);

	public int insert(T record);

	public int insertSelective(T record);

	public int updateByPrimaryKeySelective(T record);

	public int updateByPrimaryKey(T record);

	public T selectByPrimaryKey(Integer id);
	
	public List<T> selectPage(T record);
}
