package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));	//지우고 싶은 글
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.deleteBoard(seq);		//삭제하기
		
		request.setAttribute("su", su);
		//return "boardDelete.jsp"
		return "/board/boardList.do?pg=1";
	}

}
