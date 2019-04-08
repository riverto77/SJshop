package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import member.action.MemberDeleteAction;
import member.action.MemberInfoAction;
import member.action.MemberListAction;
import member.action.MemberModifyAction;
import member.action.MemberMypageAction;
import member.action.idCheckAction;
import member.action.idCheckProAction;
import member.action.joinAction;
import vo.ActionForward;

/**
 * Servlet implementation class memberController
 */
@WebServlet("*.mem")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String RequestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = RequestURI.substring(contextPath.length());
    	
    	ActionForward forward = null;
    	Action action = null;
    	
    	if(command.equals("/join.mem")) {
    		forward = new ActionForward();
    		forward.setPath("member/joinForm.jsp");
    	} else if(command.equals("/member/joinPro.mem")) {
    		action = new joinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	} else if(command.equals("/admin/memberList.mem")) {
    		action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
    	
    	 else if(command.equals("/admin/memberInfo.mem")) {
     		action = new MemberInfoAction();
 			try {
 				forward = action.execute(request, response);
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
     	}
    	
    	 else if(command.equals("/admin/memberModify.mem")) {
      		action = new MemberModifyAction();
  			try {
  				forward = action.execute(request, response);
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
      	}
    	
    	 else if(command.equals("/admin/memberDelete.mem")) {
       		action = new MemberDeleteAction();
   			try {
   				forward = action.execute(request, response);
   			} catch (Exception e) {
   				e.printStackTrace();
   			}
       	}
    	
    	 else if (command.equals("/member/idcheck.mem")) {
				action = new idCheckAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    	
    	 else if (command.equals("/member/idcheckPro.mem")) {
				action = new idCheckProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    	
    	 else if(command.equals("/member/myPage.mem")) {
      		action = new MemberMypageAction();
  			try {
  				forward = action.execute(request, response);
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
      	}
    	
    	 else if(command.equals("/member/memberModify.mem")) {
      		action = new MemberModifyAction();
  			try {
  				forward = action.execute(request, response);
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
      	}
     	
    	
    	
    	
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dispatchar = request.getRequestDispatcher(forward.getPath());
    			dispatchar.forward(request, response);
    		}
    	}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
