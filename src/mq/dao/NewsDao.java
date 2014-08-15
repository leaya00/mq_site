package mq.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.NewsDao;
import mq.mapper.NewsMapper;
@Repository
public class NewsDao  {
	@Autowired
	NewsMapper newsMapper1;
	public void insertNews(HashMap<String,Object> map) {
		newsMapper1.insertNews(map);
		
	}
	 public ArrayList<HashMap<String,Object>>  getNews(String pageNo,String pageSize,String type){
		 int pageStart=(Integer.parseInt(pageNo)-1)*Integer.parseInt(pageSize);
		 HashMap<String,Object> map=new HashMap<String, Object>();
		 map.put("pagestart", pageStart);
		 map.put("pagesize", pageSize);
		 String typesql="1=1";
		 if(type.equals("-1")==false){
			 typesql="type="+type;
		 }
		 map.put("typesql", typesql);
		 return newsMapper1.getNews(map);
	 }
	 public HashMap<String,Object> getNewsOne (String id){
		 
		 return newsMapper1.getNewsOne(id);
	 }
	 public String getNewsCount(String type){
		 String typesql="1=1";
		 if(type.equals("-1")==false){
			 typesql="type="+type;
		 }
		 return newsMapper1.getNewsCount(typesql); 
	 }
	 public  void updateNews(HashMap<String,Object> map){
		  newsMapper1.updateNews(map);
	 }
	 public HashMap<String,Object> getPreNewsId(String id){
		 return newsMapper1.getPreNewsId(id);
	 }
	 public HashMap<String,Object> getNextNewsId(String id){
		 return newsMapper1.getNextNewsId(id);
	 }
	 public void deleteNews(String id){
		 newsMapper1.deleteNews(id);
	 }
}