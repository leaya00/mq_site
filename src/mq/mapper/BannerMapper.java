package mq.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Component;



@Component
public interface BannerMapper {
    public ArrayList<HashMap<String,Object>> selectBannerList();
    public HashMap<String,Object> selectBannerOne(String id);
    public void insertBanner(HashMap<String,Object> map);
    public void updateBanner(HashMap<String,Object> map);
    public void deleteBanner(String id);
}