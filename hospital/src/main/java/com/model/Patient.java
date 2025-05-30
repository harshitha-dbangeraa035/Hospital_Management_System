// src/com/model/Patient.java
package com.model;

import java.sql.Date; // Use java.sql.Date for database DATE types

public class Patient {
    private int patientId;
    private String patientName;
    private int age;
    private String gender;
    private Date admissionDate;
    private String ailment;
    private String assignedDoctor;

    // Constructors
    public Patient() {
    }

    public Patient(int patientId, String patientName, int age, String gender, Date admissionDate, String ailment, String assignedDoctor) {
        this.patientId = patientId;
        this.patientName = patientName;
        this.age = age;
        this.gender = gender;
        this.admissionDate = admissionDate;
        this.ailment = ailment;
        this.assignedDoctor = assignedDoctor;
    }

    // Getters and Setters
    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getAdmissionDate() {
        return admissionDate;
    }

    public void setAdmissionDate(Date admissionDate) {
        this.admissionDate = admissionDate;
    }

    public String getAilment() {
        return ailment;
    }

    public void setAilment(String ailment) {
        this.ailment = ailment;
    }

    public String getAssignedDoctor() {
        return assignedDoctor;
    }

    public void setAssignedDoctor(String assignedDoctor) {
        this.assignedDoctor = assignedDoctor;
    }

    @Override
    public String toString() {
        return "Patient{" +
               "patientId=" + patientId +
               ", patientName='" + patientName + '\'' +
               ", age=" + age +
               ", gender='" + gender + '\'' +
               ", admissionDate=" + admissionDate +
               ", ailment='" + ailment + '\'' +
               ", assignedDoctor='" + assignedDoctor + '\'' +
               '}';
    }
}