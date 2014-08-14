package mq.mapper;

import java.util.HashMap;

import org.springframework.stereotype.Component;



@Component(value="testMapper")
public interface TestMapper {
    public String getTest(int id);
    public void insertTest(HashMap<String,String> map);
}