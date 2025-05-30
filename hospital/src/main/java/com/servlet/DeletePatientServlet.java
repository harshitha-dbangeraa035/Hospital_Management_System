// src/com/servlet/DeletePatientServlet.java
package com.servlet;

import com.dao.HospitalDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String patientIdStr = request.getParameter("patientId");

        String message;
        try {
            int patientId = Integer.parseInt(patientIdStr);

            if (hospitalDAO.deletePatient(patientId)) {
                message = "Patient with ID " + patientId + " deleted successfully!";
            } else {
                message = "Failed to delete patient. Patient ID not found.";
            }
        } catch (NumberFormatException e) {
            message = "Error: Invalid Patient ID format.";
            e.printStackTrace();
        } catch (SQLException e) {
            message = "Database error: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("patientdelete.jsp").forward(request, response);
    }
}