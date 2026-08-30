package com.library.library_management_system.servlet;

import com.library.library_management_system.entity.Book;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String searchTerm = req.getParameter("search");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            List<Book> books = null;
            
            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                // ✅ FIXED: Using LEFT JOIN to search author name
                Query query = em.createQuery(
                    "SELECT b FROM Book b LEFT JOIN b.author a WHERE " +
                    "LOWER(b.title) LIKE LOWER(:search) OR " +
                    "LOWER(a.name) LIKE LOWER(:search)"
                );
                query.setParameter("search", "%" + searchTerm.trim() + "%");
                books = query.getResultList();
            } else {
                books = em.createQuery("SELECT b FROM Book b", Book.class).getResultList();
            }
            
            req.setAttribute("books", books);
            req.setAttribute("searchTerm", searchTerm);
            req.getRequestDispatcher("JSP/search-book.jsp").forward(req, resp);
            
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Search failed: " + e.getMessage());
            req.getRequestDispatcher("JSP/search-book.jsp").forward(req, resp);
        } finally {
            em.close();
            emf.close();
        }
    }
}