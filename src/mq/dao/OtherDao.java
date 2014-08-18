package mq.dao;

import java.util.HashMap;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.OtherDao;
import mq.mapper.OtherMapper;
import mq.mapper.TestMapper;
@Repository
public class OtherDao  {
	@Autowired
	OtherMapper otherMapper;
	
	public void insertServiceInfo(HashMap<String,Object> map){
		otherMapper.insertServiceInfo(map);
	}
    public void updateServiceInfo(HashMap<String,Object> map){
    	otherMapper.updateServiceInfo(map);
    }
    public List<HashMap<String,Object>>selectAllServiceInfo(){
    	return otherMapper.selectAllServiceInfo();
    }
    public HashMap<String,Object> selectOneServiceInfo(String id){
    	return otherMapper.selectOneServiceInfo(id);
    }
    public void deleteServiceInfo(String id){
    	otherMapper.deleteServiceInfo(id);
    }
    
    public void updateBaseInfo(HashMap<String,Object> map){
    	otherMapper.updateBaseInfo(map);
    }
    public List<HashMap<String,Object>>selectAllBaseInfo(){
    	return otherMapper.selectAllBaseInfo();
    }
    public HashMap<String,Object> selectOneBaseInfo(String id){
    	return otherMapper.selectOneBaseInfo(id);
    }
    public HashMap<String,Object> selectOneBaseInfoByCode(String code){
    	return otherMapper.selectOneBaseInfoByCode(code);
    }
    
    public HashMap<String,Object> selectOneUser(String username){
    	return otherMapper.selectOneUser(username);
    }
    public void updateUser(String username ,String pwd){
    	HashMap<String,Object> map=new HashMap<String, Object>();
    	map.put("name", username);
    	map.put("pwd", pwd);
    	otherMapper.updateUser(map);
    }
}