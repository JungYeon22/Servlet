package com.person;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/person")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 데이터 받기
		String name = request.getParameter("name");
		int genderNum = Integer.parseInt(request.getParameter("gender"));
		String color = request.getParameter("color");
		String[] hobbies = request.getParameterValues("hobby");
		String[] subjects = request.getParameterValues("subject");
		
		//데이터 처리
		String gender = "";
		if(genderNum==0) gender = "남자";
		else gender = "여자";
		
		// 응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<style>");
		out.println("body{color:" + color + ";}");
		out.println("</style>");
		out.println("<body>");
		out.println("<h3>이름 : " + name + "<h3>");
		out.println("<h3>성별 : " + gender + "<h3>");
		out.println("<h3>색깔 : " + color + "<h3>");
		out.println("<h3>취미 : ");
		if(hobbies == null) {
			out.println("취미가 없습니다.");
		}else {
			for(int i=0;i < hobbies.length;i++) {
				out.println(hobbies[i] + " ");
			}
		}
		out.println("</h3>");
		out.println("<h3>과목 : ");
		for(int i=0;i < subjects.length;i++) {
			out.println(subjects[i] + "   ");
		}
		out.println("</h3>");
		out.println("</body>");
		out.println("</html>");
	}

	

}
