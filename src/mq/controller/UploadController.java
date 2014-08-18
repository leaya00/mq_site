package mq.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UploadController {
	String baseFilePath = "userImage";

	@RequestMapping(value = "/ckUploadImage")
	public void ckUploadImage(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "type") String type) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String message = "";
		String subPath="";
		if(type.equals("1")){
			subPath="news";
		}
		if(type.equals("2")){
			subPath="products";
		}
		if(type.equals("3")){
			subPath="tments";
		}
		if(type.equals("99")){
			subPath="type";
		}
		
		String path = request.getSession().getServletContext()
				.getRealPath(baseFilePath+"/"+subPath);
		File tmp=new File(path);
		if(tmp.exists()==false){
			tmp.mkdirs();
		}
		MultipartFile mfile = multipartRequest.getFile("upload");
		String file_ture_name = UUID.randomUUID().toString();
		if (mfile.getSize() <= 1024 * 1024 * 5) {
			String pic_type = mfile.getContentType();
			
			String extName = null;
			if (pic_type.equals("image/jpeg")||pic_type.equals("image/jpg")||pic_type.equals("image/pjpeg")) {
				extName = ".jpg";
			} else if (pic_type.equals("image/png")) {
				extName = ".png";
			} else if (pic_type.equals("image/bmp")) {
				extName = ".bmp";
			} else if (pic_type.equals("image/gif")) {
				extName = ".gif";
			} else {
				message = "文件类型必须是png/gif/jpg/bmp";

			}
			if (extName != null) {
				file_ture_name=file_ture_name.concat(extName);
				File newfile = new File(path, file_ture_name);
				mfile.transferTo(newfile);
			}
		} else {
			message = "文件大小不能超过5M";
		}

		String funcNum = request.getParameter("CKEditorFuncNum");
		String url = baseFilePath+"/"+subPath+"/"+file_ture_name;
		response.setHeader("Content-type", "text/html;charset=utf-8");
		response.getWriter()
				.print(String
						.format("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction(%s, '%s', '%s');</script>",
								funcNum, url, message));
	}
	@RequestMapping(value = "/uploadThumbnail")
	public void uploadThumbnail(HttpServletRequest request,
			HttpServletResponse response,@RequestParam(value = "w") int width,@RequestParam(value = "h") int height) throws Exception {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		String message = "";
		String path = request.getSession().getServletContext()
				.getRealPath(baseFilePath+"/thumbnail");
		File tmp=new File(path);
		if(tmp.exists()==false){
			tmp.mkdirs();
		}
		MultipartFile mfile = multipartRequest.getFile("upload");
		String file_ture_name = UUID.randomUUID().toString();
		if (mfile.getSize() <= 1024 * 1024 * 5) {
			String pic_type = mfile.getContentType();
			
			String extName = null;
			if (pic_type.equals("image/jpeg")||pic_type.equals("image/jpg")||pic_type.equals("image/pjpeg")) {
				extName = ".jpg";
			} else if (pic_type.equals("image/png")) {
				extName = ".png";
			} else if (pic_type.equals("image/bmp")) {
				extName = ".bmp";
			} else if (pic_type.equals("image/gif")) {
				extName = ".gif";
			} else {
				message = "文件类型必须是png/gif/jpg/bmp";

			}
			if (extName != null) {
				file_ture_name=file_ture_name+String.format("_%dx%d",width,height);
				file_ture_name=file_ture_name.concat(extName);
				File newfile = new File(path, file_ture_name);
				mfile.transferTo(newfile);
				Thumbnails.of(newfile) 
		        .size(width, height).keepAspectRatio(false) 
		        .toFile(newfile);
			}
		} else {
			message = "文件大小不能超过5M";
		}

		
		String url = baseFilePath+"/thumbnail/"+file_ture_name;
		response.setHeader("Content-type", "text/html;charset=utf-8");
		String funName="uploadImageCallFunction";
		if(request.getParameter("fun")!=null){
			funName=request.getParameter("fun");
		}
		response.getWriter()
				.print(String
						.format("<script type='text/javascript'>window.parent.%s( '%s', '%s');</script>",
								 funName,url, message));
	}
}
