package login.dao;

import static db.jdbcUtil1.close;

import java.sql.*;

import javax.sql.*;

import member.vo.MemberBean;

public class LogDAO {
	
	DataSource ds;
	Connection con;
	
	private static LogDAO LogDAO;
	
	public static LogDAO getInstance() {
		if (LogDAO == null) {
			LogDAO = new LogDAO();
		}
		return LogDAO;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public boolean Login(String id, String pw) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean PassCheck = false;
		
		try {
			pstmt = con.prepareStatement("select * from member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					PassCheck = true;
				} else {
					PassCheck = false;
				}
			}
			
		} catch (SQLException ex) {
			System.out.println("Check 에러 : " + ex);
		} finally {
			close(pstmt);
		}
		return PassCheck;
	}
}
