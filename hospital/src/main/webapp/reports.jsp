<%-- WebContent/reports.jsp --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Reports</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
        color: #333;
    }
    .container {
        max-width: 700px;
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
    fieldset {
        border: 1px solid #ccc;
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 5px;
    }
    legend {
        font-weight: bold;
        color: #007bff;
        padding: 0 5px;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input[type="radio"] {
        margin-right: 5px;
    }
    input[type="text"],
    input[type="date"] {
        width: calc(100% - 22px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 10px;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
        display: block;
        width: 100%;
        margin-top: 20px;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .report-options div {
        margin-bottom: 15px;
        padding: 10px;
        border: 1px dashed #ddd;
        border-radius: 5px;
    }
    .report-options div label {
        margin-bottom: 10px;
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
<script>
    function toggleReportFields() {
        var reportTypeRadios = document.getElementsByName('reportType');
        var selectedValue;
        for (var i = 0; i < reportTypeRadios.length; i++) {
            if (reportTypeRadios[i].checked) {
                selectedValue = reportTypeRadios[i].value;
                break;
            }
        }

        document.getElementById('dateRangeFields').style.display = 'none';
        document.getElementById('ailmentFields').style.display = 'none';
        document.getElementById('doctorFields').style.display = 'none';

        if (selectedValue === 'dateRange') {
            document.getElementById('dateRangeFields').style.display = 'block';
        } else if (selectedValue === 'ailment') {
            document.getElementById('ailmentFields').style.display = 'block';
        } else if (selectedValue === 'doctor') {
            document.getElementById('doctorFields').style.display = 'block';
        }
    }

    // Call on page load to set initial state
    window.onload = toggleReportFields;
</script>
</head>
<body>
    <div class="container">
        <h1>Generate Hospital Reports</h1>

        <form action="ReportServlet" method="post">
            <fieldset>
                <legend>Select Report Type:</legend>
                <div class="report-options">
                    <input type="radio" id="reportTypeDate" name="reportType" value="dateRange" checked onchange="toggleReportFields()">
                    <label for="reportTypeDate">Patients admitted in a date range</label><br>
                    <div id="dateRangeFields">
                        <label for="startDate">Start Date:</label>
                        <input type="date" id="startDate" name="startDate">
                        <label for="endDate">End Date:</label>
                        <input type="date" id="endDate" name="endDate">
                    </div>
                </div>

                <div class="report-options">
                    <input type="radio" id="reportTypeAilment" name="reportType" value="ailment" onchange="toggleReportFields()">
                    <label for="reportTypeAilment">Patients with a specific ailment</label><br>
                    <div id="ailmentFields" style="display: none;">
                        <label for="ailment">Ailment:</label>
                        <input type="text" id="ailment" name="ailment" placeholder="e.g., Fever, Diabetes">
                    </div>
                </div>

                <div class="report-options">
                    <input type="radio" id="reportTypeDoctor" name="reportType" value="doctor" onchange="toggleReportFields()">
                    <label for="reportTypeDoctor">Patients assigned to a specific doctor</label><br>
                    <div id="doctorFields" style="display: none;">
                        <label for="doctorName">Doctor Name:</label>
                        <input type="text" id="doctorName" name="doctorName" placeholder="e.g., Dr. Smith">
                    </div>
                </div>
            </fieldset>

            <input type="submit" value="Generate Report">
        </form>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>