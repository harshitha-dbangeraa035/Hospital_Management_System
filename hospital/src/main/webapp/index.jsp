<%-- WebContent/index.jsp --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient to right, #e0f2f7, #c1e7f0; /* Light blue gradient */
            color: #333;
            line-height: 1.6;
        }

        /* Header Styling */
        .header {
            background-color: #007bff; /* Primary blue */
            color: white;
            padding: 25px 0;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 2.8em;
            letter-spacing: 1px;
        }

        .header p {
            font-size: 1.1em;
            opacity: 0.9;
            margin-top: 5px;
        }

        /* Main Content Container */
        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            text-align: center;
        }

        .container h2 {
            color: #0056b3;
            margin-bottom: 25px;
            font-size: 2em;
        }

        .container p {
            margin-bottom: 30px;
            font-size: 1.1em;
            color: #555;
        }

        /* Navigation Menu Styling */
        .nav-menu {
            display: flex;
            flex-wrap: wrap; /* Allows items to wrap on smaller screens */
            justify-content: center;
            gap: 20px; /* Space between navigation buttons */
            list-style: none; /* Remove bullet points */
            padding: 0;
            margin-top: 30px;
        }

        .nav-item {
            flex: 1 1 auto; /* Allow items to grow and shrink, with a base size */
            max-width: 250px; /* Max width for each button */
        }

        .nav-link {
            display: block; /* Make the whole link clickable block */
            background-color: #007bff; /* Primary blue */
            color: white;
            text-decoration: none;
            padding: 18px 25px;
            border-radius: 8px;
            font-size: 1.15em;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
            white-space: nowrap; /* Prevent text wrapping inside buttons */
        }

        .nav-link:hover {
            background-color: #0056b3; /* Darker blue on hover */
            transform: translateY(-3px); /* Slight lift effect */
            box-shadow: 0 6px 12px rgba(0,0,0,0.2);
        }

        .nav-link:active {
            transform: translateY(0); /* Return to original position on click */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 2.2em;
            }
            .container {
                margin: 20px auto;
                padding: 20px;
            }
            .nav-menu {
                flex-direction: column; /* Stack buttons vertically on small screens */
                align-items: center; /* Center stacked buttons */
            }
            .nav-item {
                width: 90%; /* Make buttons wider on small screens */
                max-width: 300px; /* Ensure they don't get too wide */
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Hospital Management System</h1>
        <p>Efficiently manage patient records, doctor assignments, and appointments.</p>
    </div>

    <div class="container">
        <h2>Welcome to Your Management Dashboard</h2>
        

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="patientadd.jsp" class="nav-link">Add New Patient</a>
            </li>
            <li class="nav-item">
                <a href="patientupdate.jsp" class="nav-link">Update Patient Records</a>
            </li>
            <li class="nav-item">
                <a href="patientdelete.jsp" class="nav-link">Delete Patient Records</a>
            </li>
            <li class="nav-item">
                <a href="DisplayPatientsServlet" class="nav-link">View All Patients</a>
            </li>
            <li class="nav-item">
                <a href="ReportCriteriaServlet" class="nav-link">Generate Reports</a>
            </li>
        </ul>
    </div>
</body>
</html>