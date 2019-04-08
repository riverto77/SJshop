package member.svc;

import java.sql.Connection;

import member.dao.MemberDAO;

import static db.jdbcUtil1.*;

public class MemberDeleteService {

	public boolean authority(String id, String pw) throws Exception {

		boolean idCheck = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		idCheck = memberDAO.authority(id, pw);
		close(con);

		return idCheck;
	}
	
	
	public boolean deleteMember(String id) throws Exception {
		
		boolean deleteSuccess = false;
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		int deleteCount = memberDAO.deleteMember(id);

		if (deleteCount > 0) {
			commit(con);
			deleteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return deleteSuccess;
	}
}
