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
}