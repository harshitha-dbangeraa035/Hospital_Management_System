<%-- WebContent/patientdelete.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Patient Record</title>
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
        text-align: center;
    }
    h1 {
        color: #dc3545;
        text-align: center;
    }
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
    }
    label {
        font-weight: bold;
    }
    input[type="number"] {
        width: 50%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        text-align: center;
    }
    input[type="submit"] {
        background-color: #dc3545;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #c82333;
    }
    .message {
        margin-top: 15px;
        padding: 10px;
        border-radius: 5px;
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
        <h1>Delete Patient Record</h1>

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

        <form action="DeletePatientServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this patient record?');">
            <label for="patientId">Enter Patient ID to Delete:</label>
            <input type="number" id="patientId" name="patientId" required>
            <input type="submit" value="Delete Patient">
        </form>
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>