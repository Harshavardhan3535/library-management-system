package com.library.library_management_system.servlet;

import java.io.IOException;

import com.library.library_management_system.dao.BookDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {

    private BookDAO bookDAO = new BookDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        if (id != null && !id.isEmpty()) {
            bookDAO.delete(Long.parseLong(id));
        }
        resp.sendRedirect("viewBooks");
    }
}