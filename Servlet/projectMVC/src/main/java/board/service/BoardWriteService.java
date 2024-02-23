package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		//데이터
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		System.out.println("BoardWriteService class 도착");
		
		// 세션
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName"); 
		String email =(String)session.getAttribute("memEmail");
		 
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		
	
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.insertBoard(map);
		request.setAttribute("su", su);
		
		return "/board/boardWrite.jsp";
	}

}
