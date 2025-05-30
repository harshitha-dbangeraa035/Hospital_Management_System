<%-- WebContent/patientdisplay.jsp --%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Patient" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View All Patients</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #e9ecef;
        color: #333;
    }
    .container {
        max-width: 1100px;
        margin: 30px auto;
        background-color: white;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    h1 {
        color: #007bff;
        text-align: center;
        margin-bottom: 30px;
        font-size: 2.5em;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.05);
    }
    .message {
        margin-bottom: 20px;
        padding: 15px;
        border-radius: 8px;
        text-align: center;
        font-weight: bold;
        font-size: 1.1em;
    }
    .info {
        background-color: #e0f7fa; /* Light cyan */
        color: #00796b; /* Dark teal */
        border: 1px solid #b2ebf2;
    }
    .error {
        background-color: #ffe0b2; /* Light orange */
        color: #e65100; /* Dark orange */
        border: 1px solid #ffcc80;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    th, td {
        border: 1px solid #dee2e6; /* Light grey border */
        padding: 12px 15px;
        text-align: left;
    }
    th {
        background-color: #007bff; /* Blue header */
        color: white;
        font-weight: 600;
        position: sticky;
        top: 0; /* Keeps header visible on scroll */
        z-index: 1;
    }
    tr:nth-child(even) {
        background-color: #f8f9fa; /* Lighter row for even rows */
    }
    tr:hover {
        background-color: #e2f0ff; /* Light blue on hover */
        transition: background-color 0.2s ease;
    }
    td:first-child {
        font-weight: bold; /* Make PatientID stand out */
    }
    .no-records {
        text-align: center;
        padding: 30px;
        font-size: 1.2em;
        color: #6c757d;
        background-color: #f0f0f0;
        border-radius: 8px;
        margin-top: 20px;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 30px;
        padding: 10px 20px;
        background-color: #6c757d; /* Grey button */
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1.1em;
        transition: background-color 0.3s ease;
        width: fit-content;
        margin-left: auto;
        margin-right: auto;
    }
    .back-link:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>All Patient Records</h1>

        <%
            // Retrieve the message from the request scope
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
                String messageClass = "";
                if (message.contains("No patient")) {
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
                if (message == null || message.isEmpty() || message.contains("No patient")) {
        %>
                    <p class="no-records">No patient records available.</p>
        <%
                }
            }
        %>
        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</body>
</html>