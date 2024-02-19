package oes.db;

import java.time.LocalDateTime;

public class studyMatrl {
    private int id;
    private String source;
    private String description;
    private LocalDateTime date;

    // Constructors
    public studyMatrl() {
    }

    public studyMatrl(String source, String description, LocalDateTime date) {
        this.source = source;
        this.description = description;
        this.date = date;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}
