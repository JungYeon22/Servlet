package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("pg 값: " + pg);
		//페이징 처리
		int endNum = pg * 5;
		int startNum = endNum - 4;

		//DB에서 select로 가져오기
		BoardDAO boardDAO = BoardDAO.getInstance();
		Map<String, Integer> map =new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.boardList(map);

		int totalA = boardDAO.getTotalA();		//총 글수
		int totalP = (totalA + 4) / 5;			//총 페이지수
		
		request.setAttribute("list", list);
		request.setAttribute("totalA", totalA);
		request.setAttribute("totalP", totalP);
		
		return "/board/boardList.jsp";
	}

}
