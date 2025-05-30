<%-- WebContent/report_result.jsp --%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Results</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
        color: #333;
    }
    .container {
        max-width: 1000px;
        margin: 30px auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    h1 {
        color: #0056b3;
        text-align: center;
        margin-bottom: 20px;
    }
    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .message {
        margin-top: 15px;
        padding: 10px;
        border-radius: 5px;
        text-align: center;
    }
    .info {
        background-color: #e2e3e5;
        color: #383d41;
        border: 1px solid #d6d8db;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Report Results</h1>
        <%
            // Retrieve the report title from the request scope
            String reportTitle = (String) request.getAttribute("reportTitle");
            if (reportTitle != null) {
        %>
                <h2><%= reportTitle %></h2>
        <%
            }
        %>

        <%
            // Retrieve the message from the request scope
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
                String messageClass = "";
                if (message.contains("No patients")) {
                    messageClass = "info";
                } else {
                    messageClass = "error";
                }
        %>
            <p class="message <%= messageClass %>">
                <%= message %>
            </p>
        <%
            }
        %>

        <%
            // Retrieve the list of patients from the request scope
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");

            if (patients != null && !patients.isEmpty()) {
        %>
                <table>
                    <thead>
                        <tr>
                            <th>Patient ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Gender</th>
                            <th>Admission Date</th>
                            <th>Ailment</th>
                            <th>Assigned Doctor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            // Loop through the list of patients and display each one
                            for (Patient patient : patients) {
                        %>
                                <tr>
                                    <td><%= patient.getPatientId() %></td>
                                    <td><%= patient.getPatientName() %></td>
                                    <td><%= patient.getAge() %></td>
                                    <td><%= patient.getGender() %></td>
                                    <td><%= patient.getAdmissionDate() %></td>
                                    <td><%= patient.getAilment() %></td>
                                    <td><%= patient.getAssignedDoctor() %></td>
                                </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
        <%
            } else {
                // Display a message if no patients are found and no specific error message was set
                if (message == null || message.isEmpty() || message.contains("No patients")) {
        %>
                    <p class="no-records">No results found for this report criteria.</p>
        <%
                }
            }
        %>
        <a href="ReportCriteriaServlet">Back to Reports</a>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>