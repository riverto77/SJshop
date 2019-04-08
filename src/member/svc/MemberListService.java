package member.svc;

import static db.jdbcUtil1.*;

import java.sql.Connection;
import java.util.ArrayList;

import member.dao.MemberDAO;
import member.vo.MemberBean;

public class MemberListService {

	public ArrayList<MemberBean> MemberList(int page, int limit, String select, String search) throws Exception {
		
		ArrayList<MemberBean> MemberList = null;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		MemberList = memberDAO.MemberList(page, limit, select, search);
		close(con);
		return MemberList;
	}
	
	public int getListCount(String select, String search) throws Exception {
		int memberCount = 0;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		memberCount = memberDAO.memberListCount(select, search);
		close(con);
		return memberCount;
	}
}
