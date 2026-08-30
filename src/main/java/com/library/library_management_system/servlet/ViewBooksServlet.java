package com.library.library_management_system.servlet;

import java.io.IOException;
import java.util.List;

import com.library.library_management_system.dao.BookDAO;
import com.library.library_management_system.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewBooks")
public class ViewBooksServlet extends HttpServlet {
    
    private BookDAO bookDAO = new BookDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        List<Book> books = bookDAO.findAll();
        req.setAttribute("books", books);
        
        // ✅ FIX: Use lowercase .jsp to match the file
        req.getRequestDispatcher("JSP/view-books.jsp").forward(req, resp);
    }
}