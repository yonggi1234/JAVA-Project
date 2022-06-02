package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class wtDAO {

	private Connection conn;
	private ResultSet rs;
	
	//기본 생성자
	public wtDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/board";
			String dbID = "root";
			String dbPassword = "1111";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	//작성일자 메소드
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "-1"; //데이터베이스 오류
	}
	
	//게시글 번호 부여 메소드
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select write_num from wt order by write_num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//글쓰기 메소드
	public int write(String write_title, String write_id, String write_content, String write_img, String img_data, String write_select) {
		String sql = "insert into wt values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			System.out.println(img_data);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, write_id);
			pstmt.setString(2, write_title);
			pstmt.setString(3, write_content);
			pstmt.setString(4, write_img);
			pstmt.setString(5, img_data);
			pstmt.setString(6, write_select);
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 0);
			pstmt.setInt(9, getNext());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ResultSet getWt() {
		String sql = "select * from wt";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rs.previous();
				return rs;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//return (ResultSet); //데이터베이스 오류 어떻게해야하지
		return rs;
	}
	
	public ResultSet getSearchWt(String search) {
		String sql = "select * from wt where write_title like ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rs.previous();
				return rs;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//return (ResultSet); //데이터베이스 오류 어떻게해야하지
		return rs;
	}
	
	public ResultSet getOneWt(String num) {
		System.out.println(num);
		String sql = "select * from wt where write_num=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			System.out.println(rs.getString(1));
			if(rs.getString(1)!=null) {
				System.out.println("yess");
				return rs;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		//return (ResultSet); //데이터베이스 오류 어떻게해야하지
		return rs;
	}
}