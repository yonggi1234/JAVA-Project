package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection con; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet res; //결과값 받아오기
	
	/*생성자 - DB 연결*/
	public UserDAO() {
		try {
			String dbURL="jdbc:mariadb://localhost:3306/board";
			String dbID="root";
			String dbPassword="1111";
			Class.forName("org.mariadb.jdbc.Driver");
			con=DriverManager.getConnection(dbURL, dbID, dbPassword);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	/*로그인*/
	public int login(String id, String pw) {
		String sql="select password from user where id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			res=pstmt.executeQuery();
			if(res.next()) {
				if(res.getString(1).equals(pw)) {
					return 1;	//로그인 성공
				}
				else {
					return 0;	//pw 틀림
				}
				
			}
			return -1;	//id 없음
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2;	//오류
	}
	/*회원가입*/
	public int join(userDATA user) {
		  String sql = "insert into user values(?, ?, ?, ?, ?, ?,?)";
		  try {
		    pstmt = con.prepareStatement(sql);
		    pstmt.setString(1, user.getId());
		    pstmt.setString(2, user.getPassword());
		    pstmt.setString(3, user.getPhoneNumber());
		    pstmt.setString(4, user.getAddress());
		    pstmt.setString(5, user.getName());
		    pstmt.setString(6, "None");
		    pstmt.setString(7, "");
		    return pstmt.executeUpdate();
		  }catch (Exception e) {
		 	e.printStackTrace();
		  }
		  return -1;
	}

/*회원 탈퇴*/
public int withdrawl(String id) {
  String sql = ""
  		+ "delete from user where id =?";
  try {
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
	res=pstmt.executeQuery();
    return pstmt.executeUpdate();
  }catch (Exception e) {
 	e.printStackTrace();
  }
  return -1;
}

/*카테고리 추가*/
public int category(String id,String category) {
  String sql = ""
  		+ "UPDATE user SET category=? WHERE id=?;";
  try {
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, category);
    pstmt.setString(2, id);
    
	res=pstmt.executeQuery();
    return pstmt.executeUpdate();
  }catch (Exception e) {
 	e.printStackTrace();
  }
  return -1;
}


public ResultSet getAddress(String id) {
	String sql = "select * from user where id=?";
	try {
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		res=pstmt.executeQuery();
		return res;
	}catch (Exception e) {
		e.printStackTrace();
	}
	return res;
}

public int block(String id, String block){
	  String sql ="UPDATE user SET block=? WHERE id=?";
	  try {
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, block);
	    pstmt.setString(2, id);
	    return pstmt.executeUpdate();
	  }catch (Exception e) {
	 	e.printStackTrace();
	  }
	  return -1;
	}
}