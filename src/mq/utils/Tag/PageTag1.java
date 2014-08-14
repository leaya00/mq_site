package mq.utils.Tag;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * 分页标签
 * 
 */
public class PageTag1 extends TagSupport {
	private static final long serialVersionUID = 5729832874890369508L;
	private String url; // 请求URI
	private int pageSize = 10; // 每页要显示的记录数
	private int pageNo = 1; // 当前页号
	private int recordCount; // 总记录数

	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		int pageCount = (recordCount + pageSize - 1) / pageSize; // 计算总页数

		// 拼写要输出到页面的HTML文本
		StringBuilder sb = new StringBuilder();

		sb.append("<style type=\"text/css\">");
		sb.append(".fenye_con2 {");
		sb.append("width: auto;");
		sb.append("MARGIN-RIGHT: auto;");
		sb.append("MARGIN-LEFT: auto;");
		sb.append("	padding-top: 15px;");
		sb.append("	border-top: 0px solid #d9d9d9;");
		sb.append("	overflow: hidden;");
		sb.append("	zoom: 1;");
		sb.append("	clear: both;");
		sb.append("	float: right;");
		sb.append("	}");

		sb.append(".fenye_con2 a {");
		sb.append("	display: block;");
		sb.append("	width: 30px;");
		sb.append("	height: 30px;");
		sb.append("	color: #666;");
		sb.append("	text-align: center;");
		sb.append("	border-bottom: 1px solid #e0e0e0;");
		sb.append("	border-top: 1px solid #e0e0e0;");
		sb.append("	border-right: 1px solid #e0e0e0;");
		sb.append("	float: left;");
		sb.append("	line-height: 30px;");
		sb.append("	}");

		sb.append(".fenye_con2 a.width_60 {");
		sb.append("	display: block;");
		sb.append("width: 60px;");
		sb.append("height: 30px;");
		sb.append("color: #666;");
		sb.append("}");

		sb.append(".fenye_con2 .fenye_home {");
		sb.append("	border-left: 1px solid #e0e0e0;");
		sb.append("	}");
		
		sb.append(".fenye_con2 span {");
			sb.append("	display: block;");
		sb.append("	width: 30px;");
		sb.append("	height: 30px;");
		sb.append("color: #666;");
		sb.append("text-align: center;");
		sb.append("border-bottom: 1px solid #e0e0e0;");
		sb.append("border-top: 1px solid #e0e0e0;");
		sb.append("border-right: 1px solid #e0e0e0;");
		sb.append("float: left;");
		sb.append("line-height: 30px;");
		sb.append("padding: 0px;");
		sb.append("background: #f4f4f4;");
		sb.append("color: #cb2027;");
		sb.append("}");
		sb.append("</style>\r\n");
		sb.append("<div class=\"fenye_con2\">\r\n");
		if (recordCount == 0) {
			sb.append("<strong>没有可显示的项目</strong>\r\n");
		} else {
			// 页号越界处理
			if (pageNo > pageCount) {
				pageNo = pageCount;
			}
			if (pageNo < 1) {
				pageNo = 1;
			}

			sb.append("<form method=\"get\" action=\"").append(this.url)
					.append("\" name=\"qPagerForm\">\r\n");

			// 获取请求中的所有参数
			HttpServletRequest request = (HttpServletRequest) pageContext
					.getRequest();
			Enumeration<String> enumeration = request.getParameterNames();
			String name = null; // 参数名
			String value = null; // 参数值
			// 把请求中的所有参数当作隐藏表单域
			while (enumeration.hasMoreElements()) {
				name = enumeration.nextElement();
				value = request.getParameter(name);
				// 去除页号
				if (name.equals("pageNo")) {
					if (null != value && !"".equals(value)) {
						pageNo = Integer.parseInt(value);
					}
					continue;
				}
				sb.append("<input type=\"hidden\" name=\"").append(name)
						.append("\" value=\"").append(value).append("\"/>\r\n");
			}

			// 把当前页号设置成请求参数
			sb.append("<input type=\"hidden\" name=\"").append("pageNo")
					.append("\" value=\"").append(pageNo).append("\"/>\r\n");

			// 首页
			sb.append("<a class='width_60 fenye_home' href=\"javascript:turnOverPage(").append((1))
					.append(")\">首页</a>\r\n");
			// 上一页处理
			if (pageNo == 1) {
				sb.append("<span style='width:60px;'>上一页").append("</span>\r\n");
			} else {
				sb.append("<a class='width_60' href=\"javascript:turnOverPage(")
						.append((pageNo - 1)).append(")\">上一页</a>\r\n");
			}

			// 如果前面页数过多,显示"..."
			int start = 1;
			if (this.pageNo > 4) {
				start = this.pageNo - 1;
				
			}
			if(this.pageNo> pageCount-4){
				start =pageCount-4;
			}
			if(start<1){
				start=1;
			}
			// 显示当前页附近的页
			int end = this.pageNo + 3;
			if (end > pageCount) {
				end = pageCount;
			}
			for (int i = start; i <= end; i++) {
				if (pageNo == i) { // 当前页号不需要超链接
					sb.append("<span >").append(i)
							.append("</span>\r\n");
				} else {
					sb.append("<a href=\"javascript:turnOverPage(").append(i)
							.append(")\">").append(i).append("</a>\r\n");
				}
			}
			// 如果后面页数过多,显示"..."

			// 下一页处理
			if (pageNo == pageCount) {
				sb.append("<span style='width:60px;'>下一页").append("</span>\r\n");
			} else {
				sb.append("<a class='width_60' href=\"javascript:turnOverPage(")
						.append((pageNo + 1)).append(")\">下一页</a>\r\n");
			}
			sb.append("<a class='width_60' href=\"javascript:turnOverPage(").append((pageCount))
					.append(")\">末页</a>\r\n");
			sb.append("</form>\r\n");

			// 生成提交表单的JS
			sb.append("<script language=\"javascript\">\r\n");
			sb.append("  function turnOverPage(no){\r\n");
			sb.append("    if(no>").append(pageCount).append("){");
			sb.append("      no=").append(pageCount).append(";}\r\n");
			sb.append("    if(no<1){no=1;}\r\n");
			sb.append("    document.qPagerForm.pageNo.value=no;\r\n");
			sb.append("    document.qPagerForm.submit();\r\n");
			sb.append("  }\r\n");
			sb.append("</script>\r\n");
		}
		sb.append("</div>\r\n");

		// 把生成的HTML输出到响应中
		try {
			pageContext.getOut().println(sb.toString());
		} catch (IOException e) {
			throw new JspException(e);
		}
		return SKIP_BODY; // 本标签主体为空,所以直接跳过主体
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}
}