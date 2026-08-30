<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.library_management_system.entity.Member" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>👤 View Members</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="header-actions">
            <h2>👤 Member List</h2>
            <div>
                <a href="index.jsp" class="btn btn-back">← Back to Home</a>
                <a href="addMember" class="btn btn-green">+ Add Member</a>
            </div>
        </div>
        
        <%
            List<Member> members = (List<Member>) request.getAttribute("members");
            if (members != null && !members.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Member member : members) {
                %>
                <tr>
                    <td><%= member.getId() %></td>
                    <td><%= member.getName() %></td>
                    <td><%= member.getEmail() %></td>
                    <td><%= member.getPhone() %></td>
                    <td>
                        <span class="badge <%= member.getActive() ? "badge-green" : "badge-red" %>">
                            <%= member.getActive() ? "✅ Active" : "❌ Inactive" %>
                        </span>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        
        <!-- Back to Home Button (Bottom) -->
        <div style="text-align: center; margin-top: 20px;">
            <a href="index.jsp" class="btn btn-back">← Back to Home</a>
        </div>
        
        <%
            } else {
        %>
            <div class="empty">
                <span class="icon">👤</span>
                <p>No members found.</p>
                <a href="addMember" class="btn btn-green" style="margin-top:15px;">+ Add Your First Member</a>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>