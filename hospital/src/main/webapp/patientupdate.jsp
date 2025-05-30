<%-- WebContent/patientupdate.jsp --%>
<%@ page import="com.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Patient Record</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
        color: #333;
    }
    .container {
        max-width: 600px;
        margin: 30px auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    h1 {
        color: #0056b3;
        text-align: center;
    }
    form {
        display: grid;
        gap: 15px;
    }
    label {
        font-weight: bold;
    }
    input[type="text"],
    input[type="number"],
    input[type="date"],
    select {
        width: calc(100% - 22px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #ffc107;
        color: #333;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #e0a800;
    }
    .message {
        margin-top: 15px;
        padding: 10px;
        border-radius: 5px;
        text-align: center;
    }
    .success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    .error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    .fetch-form {
        display: flex;
        margin-bottom: 20px;
        gap: 10px;
    }
    .fetch-form input[type="number"] {
        flex-grow: 1;
    }
    .fetch-form input[type="submit"] {
        background-color: #007bff;
        color: white;
        padding: 8px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .fetch-form input[type="submit"]:hover {
        background-color: #0056b3;
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
        <h1>Update Patient Record</h1>

        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
            <p class="message <%= message.contains("successfully") ? "success" : "error" %>">
                <%= message %>
            </p>
        <%
            }
        %>

        <p>First, enter the Patient ID to fetch their details:</p>
        <form action="UpdatePatientServlet" method="get" class="fetch-form">
            <input type="number" name="patientId" placeholder="Enter Patient ID to update" required>
            <input type="submit" value="Fetch Patient">
        </form>

        <%
            Patient patient = (Patient) request.getAttribute("patient");
            if (patient != null) {
        %>
            <h2>Patient Details:</h2>
            <form action="UpdatePatientServlet" method="post">
                <label for="patientId">Patient ID:</label>
                <input type="number" id="patientId" name="patientId" value="<%= patient.getPatientId() %>" readonly>

                <label for="patientName">Patient Name:</label>
                <input type="text" id="patientName" name="patientName" value="<%= patient.getPatientName() %>" required>

                <label for="age">Age:</label>
                <input type="number" id="age" name="age" value="<%= patient.getAge() %>" required min="0" max="120">

                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required>
                    <option value="Male" <%= "Male".equals(patient.getGender()) ? "selected" : "" %>>Male</option>
                    <option value="Female" <%= "Female".equals(patient.getGender()) ? "selected" : "" %>>Female</option>
                    <option value="Other" <%= "Other".equals(patient.getGender()) ? "selected" : "" %>>Other</option>
                </select>

                <label for="admissionDate">Admission Date:</label>
                <input type="date" id="admissionDate" name="admissionDate" value="<%= patient.getAdmissionDate() %>" required>

                <label for="ailment">Ailment:</label>
                <input type="text" id="ailment" name="ailment" value="<%= patient.getAilment() %>" required>

                <label for="assignedDoctor">Assigned Doctor:</label>
                <input type="text" id="assignedDoctor" name="assignedDoctor" value="<%= patient.getAssignedDoctor() %>" required>

                <input type="submit" value="Update Patient">
            </form>
        <%
            }
        %>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>