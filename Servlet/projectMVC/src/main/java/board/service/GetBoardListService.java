package board.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("pg 값: " + pg);
		
		//페이징 처리 ( 페이지당 5페이지)
		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int startNum2 = startNum-1;
		int count = endNum - startNum2;
		
		//DB에서 select로 가져오기
		BoardDAO boardDAO = BoardDAO.getInstance();
		Map<String, Integer> map =new HashMap<>();
		map.put("startNum2", startNum2);
		map.put("count", count);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.boardList(map);

		int totalA = boardDAO.getTotalA();		//총 글수
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePaingHTML();
		
		//List를 Json으로 변환
		JSONObject json = new JSONObject();	// json의 { }
		if(list != null) {
			JSONArray array = new JSONArray();	//json 배열의 []
			for(BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();	// 배열 안의 {}
				temp.put("seq", boardDTO.getSeq());
				temp.put("id", boardDTO.getId());
				temp.put("name", boardDTO.getName());
				temp.put("email", boardDTO.getEmail());
				temp.put("subject", boardDTO.getSubject());
				temp.put("content", boardDTO.getContent());
				temp.put("ref", boardDTO.getRef());
				temp.put("lev", boardDTO.getLev());
				temp.put("step", boardDTO.getStep());
				temp.put("pseq", boardDTO.getPseq());
				temp.put("reply", boardDTO.getReply());
				temp.put("hit", boardDTO.getHit());
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				temp.put("logtime", sdf.format(boardDTO.getLogtime()));	//Date => String 변환
				
				array.add(temp);
			}
			json.put("list", array);
		}
		
		
		//BoardPaging => JSON변환
		/* json.put("pagingHTML", boardPaging.getPagingHTML()+""); String으로 변환*/
		json.put("pagingHTML", boardPaging.getPagingHTML().toString());
		
		//세션
		HttpSession session = request.getSession();
		String memId = (String)session.getAttribute("memId");
		
		request.setAttribute("memId", memId);
		request.setAttribute("json", json);
		return "/board/getBoardList.jsp";
	}

}
