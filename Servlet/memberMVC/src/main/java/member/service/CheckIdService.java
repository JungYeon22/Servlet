package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		// 데이터
		String id = request.getParameter("id");
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.isExistId(id);
		String result = "";
		if(exist){
			result= "exist";
		}else {
			result = "non_exist";
		}
		request.setAttribute("result", result);
		
		return "/member/checkId.jsp";
	}

}
