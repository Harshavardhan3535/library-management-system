<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📚 Library Management System</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="header">
        <h1>📚 Library Management System</h1>
        <p>Efficiently Manage Books, Members, and Loans</p>
        
        <!-- SEARCH BAR MOVED TO HEADER -->
        <div class="header-search">
            <form action="searchBook" method="get">
                <input type="text" name="search" placeholder="🔍 Search books by title or author..." />
                <button type="submit" class="btn">Search</button>
            </form>
        </div>
    </div>
    
    <div class="container-cards">
        
        <!-- BOOKS CARD -->
        <div class="card">
            <div class="icon">📖</div>
            <h3>Books</h3>
            <p>Add, view, update, or delete books</p>
            <div class="btn-group">
                <a href="addBook" class="btn btn-green">➕ Add Book</a>
                <a href="viewBooks" class="btn">View All</a>
            </div>
        </div>

        <!-- MEMBERS CARD -->
        <div class="card">
            <div class="icon">👤</div>
            <h3>Members</h3>
            <p>Add and manage library members</p>
            <div class="btn-group">
                <a href="addMember" class="btn btn-green">➕ Add Member</a>
                <a href="viewMembers" class="btn">View All</a>
            </div>
        </div>

        <!-- LOANS CARD -->
        <div class="card">
            <div class="icon">🔄</div>
            <h3>Loans</h3>
            <p>Issue and return books</p>
            <div class="btn-group">
                <a href="issueBook" class="btn btn-green">Issue Book</a>
                <a href="viewLoans" class="btn">View All</a>
            </div>
        </div>
        
    </div>
</body>
</html>