package oes.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import oes.db.Notice;
import oes.db.Provider;
import oes.db.Students;
import oes.db.attendance;

public class attendanceDao {
    private static Connection con;
    
    // Constructor
    public attendanceDao(Connection con) {
		super();
		this.con=con;
		// TODO Auto-generated constructor stub
	}
 
    // Delete a record by student ID and date
    public boolean deleteAttendance(int AttendanceId) {
        try {
            PreparedStatement statement = con.prepareStatement(
                    "DELETE FROM attendance WHERE attendance_id = ?");
            statement.setInt(1, AttendanceId);
            int rowsDeleted = statement.executeUpdate();
            return (rowsDeleted > 0);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean insertAttendance(attendance at) {
		// TODO Auto-generated method stub
		boolean status = false;
		try
		{
		
		Connection con = Provider.getConnection();
		String sql = "insert into attendance(student_id,date,lecture,status) values(?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1, at.getStudentId());
		pst.setTimestamp(2, java.sql.Timestamp.valueOf(at.getDate()));
		pst.setString(3, at.getLecture());
		pst.setString(4, at.getStatus());
		int val = pst.executeUpdate();
		if(val > 0)
		{
			status = true;
		}
		else
		{
			status = false;
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	// Update a record by student ID and date
    public boolean updateAttendance(attendance a) {
     boolean stats =false;
     if(a.getLecture()!="")
     {
    	try {
            PreparedStatement statement = con.prepareStatement(
                    "UPDATE attendance SET lecture = ?,status= ? WHERE attendance_id= ?");
            statement.setString(1, a.getLecture());
            statement.setString(2, a.getStatus());
            statement.setInt(3, a.getAttendanceId());
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
            	stats=true;
            } 
            else {
				stats=false;
			}
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    	}
		return stats;
    }
    
    // View all records
    public  List<attendance> viewAttendance() {
    	  List<attendance> attendanceList = new ArrayList<attendance>();
        try {
            PreparedStatement statement = con.prepareStatement("SELECT * FROM attendance");
            ResultSet resultSet = statement.executeQuery();
          
            while (resultSet.next()) {
                       int aid=resultSet.getInt("attendance_id"); 
                       int sid=resultSet.getInt("student_id"); 
                       LocalDateTime sdt=resultSet.getTimestamp("date").toLocalDateTime(); 
                       String lec=resultSet.getString("lecture"); 
                       String sts=resultSet.getString("status");
                       
                      attendance a = new attendance (aid,sid,sdt,lec,sts);
                       
                attendanceList.add(a);
            }
            return attendanceList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
   
    
    
    
    
}




