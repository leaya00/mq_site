package mq.dao;

import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.TestDao;
import mq.mapper.TestMapper;
@Repository
public class TestDao  {
	@Autowired
	TestMapper testMapper1;
	public void insertTest(HashMap<String,String> map) {
		testMapper1.insertTest(map);
		
	}

}