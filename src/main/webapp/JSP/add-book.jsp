<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📚 Add Book</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: 600; color: #555; }
        input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn { display: inline-block; padding: 10px 20px; background: #667eea; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
        .btn:hover { background: #764ba2; }
        .btn-back { background: #6c757d; }
        .btn-back:hover { background: #5a6268; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>📚 Add New Book</h2>
        <form action="addBook" method="post">
            <div class="form-group">
                <label>Title:</label>
                <input type="text" name="title" required />
            </div>
            <div class="form-group">
                <label>ISBN:</label>
                <input type="text" name="isbn" required />
            </div>
            <div class="form-group">
                <label>Year:</label>
                <input type="number" name="year" required />
            </div>
            <div class="form-group">
                <label>Price:</label>
                <input type="number" step="0.01" name="price" required />
            </div>
            <div class="form-group">
                <label>Author ID:</label>
                <input type="number" name="authorId" placeholder="Enter Author ID" required />
            </div>
            <div class="form-group">
                <label>Category ID:</label>
                <input type="number" name="categoryId" placeholder="Enter Category ID" required />
            </div>
            <div class="btn-group">
                <button type="submit" class="btn">Add Book</button>
                <a href="index.jsp" class="btn btn-back">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>