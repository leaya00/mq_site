package mq.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;



@Component
public interface OtherMapper {
   
    public void insertServiceInfo(HashMap<String,Object> map);
    public void updateServiceInfo(HashMap<String,Object> map);
    public void deleteServiceInfo(String id);
    public List<HashMap<String,Object>>selectAllServiceInfo();
    public HashMap<String,Object> selectOneServiceInfo(String id);
}