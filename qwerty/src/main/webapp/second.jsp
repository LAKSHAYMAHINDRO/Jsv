
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        div.container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: left;
            max-width: 600px;
            width: 100%;
        }

        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 15px;
        }

        p {
            margin: 8px 0;
            line-height: 1.5;
            color: #555; /* Text color for paragraphs */
        }

        h1.invalid {
            color: #e74c3c;
        }

        h1.enter-name {
            margin-bottom: 20px;
            color: #3498db; /* Text color for the enter-name message */
        }

        p:hover {
            background-color: #f0f0f0;
            transition: background-color 0.3s ease;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin: 20px 0;
        }

        /* Additional styling for student details */
        p strong {
            color: #27ae60; /* Color for the strong (bold) text */
        }

        p em {
            color: #e67e22; /* Color for the italicized text */
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String name = request.getParameter("Name");
            String type = request.getParameter("Type");

            if (name != null && !name.isEmpty() && type != null && !type.isEmpty()) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Lakshay", "root", "");
                    Statement stmt = con.createStatement();
                    
                    if ("StudentInformation".equals(type)) {
                        // Display student information
                        ResultSet rs = stmt.executeQuery("SELECT * FROM Information WHERE Name='" + name + "'");
                        if (rs.next()) {
                            out.println("<h1>Student Details</h1>");
                            out.println("<p><strong>Name:</strong> " + rs.getString("Name") + "</p>");
                            out.println("<p><strong>Department:</strong> " + rs.getString("Department") + "</p>");
                            out.println("<p><strong>Year:</strong> " + rs.getString("Year") + "</p>");
                            out.println("<p><strong>Age:</strong> " + rs.getString("Age") + "</p>");
                            out.println("<p><strong>Father's Name:</strong> " + rs.getString("Father's Name") + "</p>");
                            out.println("<p><strong>Email-Id:</strong> " + rs.getString("Email-Id") + "</p>");
                            out.println("<p><strong>Blood group:</strong> " + rs.getString("Blood group") + "</p>");
                            out.println("<p><strong>Degree:</strong> " + rs.getString("Degree") + "</p>");
                            out.println("<hr>");
                            out.println("<p><em>No additional information available</em></p>");
                        } else {
                            out.println("<h1 class='invalid'>Invalid Name</h1>");
                        }
                    } else if ("ReportCard".equals(type)) {
                        // Display CGPA for Report Card
                        ResultSet rs = stmt.executeQuery("SELECT * FROM subjects WHERE Name='" + name + "'");
                        if (rs.next()) {
                            out.println("<h1>Report Card</h1>");
                            out.println("<p><strong>Name:</strong> " + name + "</p>");
                            out.println("<p><strong>OS:</strong> " + rs.getString("OS") + "</p>");
                            out.println("<p><strong>CNS:</strong> " + rs.getString("CNS") + "</p>");
                            out.println("<p><strong>DBMS:</strong> " + rs.getString("DBMS") + "</p>");
                            out.println("<p><strong>SE:</strong> " + rs.getString("SE") + "</p>");
                            out.println("<p><strong>AIML:</strong> " + rs.getString("AIML") + "</p>");
                            out.println("<p><strong>RM-IPR:</strong> " + rs.getString("RM-IPR") + "</p>");
                            out.println("<p><strong>JAVA:</strong> " + rs.getString("JAVA") + "</p>");
                            out.println("<p><strong>CGPA:</strong> " + rs.getString("CGPA") + "</p>");
                            out.println("<hr>");
                            out.println("<p><em>No additional information available</em></p>");
                        } else {
                            out.println("<h1 class='invalid'>Invalid Name or CGPA not available</h1>");
                        }
                    }

                    con.close();
                } catch (Exception e) {
                    out.println(e);
                }
            } else {
                out.println("<h1 class='enter-name'>Please enter a Name and choose a Type</h1>");
            }
        %>
    </div>
</body>
</html>

