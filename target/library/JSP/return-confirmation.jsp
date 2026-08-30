<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.library_management_system.entity.Loan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>✅ Return Confirmation</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container" style="max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); text-align: center;">
        <h2>✅ Book Returned Successfully!</h2>
        
        <%
            Loan loan = (Loan) request.getAttribute("loan");
            Double fine = (Double) request.getAttribute("fine");
            
            if (loan != null) {
        %>
            <p><strong>Book:</strong> <%= loan.getBook().getTitle() %></p>
            <p><strong>Member:</strong> <%= loan.getMember().getName() %></p>
            <p><strong>Due Date:</strong> <%= loan.getDueDate() %></p>
            <p><strong>Return Date:</strong> <%= loan.getReturnDate() %></p>
            
            <%
                if (fine != null && fine > 0) {
            %>
                <p style="color: #e74c3c; font-size: 1.5rem; font-weight: bold;">⚠️ Late Fine: $<%= String.format("%.2f", fine) %></p>
            <%
                } else {
            %>
                <p style="color: #2ecc71; font-size: 1.5rem; font-weight: bold;">✅ No fine! Book returned on time.</p>
            <%
                }
            %>
        <%
            }
        %>
        
        <br>
        <a href="index.jsp" class="btn btn-primary">← Back to Home</a>
    </div>
</body>
</html>