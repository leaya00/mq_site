package mq.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;



@Component
public interface TypeMapper {
    public HashMap<String,Object> getTypeOne(String id);
    public List<HashMap<String,Object>>getTypes(String type);
    public void insertType(HashMap<String,Object> map);
    public void updateType(HashMap<String,Object> map);
    public String getTypes_topID(String type);
    public List<HashMap<String,Object>>getTypesTop(HashMap<String,Object> map);
    public void deleteType(String id);
}