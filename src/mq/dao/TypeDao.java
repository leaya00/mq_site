package mq.dao;

import java.util.HashMap;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.TypeDao;
import mq.mapper.TestMapper;
import mq.mapper.TypeMapper;
@Repository
public class TypeDao  {
	@Autowired
	TypeMapper typeMapper;
	public HashMap<String,Object> getTypeOne(String id){
		return typeMapper.getTypeOne(id);
	}
    public List<HashMap<String,Object>>getTypes(String type){
    	return typeMapper.getTypes(type);
    }
    public void insertType(HashMap<String,Object> map){
    	typeMapper.insertType(map);
    }
    public void updateType(HashMap<String,Object> map){
    	typeMapper.updateType(map);
    }
    public String getTypes_topID(String type){
    	return typeMapper.getTypes_topID(type);
    }
    public List<HashMap<String,Object>>getTypesTop(String type,String top){
    	HashMap<String,Object> map=new HashMap<String, Object>();
    	map.put("top", top);
    	map.put("type", type);
    	return typeMapper.getTypesTop(map);
    }
}