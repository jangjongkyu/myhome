package my.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import my.db.ConnectionPoolBean;

public class LoginBean {
	private int no;
	private String name;
	private String id;
	private String passwd;
	private String ssn1;
	private String ssn2;
	private String email;
	private String hp1;
	private String hp2;
	private String hp3;
	private String joindate;
	
	private ConnectionPoolBean pool;
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public String getName() {
		return name;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getSsn1() {
		return ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public String getEmail() {
		return email;
	}
	public String getHp1() {
		return hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	
	public boolean isMemberSetting(){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from jsp_member where id = ?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				no = rs.getInt("no");
				name = rs.getString("name");
				passwd = rs.getString("password");
				ssn1 = rs.getString("ssn1");
				ssn2 = rs.getString("ssn2");
				email = rs.getString("email");
				hp1 = rs.getString("hp1");
				hp2 = rs.getString("hp2");
				hp3 = rs.getString("hp3");
				joindate = rs.getString("joindate");
				return true;
			}
			return false;
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
			if(rs != null)rs.close();
			if(ps != null)ps.close();
			if(con != null)pool.returnConnection(con);
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
}
