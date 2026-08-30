<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>👤 Add Member</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
        * { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        body { margin: 0; padding: 20px; background: #f0f2f5; }
        .container { max-width: 600px; margin: auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
        h2 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: 600; color: #555; }
        input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 8px; box-sizing: border-box; }
        .btn { display: inline-block; padding: 10px 20px; background: #2ecc71; color: white; border: none; border-radius: 8px; cursor: pointer; font-size: 16px; }
        .btn:hover { background: #27ae60; }
        .btn-back { background: #6c757d; }
        .btn-back:hover { background: #5a6268; }
        .btn-group { display: flex; gap: 10px; margin-top: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>👤 Add New Member</h2>
        <form action="addMember" method="post">
            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" required />
            </div>
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" required />
            </div>
            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="phone" required />
            </div>
            <div class="btn-group">
                <button type="submit" class="btn">Add Member</button>
                <a href="viewMembers" class="btn btn-back">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>