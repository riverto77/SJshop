package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.svc.joinService;
import member.vo.MemberBean;
import vo.ActionForward;

public class joinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		ActionForward forward = null;
		MemberBean memberbean = new MemberBean();
		
		memberbean.setId(request.getParameter("id"));
		memberbean.setPw(request.getParameter("pw"));
		memberbean.setName(request.getParameter("name"));
		memberbean.setBirth(Integer.parseInt(!(request.getParameter("birth").equals("") || request.getParameter("birth")==null)?request.getParameter("birth"):"0"));
		memberbean.setGender(request.getParameter("gender"));
		memberbean.setTel(request.getParameter("tel"));
		memberbean.setAddr1(request.getParameter("addr1"));
		memberbean.setAddr2(request.getParameter("addr2"));
		memberbean.setAddr3(request.getParameter("addr3"));
		memberbean.setEmail(request.getParameter("email"));
		memberbean.setEmail1(request.getParameter("email1"));
		
		joinService joinservice = new joinService();
		boolean joinMember = joinservice.joinMember(memberbean);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(joinMember == false) {
			out.println("<script>");
			out.println("alert('회원등록이 실패하였습니다. 다시 작성해 주세요')");
			out.println("history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('환영합니다')");
			out.println("location.href='../main.jsp'");
			out.println("</script>");
		}
		return forward;
	}

}
