package mq.dao;

import java.util.ArrayList;
import java.util.HashMap;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mq.dao.ProductsDao;
import mq.mapper.ProductsMapper;
@Repository
public class ProductsDao  {
	@Autowired
	ProductsMapper productsMapper;
	public void insertProducts(HashMap<String,Object> map){
		productsMapper.insertProducts(map);
	}
    public void updateProducts(HashMap<String,Object> map){
    	productsMapper.updateProducts(map);
    }
    public HashMap<String,Object> getProductsOne(String id){
    	return productsMapper.getProductsOne(id);
    }
    public ArrayList<HashMap<String,Object>> getProducts(String pageNo,String pageSize,String type){
    	int pageStart=(Integer.parseInt(pageNo)-1)*Integer.parseInt(pageSize);
		 HashMap<String,Object> map=new HashMap<String, Object>();
		 map.put("pagestart", pageStart);
		 map.put("pagesize", pageSize);
		 String typesql="1=1";
		 if(type.equals("-1")==false){
			 typesql="type="+type;
		 }
		 map.put("typesql", typesql);
    	return productsMapper.getProducts(map);
    }
    public String getProductsCount(String type){
    	 String typesql="1=1";
		 if(type.equals("-1")==false){
			 typesql="type="+type;
		 }
    	return productsMapper.getProductsCount(typesql);
    }
    public void deleteProducts(String id){
    	productsMapper.deleteProducts(id);
    }
    public void deleteAllProductdetail(String productid){
    	productsMapper.deleteAllProductdetail(productid);
    }
    public void deleteProductdetail(String id){
    	productsMapper.deleteProductdetail(id);
    }
    public void insertProductdetail(HashMap<String,Object> map){
    	productsMapper.insertProductdetail(map);
    }
    public void updateProductdetail(HashMap<String,Object> map){
    	productsMapper.updateProductdetail(map);
    }
    public HashMap<String,Object> getProductdetailOne(String id){
    	return productsMapper.getProductdetailOne(id);
    }
    public HashMap<String,Object> getProductdetail(String pageNo,String productid){
    	int pageStart=(Integer.parseInt(pageNo)-1);
		 HashMap<String,Object> map=new HashMap<String, Object>();
		 map.put("pagestart", pageStart);
		 map.put("productid", productid);
		 return productsMapper.getProductdetail(map);
    }
    public String getProductdetailCount(String productid){
    	return productsMapper.getProductdetailCount(productid);
    }
    public  ArrayList<HashMap<String,Object>>getProductdetailByProductid(String productid){
    	return productsMapper.getProductdetailByProductid(productid);
    }
    public  ArrayList<HashMap<String,Object>>getProductsIndexTop(){
    	return productsMapper.getProductsIndexTop();
    }
}