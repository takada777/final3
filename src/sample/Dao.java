package sample;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.DAOBase;
import exception.DatabaseException;
import exception.SystemException;
import parameter.ExceptionParameters;

public class Dao extends DAOBase {
	private PreparedStatement prestmt = null;

	public String roomname(int id)
			throws DatabaseException, SystemException {
		ResultSet rs = null;
		this.open();
		try {

			String sql = "select * from room where room_id = ?";

			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1, id);
			rs = prestmt.executeQuery();

			if (rs.next()) {
				return rs.getString("room_name");
			} else {
				return "null";
			}
		} catch (SQLException e) {
			throw new DatabaseException(
					ExceptionParameters.DATABASE_CONNECTION_EXCEPTION_MESSAGE,
					e);
		} finally {
			this.close(prestmt);
		}

	}
}