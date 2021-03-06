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
    
    public void updateBaseInfo(HashMap<String,Object> map);
    public List<HashMap<String,Object>>selectAllBaseInfo();
    public HashMap<String,Object> selectOneBaseInfo(String id);
    public HashMap<String,Object> selectOneBaseInfoByCode(String code);
    
    public HashMap<String,Object> selectOneUser(String username);
    public void updateUser(HashMap<String,Object> map);
    
}