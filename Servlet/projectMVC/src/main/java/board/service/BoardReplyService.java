package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardReplyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		//데이터
		int pseq = Integer.parseInt(request.getParameter("pseq")); 
		int pg = Integer.parseInt(request.getParameter("pg"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		System.out.println("pseq : " + pseq);
		
		// 세션
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName"); 
		String email =(String)session.getAttribute("memEmail");
		 
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		map.put("pseq", pseq);	//원글번호
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.boardReply(map);
		request.setAttribute("su", su);
		
		return "boardReply.jsp";
	}

}
