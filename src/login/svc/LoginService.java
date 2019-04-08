package login.svc;

import static db.jdbcUtil1.*;

import java.sql.*;

import login.dao.LogDAO;
import member.vo.MemberBean;

public class LoginService {

	public boolean PassCheck(String id, String pw) throws Exception {
		
		boolean PassCheck = false;
		//LogBean Article = null;
		Connection con = getConnection();
		LogDAO logDAO = LogDAO.getInstance();
		logDAO.setConnection(con);
		PassCheck = logDAO.Login(id, pw);
		
		if(PassCheck == true) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return PassCheck;
	}
}
