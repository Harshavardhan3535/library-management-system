<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Loan" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📤 Return Book</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 800px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 10px; border-bottom: 1px solid #eee; text-align: left; }
        th { background: #2c3e50; color: white; }
        .btn { display: inline-block; padding: 8px 20px; text-decoration: none; border-radius: 8px; font-weight: 600; border: none; cursor: pointer; }
        .btn-success { background: #2ecc71; color: white; }
        .btn-success:hover { background: #27ae60; }
        .btn-back { background: #6c757d; color: white; }
        .btn-back:hover { background: #5a6268; }
        .btn-group { display: flex; gap: 10px; justify-content: center; margin-top: 20px; }
        .empty { text-align: center; padding: 50px; color: #999; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📤 Return Book</h2>
        
        <%
            List<Loan> loans = (List<Loan>) request.getAttribute("loans");
            if (loans != null && !loans.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Book</th>
                    <th>Member</th>
                    <th>Due Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Loan loan : loans) {
                %>
                <tr>
                    <td><%= loan.getBook().getTitle() %></td>
                    <td><%= loan.getMember().getName() %></td>
                    <td><%= loan.getDueDate() %></td>
                    <td>
                        <form action="returnBook" method="post">
                            <input type="hidden" name="loanId" value="<%= loan.getId() %>" />
                            <button type="submit" class="btn btn-success">Return</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
            <div class="empty">
                <p style="font-size: 3rem;">📭</p>
                <p>No books are currently issued.</p>
            </div>
        <%
            }
        %>
        
        <div class="btn-group">
            <a href="index.jsp" class="btn btn-back">← Back to Home</a>
        </div>
    </div>
</body>
</html>