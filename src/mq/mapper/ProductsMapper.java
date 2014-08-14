package mq.mapper;

import java.util.HashMap;

import org.springframework.stereotype.Component;



@Component
public interface ProductsMapper {
    public String getTest(int id);
    public void insertTest(HashMap<String,String> map);
}