<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Electronic Health Records</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin: 20px 0;
            text-align: center;
        }

        .form-container h3 {
            color: #444;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        td {
            padding: 8px;
            text-align: left;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            margin-bottom: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        .toggle-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        .toggle-button:hover {
            background-color: #45a049;
        }

        .hidden {
            display: none;
        }
    </style>
    <script>
        // Function to toggle visibility of forms
        function toggleForm(formId) {
            const form = document.getElementById(formId);
            form.classList.toggle('hidden');
        }
    </script>
</head>
<body>
    <h2>Electronic Health Records (EHR) Management</h2>
    
    <!-- Form to Add Record -->
    <div class="form-container">
        <form action="addRecord.jsp" method="post">
            <h3>Add Record</h3>
            <table>
                <tr>
                    <td>Patient Name:</td>
                    <td><input type="text" name="patient_name" required></td>
                </tr>
                <tr>
                    <td>Age:</td>
                    <td><input type="number" name="age" required></td>
                </tr>
                <tr>
                    <td>Place:</td>
                    <td><input type="text" name="place" required></td>
                </tr>
                <tr>
                    <td>Disease:</td>
                    <td><input type="text" name="disease" required></td>
                </tr>
                <tr>
                    <td>Treatment:</td>
                    <td><input type="text" name="treatment" required></td>
                </tr>
                <tr>
                    <td>Date of Visit:</td>
                    <td><input type="date" name="date_of_visit" required></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" value="Add Record">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <!-- Buttons to Show/Hide Search and Delete Forms -->
    <div class="form-container">
        <button class="toggle-button" onclick="toggleForm('searchForm')">Search Records</button>
        <button class="toggle-button" onclick="toggleForm('deleteForm')">Delete Records</button>
    </div>

    <!-- Form to Search Record -->
    <div class="form-container hidden" id="searchForm">
        <form action="searchRecord.jsp" method="get">
            <h3>Search Record by Patient Name</h3>
            Patient Name: <input type="text" name="patient_name">
            <input type="submit" value="Search">
        </form>
    </div>

    <!-- Form to Delete Record -->
    <div class="form-container hidden" id="deleteForm">
        <form action="deleteRecord.jsp" method="post">
            <h3>Delete Record by ID</h3>
            Record ID: <input type="number" name="id">
            <input type="submit" value="Delete">
        </form>
    </div>
</body>
</html>
