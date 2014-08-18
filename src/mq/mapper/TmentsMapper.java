package mq.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;



@Component
public interface TmentsMapper {
	public ArrayList<HashMap<String,Object>>selectTments(HashMap<String,Object> map);
	public String getTmentsCount();
	public HashMap<String,Object>selectOneTment(String id);
	public void insertTment(HashMap<String,Object> map);
	public void updateTment(HashMap<String,Object> map);
	public void deleteTment(String id);
	public HashMap<String,Object>getPreTmentId(String id);
	public HashMap<String,Object>getNextTmentId(String id);
	
}