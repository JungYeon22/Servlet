package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardReplyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		int pseq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		System.out.println("BoardReplyFormService");
		
		request.setAttribute("pseq", pseq);
		request.setAttribute("pg", pg);
		return "boardReplyForm.jsp";
	}

}
