package mq.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;



@Component
public interface ProductsMapper {
    public void insertProducts(HashMap<String,Object> map);
    public void updateProducts(HashMap<String,Object> map);
    public HashMap<String,Object> getProductsOne(String id);
    public ArrayList<HashMap<String,Object>> getProducts(HashMap<String,Object> map);
    public String getProductsCount(String typesql);
    public void deleteProducts(String id);
    public void deleteAllProductdetail(String productid);
    public void deleteProductdetail(String id);
    
}