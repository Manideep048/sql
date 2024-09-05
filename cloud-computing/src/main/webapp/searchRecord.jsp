<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve the patient name from the request
    String patientName = request.getParameter("patient_name");

    try {
        // Load and register the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish connection to the database
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/health_records", "root", ""); // Update database name to health_records_db

        // Prepare SQL select query
        String query = "SELECT * FROM EHR WHERE patient_name LIKE ?";
        PreparedStatement ps = con.prepareStatement(query);
        
        // Set parameter for the prepared statement
        ps.setString(1, "%" + patientName + "%");
        
        // Execute the SQL query
        ResultSet rs = ps.executeQuery();
        
        // Output search results
        out.println("<h2>Search Results</h2>");
        while (rs.next()) {
            out.println("ID: " + rs.getInt("id") + "<br>");
            out.println("Patient Name: " + rs.getString("patient_name") + "<br>");
            out.println("Age: " + rs.getInt("age") + "<br>");
            out.println("Place: " + rs.getString("place") + "<br>"); // Display Place
            out.println("Disease: " + rs.getString("disease") + "<br>"); // Display Disease
            out.println("Treatment: " + rs.getString("treatment") + "<br>");
            out.println("Date of Visit: " + rs.getDate("date_of_visit") + "<br><hr>");
        }
        
        // Close the database connection
        con.close();
    } catch (Exception e) {
        // Output error message
        out.println("Error: " + e.getMessage());
    }
%>
