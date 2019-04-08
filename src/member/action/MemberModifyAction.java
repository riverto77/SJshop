package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import member.svc.MemberModifyService;
import member.vo.MemberBean;
import vo.ActionForward;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		HttpSession session = request.getSession();
		boolean isModifySuccess = false;
		MemberBean member = new MemberBean();
		MemberModifyService memberModifyService = new MemberModifyService();
		
		String id = (String) session.getAttribute("id");

		if (session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("로그인이 필요합니다");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		}
		
		if (request.getParameter("id") != null && id.equals("admin")) {
			id = request.getParameter("id");
		}
		
		member.setId(id);
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setBirth(Integer.parseInt(request.getParameter("birth")));
		member.setEmail(request.getParameter("email"));
		member.setEmail1(request.getParameter("email1"));
		member.setGender(request.getParameter("gender"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setAddr3(request.getParameter("addr3"));
		
		isModifySuccess = memberModifyService.memberModify(member);
		
		if (!isModifySuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보를 수정하였습니다');");
			out.println("history.back();");
			out.println("</script>");
		}
		
		return forward;
	}

}
