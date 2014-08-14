package mq.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthorityAnnotationInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HandlerMethod handler2=(HandlerMethod) handler;
		MustLogin mustLogin=handler2.getMethodAnnotation(MustLogin.class);
		if(mustLogin==null){
			return super.preHandle(request, response, handler);
		}else{
			//登录校验
			response.sendRedirect("index.html");
			return false;
		}
		
	}

}
