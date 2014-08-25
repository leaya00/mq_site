package mq.dao;

import java.util.ArrayList;
import java.util.HashMap;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.BannerDao;
import mq.mapper.BannerMapper;
import mq.mapper.TestMapper;
@Repository
public class BannerDao  {
	@Autowired
	BannerMapper bannerMapper;
	
	  public ArrayList<HashMap<String,Object>> selectBannerList(){
		  return bannerMapper.selectBannerList();
	  }
	    public HashMap<String,Object> selectBannerOne(String id){
	    	return bannerMapper.selectBannerOne(id);
	    }
	    public void insertBanner(HashMap<String,Object> map){
	    	bannerMapper.insertBanner(map);
	    }
	    public void updateBanner(HashMap<String,Object> map){
	    	bannerMapper.updateBanner(map);
	    }
	    public void deleteBanner(String id){
	    	bannerMapper.deleteBanner(id);
	    }
	    

}