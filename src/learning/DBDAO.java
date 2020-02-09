package learning;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class DBDAO
 */
@WebServlet("/DBDAO)")
public class DBDAO extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	public Connection con;
	public PreparedStatement stmt;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBDAO() {
        open();
        // TODO Auto-generated constructor stub
    }

    public void open(){
		//if(con==null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/s3a1", "s3a1", "12345");
			} catch (ClassNotFoundException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		//}

	}
	public void close(){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
		}
	}
}


