<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Book" %>
<%@ page import="com.library.library_management_system.entity.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📤 Issue Book</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: 600; color: #555; }
        select, input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn { display: inline-block; padding: 10px 20px; background: #f39c12; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
        .btn:hover { background: #e67e22; }
        .btn-back { background: #6c757d; }
        .btn-back:hover { background: #5a6268; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
        .error { color: red; margin: 10px 0; padding: 10px; background: #fde8e8; border-radius: 8px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📤 Issue Book to Member</h2>
        
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error"><%= error %></div>
        <%
            }
        %>
        
        <form action="issueBook" method="post">
            <div class="form-group">
                <label>Select Book:</label>
                <select name="bookId" required>
                    <option value="">-- Select a Book --</option>
                    <%
                        List<Book> books = (List<Book>) request.getAttribute("books");
                        if (books != null) {
                            for (Book book : books) {
                    %>
                        <option value="<%= book.getId() %>"><%= book.getTitle() %> (ID: <%= book.getId() %>)</option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            
            <div class="form-group">
                <label>Select Member:</label>
                <select name="memberId" required>
                    <option value="">-- Select a Member --</option>
                    <%
                        List<Member> members = (List<Member>) request.getAttribute("members");
                        if (members != null) {
                            for (Member member : members) {
                    %>
                        <option value="<%= member.getId() %>"><%= member.getName() %> (ID: <%= member.getId() %>)</option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            
            <div class="form-group">
                <label>Days to Return:</label>
                <input type="number" name="days" value="7" min="1" max="30" required />
            </div>
            
            <div class="btn-group">
                <button type="submit" class="btn">Issue Book</button>
                <a href="index.jsp" class="btn btn-back">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>