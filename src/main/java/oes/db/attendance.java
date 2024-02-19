package oes.db;

import java.sql.Date;
import java.time.LocalDateTime;

public class attendance {
    private int attendanceId;
    private int studentId;
    private LocalDateTime date;
    private String lecture;
    private String status;

    public int getAttendanceId() {
        return attendanceId;
    }

    public attendance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public attendance(int attendanceId, int studentId, LocalDateTime date, String lecture, String status) {
		super();
		this.attendanceId = attendanceId;
		this.studentId = studentId;
		this.date = date;
		this.lecture = lecture;
		this.status = status;
	}

	public void setAttendanceId(int attendanceId) {
        this.attendanceId = attendanceId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getLecture() {
        return lecture;
    }

    public void setLecture(String lecture) {
        this.lecture = lecture;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
