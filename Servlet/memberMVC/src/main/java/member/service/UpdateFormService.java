package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		HttpSession session = request.getSession();	// 세션 생성
		String id = (String)session.getAttribute("memId");

		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.memberById(id);
		
		// request를 공유하고 있기때문에 객체를 담아서 공유한다.
		request.setAttribute("memberDTO", memberDTO); 
 		return "/member/updateForm.jsp";
	}

}
