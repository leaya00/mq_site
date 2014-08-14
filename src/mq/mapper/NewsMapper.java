package mq.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;



@Component
public interface NewsMapper {
    public String getTest(int id);
    public void insertNews(HashMap<String,Object> map);
    public ArrayList<HashMap<String,Object>>  getNews(HashMap<String,Object> map);
    public String getNewsCount(String typesql);
    public HashMap<String,Object> getNewsOne (String id);
    
    public  void updateNews(HashMap<String,Object> map);
    public HashMap<String,Object> getPreNewsId(String id);
    public HashMap<String,Object> getNextNewsId(String id);
}