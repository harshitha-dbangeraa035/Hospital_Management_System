// src/com/dao/HospitalDAO.java
package com.dao;

import com.model.Patient;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class HospitalDAO {

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/hosp_db"; // Replace with your DB name
    private static final String JDBC_USERNAME = "root"; // Replace with your DB username
    private static final String JDBC_PASSWORD = ""; // Replace with your DB password

    public HospitalDAO() {
        // Load the JDBC driver
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // For MySQL 8.0+
            // For older MySQL versions, it might be: Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to load JDBC driver: " + e.getMessage());
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    // --- Patient CRUD Operations ---

    public boolean addPatient(Patient patient) throws SQLException {
        String SQL = "INSERT INTO Patients (PatientID, PatientName, Age, Gender, AdmissionDate, Ailment, AssignedDoctor) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, patient.getPatientId());
            pstmt.setString(2, patient.getPatientName());
            pstmt.setInt(3, patient.getAge());
            pstmt.setString(4, patient.getGender());
            pstmt.setDate(5, patient.getAdmissionDate());
            pstmt.setString(6, patient.getAilment());
            pstmt.setString(7, patient.getAssignedDoctor());
            return pstmt.executeUpdate() > 0;
        }
    }

    public Patient getPatientById(int patientId) throws SQLException {
        String SQL = "SELECT * FROM Patients WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, patientId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return extractPatientFromResultSet(rs);
                }
            }
        }
        return null;
    }

    public boolean updatePatient(Patient patient) throws SQLException {
        String SQL = "UPDATE Patients SET PatientName = ?, Age = ?, Gender = ?, AdmissionDate = ?, Ailment = ?, AssignedDoctor = ? WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, patient.getPatientName());
            pstmt.setInt(2, patient.getAge());
            pstmt.setString(3, patient.getGender());
            pstmt.setDate(4, patient.getAdmissionDate());
            pstmt.setString(5, patient.getAilment());
            pstmt.setString(6, patient.getAssignedDoctor());
            pstmt.setInt(7, patient.getPatientId());
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deletePatient(int patientId) throws SQLException {
        String SQL = "DELETE FROM Patients WHERE PatientID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, patientId);
            return pstmt.executeUpdate() > 0;
        }
    }

    public List<Patient> getAllPatients() throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String SQL = "SELECT * FROM Patients ORDER BY PatientID";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                patients.add(extractPatientFromResultSet(rs));
            }
        }
        return patients;
    }

    // --- Report Queries ---

    public List<Patient> getPatientsAdmittedInDateRange(Date startDate, Date endDate) throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String SQL = "SELECT * FROM Patients WHERE AdmissionDate BETWEEN ? AND ? ORDER BY AdmissionDate";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setDate(1, startDate);
            pstmt.setDate(2, endDate);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    patients.add(extractPatientFromResultSet(rs));
                }
            }
        }
        return patients;
    }

    public List<Patient> getPatientsWithSpecificAilment(String ailment) throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String SQL = "SELECT * FROM Patients WHERE Ailment LIKE ? ORDER BY PatientName";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, "%" + ailment + "%"); // Use LIKE for partial matches
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    patients.add(extractPatientFromResultSet(rs));
                }
            }
        }
        return patients;
    }

    public List<Patient> getPatientsAssignedToSpecificDoctor(String doctorName) throws SQLException {
        List<Patient> patients = new ArrayList<>();
        String SQL = "SELECT * FROM Patients WHERE AssignedDoctor LIKE ? ORDER BY PatientName";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, "%" + doctorName + "%"); // Use LIKE for partial matches
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    patients.add(extractPatientFromResultSet(rs));
                }
            }
        }
        return patients;
    }

    private Patient extractPatientFromResultSet(ResultSet rs) throws SQLException {
        Patient patient = new Patient();
        patient.setPatientId(rs.getInt("PatientID"));
        patient.setPatientName(rs.getString("PatientName"));
        patient.setAge(rs.getInt("Age"));
        patient.setGender(rs.getString("Gender"));
        patient.setAdmissionDate(rs.getDate("AdmissionDate"));
        patient.setAilment(rs.getString("Ailment"));
        patient.setAssignedDoctor(rs.getString("AssignedDoctor"));
        return patient;
    }
}