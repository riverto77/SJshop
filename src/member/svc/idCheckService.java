package member.svc;

import static db.jdbcUtil1.*;
import java.sql.Connection;

import member.dao.MemberDAO;

public class idCheckService {

	public boolean idCheck(String id) throws Exception {

		boolean idcheck = false;
		Connection con = getConnection();
		MemberDAO member = MemberDAO.getInstance();
		member.setConnection(con);
		
		idcheck = member.idCheck(id);
		
		if(idcheck == true) {
			commit(con);
		} else {
			close(con);
		}
		
		return idcheck;
	}
}
