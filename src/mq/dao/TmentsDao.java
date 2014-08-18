package mq.dao;

import java.util.ArrayList;
import java.util.HashMap;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.TmentsDao;
import mq.mapper.TestMapper;
import mq.mapper.TmentsMapper;
@Repository
public class TmentsDao  {
	@Autowired
	TmentsMapper tmentsMapper;
	public ArrayList<HashMap<String,Object>>selectTments(String pageNo,String pageSize){
		 int pageStart=(Integer.parseInt(pageNo)-1)*Integer.parseInt(pageSize);
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("pagestart", pageStart);
		map.put("pagesize",  pageSize);
		return tmentsMapper.selectTments(map);
	}
	public String getTmentsCount(){
		return tmentsMapper.getTmentsCount();
	}
	public HashMap<String,Object>selectOneTment(String id){
		return tmentsMapper.selectOneTment(id);
	}
	public void insertTment(HashMap<String,Object> map){
		tmentsMapper.insertTment(map);
	}
	public void updateTment(HashMap<String,Object> map){
		tmentsMapper.updateTment(map);
	}
	public void deleteTment(String id){
		tmentsMapper.deleteTment(id);
	}
	public HashMap<String,Object>getPreTmentId(String id){
		return tmentsMapper.getPreTmentId(id);
	}
	public HashMap<String,Object>getNextTmentId(String id){
		return tmentsMapper.getNextTmentId(id);
	}

}