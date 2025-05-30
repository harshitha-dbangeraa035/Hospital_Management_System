// src/com/servlet/ReportServlet.java
package com.servlet;

import com.dao.HospitalDAO;
import com.model.Patient;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HospitalDAO hospitalDAO;

    public void init() {
        hospitalDAO = new HospitalDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        List<Patient> patients = null;
        String message = null;

        try {
            if ("dateRange".equals(reportType)) {
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");

                if (startDateStr != null && !startDateStr.isEmpty() && endDateStr != null && !endDateStr.isEmpty()) {
                    Date startDate = Date.valueOf(startDateStr);
                    Date endDate = Date.valueOf(endDateStr);
                    patients = hospitalDAO.getPatientsAdmittedInDateRange(startDate, endDate);
                    if (patients.isEmpty()) {
                        message = "No patients found for the specified date range.";
                    }
                    request.setAttribute("reportTitle", "Patients Admitted Between " + startDate + " and " + endDate);
                } else {
                    message = "Please provide both start and end dates for the date range report.";
                }
            } else if ("ailment".equals(reportType)) {
                String ailment = request.getParameter("ailment");
                if (ailment != null && !ailment.isEmpty()) {
                    patients = hospitalDAO.getPatientsWithSpecificAilment(ailment);
                    if (patients.isEmpty()) {
                        message = "No patients found with the ailment: " + ailment;
                    }
                    request.setAttribute("reportTitle", "Patients with Ailment: " + ailment);
                } else {
                    message = "Please provide an ailment for the report.";
                }
            } else if ("doctor".equals(reportType)) {
                String doctorName = request.getParameter("doctorName");
                if (doctorName != null && !doctorName.isEmpty()) {
                    patients = hospitalDAO.getPatientsAssignedToSpecificDoctor(doctorName);
                    if (patients.isEmpty()) {
                        message = "No patients found assigned to doctor: " + doctorName;
                    }
                    request.setAttribute("reportTitle", "Patients Assigned to Doctor: " + doctorName);
                } else {
                    message = "Please provide a doctor's name for the report.";
                }
            } else {
                message = "Invalid report type selected.";
            }
        } catch (IllegalArgumentException e) { // For Date.valueOf
            message = "Error: Invalid date format. Please use YYYY-MM-DD.";
            e.printStackTrace();
        } catch (SQLException e) {
            message = "Database error: " + e.getMessage();
            e.printStackTrace();
        }

        request.setAttribute("patients", patients);
        request.setAttribute("message", message);
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}