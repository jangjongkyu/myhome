package my.student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import my.db.ConnectionPoolBean;

//dao : dataaccess object
public class StudentDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	//private String url, user, pass;
	private ConnectionPoolBean pool;

	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public StudentDAO() {
/*		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			user = "web01";
			pass = "web01";
			con = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("드라이버 생성 실패 !!");
		}*/
	}

	public int insertStudent(String id, String name, String cname) throws SQLException {
		String sql = "insert into student values(?,?,?)";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, cname);
			int res = ps.executeUpdate();
			return res;
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				pool.returnConnection(con);
		}

	}

	public int deleteStudent(String id) throws SQLException {
		String sql = "delete from student where id=?";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			int res = ps.executeUpdate();
			return res;
		} finally {
			if (ps != null)
				ps.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}

	public List<StudentDTO> getStudentList() throws SQLException {
		String sql = "select * from student";
		try {
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			return makeList(rs);
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (con != null)
				pool.returnConnection(con);
		}
	}

	public List<StudentDTO> findStudent(String name) throws SQLException {
		String sql = "select * from student where name like '%"+name+"%'";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			return makeList(rs);
		}finally{
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) pool.returnConnection(con);
		}
	}

	public List<StudentDTO> makeList(ResultSet rs) throws SQLException {
		List<StudentDTO> list = new ArrayList<StudentDTO>();
		while (rs.next()) {
			StudentDTO dto = new StudentDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setCname(rs.getString("cname"));
			list.add(dto);
		}
		return list;
	}

}
