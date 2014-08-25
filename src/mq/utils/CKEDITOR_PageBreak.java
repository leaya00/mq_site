package mq.utils;

public class CKEDITOR_PageBreak {
	public static String  pagebreak="<div style=\"page-break-after: always\"><span style=\"display:none\">&nbsp;</span></div>" ;
	public static String token="<div style=\"page-break-after: always\">(.*?)</div>";
	
	public static String[] getPageArray(String content){
		return content.split(token);
	}
}
