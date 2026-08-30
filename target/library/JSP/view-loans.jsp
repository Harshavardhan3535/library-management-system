<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Loan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📋 View Loans</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 1400px; margin: auto; background: white; padding: 25px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .btn { display: inline-block; padding: 8px 20px; text-decoration: none; border-radius: 8px; font-weight: 600; }
        .btn-primary { background: #667eea; color: white; }
        .btn-primary:hover { background: #764ba2; }
        .btn-green { background: #2ecc71; color: white; }
        .btn-green:hover { background: #27ae60; }
        .btn-danger { background: #e74c3c; color: white; }
        .btn-danger:hover { background: #c0392b; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #2c3e50; color: white; }
        tr:hover { background: #f8f9fa; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 0.8rem; font-weight: 600; }
        .badge-success { background: #d4edda; color: #155724; }
        .badge-warning { background: #fff3cd; color: #856404; }
        .badge-danger { background: #f8d7da; color: #721c24; }
        .badge-info { background: #d1ecf1; color: #0c5460; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>📋 Loan Records</h2>
            <div>
                <a href="index.jsp" class="btn btn-primary">← Home</a>
                <a href="issueBook" class="btn btn-green">+ Issue New Book</a>
            </div>
        </div>
        
        <%
            List<Loan> loans = (List<Loan>) request.getAttribute("loans");
            if (loans != null && !loans.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Book</th>
                    <th>Member</th>
                    <th>Issue Date</th>
                    <th>Due Date</th>
                    <th>Return Date</th>
                    <th>Fine</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Loan loan : loans) {
                        String badgeClass = "badge-info";
                        if ("RETURNED".equals(loan.getStatus())) badgeClass = "badge-success";
                        else if ("OVERDUE".equals(loan.getStatus())) badgeClass = "badge-danger";
                %>
                <tr>
                    <td><%= loan.getId() %></td>
                    <td><%= loan.getBook().getTitle() %></td>
                    <td><%= loan.getMember().getName() %></td>
                    <td><%= loan.getIssueDate() %></td>
                    <td><%= loan.getDueDate() %></td>
                    <td><%= loan.getReturnDate() != null ? loan.getReturnDate() : "Not Returned" %></td>
                    <td><%= loan.getFine() != null ? "$" + loan.getFine() : "$0.00" %></td>
                    <td><span class="badge <%= badgeClass %>"><%= loan.getStatus() %></span></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
            <p style="text-align:center; color:#999; padding:50px;">No loans found.</p>
        <%
            }
        %>
    </div>
</body>
</html>