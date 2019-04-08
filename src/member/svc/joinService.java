package member.svc;

import java.sql.*;
import javax.sql.*;
import static db.jdbcUtil1.*;

import member.dao.MemberDAO;
import member.vo.MemberBean;

public class joinService {

	public boolean joinMember(MemberBean member) {
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		boolean joinMember = memberDAO.joinMember(member);
		
		if(joinMember == true) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return joinMember;
	}
}
