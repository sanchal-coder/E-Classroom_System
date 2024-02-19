package oes.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import oes.db.studyMatrl;

public class studyMtrlDao {
    private Connection connection;

    // Constructor
    public studyMtrlDao(Connection connection) {
        this.connection = connection;
    }

    // Insert a study material
    public boolean insertStudyMaterial(studyMatrl studyMaterial) throws SQLException {
        String query = "INSERT INTO study_materials (source, description, date) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, studyMaterial.getSource());
            statement.setString(2, studyMaterial.getDescription());
            statement.setTimestamp(3, Timestamp.valueOf(studyMaterial.getDate()));
            statement.executeUpdate();
        }
		return true;
    }

    // Update a study material
    public boolean updateStudyMaterial(studyMatrl studyMaterial) throws SQLException {
        String query = "UPDATE study_materials SET source = ?, description = ?, date = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, studyMaterial.getSource());
            statement.setString(2, studyMaterial.getDescription());
            statement.setTimestamp(3, Timestamp.valueOf(studyMaterial.getDate()));
            statement.setInt(4, studyMaterial.getId());
            statement.executeUpdate();
        }
		return true;
    }

    // Delete a study material
    public boolean deleteStudyMaterial(int id) throws SQLException {
        String query = "DELETE FROM study_materials WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
		return true;
    }

    // Get all study materials
    public List<studyMatrl> getAllStudyMaterials() throws SQLException {
        List<studyMatrl> studyMaterials = new ArrayList<>();
        String query = "SELECT * FROM study_materials";
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            while (resultSet.next()) {
                studyMatrl studyMaterial = new studyMatrl();
                studyMaterial.setId(resultSet.getInt("id"));
                studyMaterial.setSource(resultSet.getString("source"));
                studyMaterial.setDescription(resultSet.getString("description"));
                studyMaterial.setDate(resultSet.getTimestamp("date").toLocalDateTime());
                studyMaterials.add(studyMaterial);
            }
        }
        return studyMaterials;
    }
}

