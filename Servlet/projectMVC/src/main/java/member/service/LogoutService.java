package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class LogoutService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse reponse) throws Throwable {
		//데이터
		HttpSession session = request.getSession();	// 세션 생성
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		
		session.invalidate(); // 무효화 -> 전부 제거하겠다.
		
		return "/member/logout.jsp";
	}

}
