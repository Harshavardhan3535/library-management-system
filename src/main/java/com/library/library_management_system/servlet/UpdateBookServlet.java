package com.library.library_management_system.servlet;

import com.library.library_management_system.dao.BookDAO;
import com.library.library_management_system.entity.Book;
import com.library.library_management_system.entity.Author;
import com.library.library_management_system.entity.Category;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {
    
    private BookDAO bookDAO = new BookDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String id = req.getParameter("id");
        if (id != null && !id.isEmpty()) {
            Book book = bookDAO.findById(Long.parseLong(id));
            req.setAttribute("book", book);
        }
        req.getRequestDispatcher("JSP/update-book.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String yearStr = req.getParameter("year");
        String priceStr = req.getParameter("price");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            Book book = bookDAO.findById(Long.parseLong(id));
            if (book != null) {
                book.setTitle(title);
                book.setIsbn(isbn);
                book.setYear(Integer.parseInt(yearStr));
                book.setPrice(Double.parseDouble(priceStr));
                bookDAO.update(book);
            }
            resp.sendRedirect("viewBooks");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("updateBook?id=" + id);
        } finally {
            em.close();
            emf.close();
        }
    }
}