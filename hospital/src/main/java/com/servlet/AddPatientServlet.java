// src/com/servlet/AddPatientServlet.java
package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddPatientServlet")
public class AddPatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientIdStr = request.getParameter("patientId");
        String patientName = request.getParameter("patientName");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String admissionDateStr = request.getParameter("admissionDate");
        String ailment = request.getParameter("ailment");
        String assignedDoctor = request.getParameter("assignedDoctor");

        String message;
        try {
            int patientId = Integer.parseInt(patientIdStr);
            int age = Integer.parseInt(ageStr);
            Date admissionDate = Date.valueOf(admissionDateStr);

            Patient patient = new Patient(patientId, patientName, age, gender, admissionDate, ailment, assignedDoctor);

            if (hospitalDAO.addPatient(patient)) {
                message = "Patient added successfully!";
            } else {
                message = "Failed to add patient. Patient ID might already exist.";
            }
        } catch (NumberFormatException e) {
            message = "Error: Invalid number format for Patient ID or Age.";
            e.printStackTrace();
        } catch (IllegalArgumentException e) { // For Date.valueOf
            message = "Error: Invalid date format. Please use YYYY-MM-DD.";
            e.printStackTrace();
        } catch (SQLException e) {
            message = "Database error: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("patientadd.jsp").forward(request, response);
    }
}