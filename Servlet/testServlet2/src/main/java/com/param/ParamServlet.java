package com.param;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/param")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//입력받은 데이터
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		//나이 처리
		String a = "";
		if(age >= 20) a = "성인";
		if(age <  20) a = "청소년";
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<p> 나의 이름은 <strong>" + name + "</strong>이고, "
				+ "나이는 <strong>" + age + "</strong>살 입니다.</p><br>");
		out.println("<p> 그래서 <strong style='color: red; font-size:30px'>" + a + "</strong>입니다.</p>");
//		out.println("<input type='button' value='뒤로' "
//				+ "onclick=javascript:location.href='http://localhost:8080/testServlet2/exam/param.html'>");
		out.println("<input type='button' value='뒤로' "
				+ "onclick=history.go(-1)>");
		out.println("</body>");
		out.println("</html>");
	}

}
