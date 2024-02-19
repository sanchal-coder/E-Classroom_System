package oes.db;

import java.time.LocalDateTime;

public class Notice {
    private int noticeId;
    private String content;
    private LocalDateTime createdAt;
    
    

    public Notice() {
		super();
	}

	public Notice(int noticeId, String content, LocalDateTime createdAt) {
        this.noticeId = noticeId;
        this.content = content;
        this.createdAt = createdAt;
    }

    public int getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(int noticeId) {
        this.noticeId = noticeId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
