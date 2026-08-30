<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Book" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔍 Search Books</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 1200px; margin: auto; background: white; padding: 25px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; flex-wrap: wrap; }
        .search-box { display: flex; gap: 10px; margin: 20px 0; }
        .search-box input { flex: 1; padding: 10px; border: 2px solid #ddd; border-radius: 8px; font-size: 16px; }
        .search-box button { padding: 10px 30px; background: #667eea; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
        .search-box button:hover { background: #764ba2; }
        .btn { display: inline-block; padding: 8px 20px; text-decoration: none; border-radius: 8px; font-weight: 600; }
        .btn-primary { background: #667eea; color: white; }
        .btn-primary:hover { background: #764ba2; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #2c3e50; color: white; }
        tr:hover { background: #f8f9fa; }
        .badge { padding: 3px 10px; border-radius: 12px; font-size: 0.8rem; font-weight: 600; }
        .badge-green { background: #d4edda; color: #155724; }
        .badge-red { background: #f8d7da; color: #721c24; }
        .empty { text-align: center; padding: 50px; color: #999; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>🔍 Search Books</h2>
            <a href="index.jsp" class="btn btn-primary">← Home</a>
        </div>
        
        <div class="search-box">
            <form action="searchBook" method="get" style="display: flex; gap: 10px; width: 100%;">
                <input type="text" name="search" placeholder="Search by title or author..." 
                       value="<%= request.getAttribute("searchTerm") != null ? request.getAttribute("searchTerm") : "" %>" />
                <button type="submit">Search</button>
            </form>
        </div>
        
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            String searchTerm = (String) request.getAttribute("searchTerm");
            
            if (books != null && !books.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Author</th>
                    <th>Category</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Book book : books) {
                %>
                <tr>
                    <td><%= book.getId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getIsbn() %></td>
                    <td><%= book.getAuthor() != null ? book.getAuthor().getName() : "N/A" %></td>
                    <td><%= book.getCategory() != null ? book.getCategory().getName() : "N/A" %></td>
                    <td>
                        <span class="badge <%= book.getAvailable() ? "badge-green" : "badge-red" %>">
                            <%= book.getAvailable() ? "✅ Available" : "❌ Issued" %>
                        </span>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else if (searchTerm != null && !searchTerm.isEmpty()) {
        %>
            <div class="empty">
                <p style="font-size: 3rem;">🔍</p>
                <p>No books found for "<%= searchTerm %>"</p>
                <p style="color: #999; font-size: 0.9rem;">💡 Suggestions:</p>
        		<ul style="list-style: none; padding: 0; color: #666;">
            		<li>• Make sure all words are spelled correctly</li>
            		<li>• Try different keywords</li>
            		<li>• Try searching by author name</li>
        		</ul>
        		<a href="addBook" class="btn btn-green" style="margin-top:15px;">+ Add a New Book</a>
            </div>
        <%
            } else {
        %>
            <div class="empty">
                <p style="font-size: 3rem;">📚</p>
                <p>Enter a search term to find books.</p>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>