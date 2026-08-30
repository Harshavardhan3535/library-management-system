<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📚 View Books</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 1400px; margin: auto; background: white; padding: 25px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; flex-wrap: wrap; }
        .header h2 { color: #333; }
        .btn { display: inline-block; padding: 8px 20px; text-decoration: none; border-radius: 8px; font-weight: 600; transition: 0.3s; }
        .btn-primary { background: #667eea; color: white; }
        .btn-primary:hover { background: #764ba2; }
        .btn-delete { background: #e74c3c; color: white; }
        .btn-delete:hover { background: #c0392b; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #2c3e50; color: white; }
        tr:hover { background: #f8f9fa; }
        .available { color: #2ecc71; font-weight: 600; }
        .unavailable { color: #e74c3c; font-weight: 600; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 0.8rem; font-weight: 600; }
        .badge-green { background: #d4edda; color: #155724; }
        .badge-red { background: #f8d7da; color: #721c24; }
        .empty { text-align: center; padding: 50px; color: #999; }
        .btn-edit { background: #f39c12; color: white; }
		.btn-edit:hover { background: #e67e22; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>📖 Book List</h2>
            <a href="index.jsp" class="btn btn-primary">← Home</a>
        </div>
        
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null && !books.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Year</th>
                    <th>Price</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Book book : books) {
                %>
                <tr>
                    <td><%= book.getId() %></td>
                    <td><strong><%= book.getTitle() %></strong></td>
                    <td><%= book.getIsbn() %></td>
                    <td><%= book.getYear() %></td>
                    <td>$<%= String.format("%.2f", book.getPrice()) %></td>
                    <td><%= book.getAuthor() != null ? book.getAuthor().getName() : "N/A" %></td>
                    <td><%= book.getCategory() != null ? book.getCategory().getName() : "N/A" %></td>
                    <td>
                        <span class="badge <%= book.getAvailable() ? "badge-green" : "badge-red" %>">
                            <%= book.getAvailable() ? "✅ Available" : "❌ Issued" %>
                        </span>
                    </td>
                    <td>
                        <a href="deleteBook?id=<%= book.getId() %>" class="btn btn-delete" onclick="return confirm('Are you sure?')">🗑️ Delete</a>
                    </td>
                    <td>
                    	<a href="updateBook?id=<%= book.getId() %>" class="btn btn-edit">✏️ Edit</a>
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
                <p>No books found in the library.</p>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>