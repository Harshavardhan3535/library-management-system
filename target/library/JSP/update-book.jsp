<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.library_management_system.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📚 Update Book</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: 600; color: #555; }
        input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn { display: inline-block; padding: 10px 20px; background: #f39c12; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
        .btn:hover { background: #e67e22; }
        .btn-back { background: #6c757d; }
        .btn-back:hover { background: #5a6268; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>✏️ Update Book</h2>
        <%
            Book book = (Book) request.getAttribute("book");
            if (book != null) {
        %>
        <form action="updateBook" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>" />
            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" value="<%= book.getTitle() %>" required />
            </div>
            <div class="form-group">
                <label>ISBN:</label>
                <input type="text" name="isbn" value="<%= book.getIsbn() %>" required />
            </div>
            <div class="form-group">
                <label>Year:</label>
                <input type="number" name="year" value="<%= book.getYear() %>" required />
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" step="0.01" name="price" value="<%= book.getPrice() %>" required />
            </div>
            <div class="btn-group">
                <button type="submit" class="btn">Update Book</button>
                <a href="viewBooks" class="btn btn-back">Cancel</a>
            </div>
        </form>
        <%
            } else {
        %>
            <p>Book not found!</p>
            <a href="viewBooks">Back to Book List</a>
        <%
            }
        %>
    </div>
</body>
</html>
