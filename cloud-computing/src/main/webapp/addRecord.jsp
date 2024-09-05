<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve form parameters
    String patientName = request.getParameter("patient_name");
    int age = Integer.parseInt(request.getParameter("age"));
    String place = request.getParameter("place");  // New parameter for Place
    String disease = request.getParameter("disease");  // Renamed from Diagnosis to Disease
    String treatment = request.getParameter("treatment");
    String dateOfVisit = request.getParameter("date_of_visit");

    try {
        // Load and register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_records", "root", ""); // Update database name to health_records_db

        // Prepare SQL insert query
        String query = "INSERT INTO EHR (patient_name, age, place, disease, treatment, date_of_visit) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);
        
        // Set parameters for the prepared statement
        ps.setString(1, patientName);
        ps.setInt(2, age);
        ps.setString(3, place);  // Add Place parameter
        ps.setString(4, disease);  // Changed from Diagnosis to Disease
        ps.setString(5, treatment);
        ps.setString(6, dateOfVisit);
        
        // Execute the SQL query
        ps.executeUpdate();
        
        // Output success message
        out.println("Record added successfully!");
        
        // Close connection
        con.close();
    } catch (Exception e) {
        // Output error message
        out.println("Error: " + e.getMessage());
    }
%>
