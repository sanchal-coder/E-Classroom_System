package oes.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.env.IBinaryNestedType;

import oes.db.Notice;

public class NoticeDao {
    private Connection connection;
    public NoticeDao(Connection connection) {
        this.connection = connection;
    }

    public List<Notice> getAllNotices() throws SQLException {
        List<Notice> notices = new ArrayList<>();

        String query = "SELECT * FROM notices";

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int noticeId = resultSet.getInt("notice_id");
                String content = resultSet.getString("content");
                LocalDateTime createdAt = resultSet.getTimestamp("created_at").toLocalDateTime();

                Notice notice = new Notice(noticeId, content, createdAt);
                notices.add(notice);
            }
        }

        return notices;
    }

    public boolean addNotice(Notice notice) throws SQLException {
        String query = "INSERT INTO notices ( content, created_at) VALUES (?, ?)";

        boolean stsus=false;
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, notice.getContent());
            statement.setTimestamp(2, java.sql.Timestamp.valueOf(notice.getCreatedAt()));

           int val= statement.executeUpdate();
           
           if(val>0)
           {
        	   stsus =true;
           }
           else {
        	   stsus= false;
        	   
           }
        }
		return stsus;
       
    }

    public boolean updateNotice(String newntc, LocalDateTime ldt,int ntcid) throws SQLException {
        String query = "UPDATE notices SET content = ?, created_at = ? WHERE notice_id = ?";
        boolean status= false;
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, newntc);
            statement.setTimestamp(2, java.sql.Timestamp.valueOf(ldt));
            statement.setInt(3, ntcid);

         int val=  statement.executeUpdate();
            
            if(val>0)
            {
          	  
          	  status=true;
            }else {
  			status=false;
  		}
            
            
            
        }
		return status;
    }

    public  boolean deleteNotice(int noticeId) throws SQLException {
        String query = "DELETE FROM notices WHERE notice_id = ?";
       boolean status= false;
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, noticeId);

         int val = statement.executeUpdate();
          if(val>0)
          {
        	  
        	  status=true;
          }else {
			status=false;
		}
         
         
        }
		return status;
    }
}
