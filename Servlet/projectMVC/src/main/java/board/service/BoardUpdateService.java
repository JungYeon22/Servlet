package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		
		//데이터
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String seq = request.getParameter("seq");
		System.out.println("BoardUpdateService class 도착");
		
		// 세션
		HttpSession session = request.getSession(); 
		 
		Map<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		
	
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.updateBoard(map);
		request.setAttribute("su", su);
		
		return "/board/boardUpdate.jsp";
	}

}
