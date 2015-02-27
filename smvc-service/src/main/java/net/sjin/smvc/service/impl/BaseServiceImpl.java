package net.sjin.smvc.service.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import net.sjin.smvc.service.BaseService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

@SuppressWarnings("unchecked")
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	@Autowired
	protected SqlSessionTemplate sqlSessionTemplate;

	protected String getNamespace() {
		Type genType = this.getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		return ((Class<T>) params[0]).getCanonicalName();
	}

	public int deleteByPrimaryKey(Integer id) {
		return sqlSessionTemplate.delete(
				getNamespace() + ".deleteByPrimaryKey", id);
	}

	public int insert(T record) {
		return sqlSessionTemplate.insert(getNamespace() + ".insert", record);
	}

	public int insertSelective(T record) {
		return sqlSessionTemplate.insert(getNamespace() + ".insertSelective",
				record);
	}

	public int updateByPrimaryKeySelective(T record) {
		return sqlSessionTemplate.update(getNamespace()
				+ ".updateByPrimaryKeySelective", record);
	}

	public int updateByPrimaryKey(T record) {
		return sqlSessionTemplate.update(
				getNamespace() + ".updateByPrimaryKey", record);
	}

	public T selectByPrimaryKey(Integer id) {
		return (T) sqlSessionTemplate.selectOne(getNamespace()
				+ ".selectByPrimaryKey", id);
	}

	public List<T> selectPage(T record) {
		return (List<T>) sqlSessionTemplate.selectList(getNamespace()
				+ ".select_page", record);
	}
}
