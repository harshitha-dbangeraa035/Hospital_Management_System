// src/com/servlet/DisplayPatientsServlet.java
package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayPatientsServlet")
public class DisplayPatientsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Patient> patients = null;
        String message = null;
        try {
            patients = hospitalDAO.getAllPatients();
            if (patients.isEmpty()) {
                message = "No patients found in the database.";
            }
        } catch (SQLException e) {
            message = "Database error: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("patients", patients);
        request.setAttribute("message", message);
        request.getRequestDispatcher("patientdisplay.jsp").forward(request, response);
    }
}