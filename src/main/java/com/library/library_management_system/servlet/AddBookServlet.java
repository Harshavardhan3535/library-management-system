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

@WebServlet("/addBook")
public class AddBookServlet extends HttpServlet {
    
    private BookDAO bookDAO = new BookDAO();
    
    // ✅ ADD THIS - To show the form when you click "Add Book"
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("JSP/add-book.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Get form data
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String yearStr = req.getParameter("year");
        String priceStr = req.getParameter("price");
        String authorIdStr = req.getParameter("authorId");
        String categoryIdStr = req.getParameter("categoryId");
        
        // Create EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            // Create Book
            Book book = new Book();
            book.setTitle(title);
            book.setIsbn(isbn);
            book.setYear(Integer.parseInt(yearStr));
            book.setPrice(Double.parseDouble(priceStr));
            
            // Set Author and Category
            Author author = em.find(Author.class, Long.parseLong(authorIdStr));
            Category category = em.find(Category.class, Long.parseLong(categoryIdStr));
            
            book.setAuthor(author);
            book.setCategory(category);
            
            // Save book using DAO
            bookDAO.save(book);
            
            resp.sendRedirect("viewBooks");
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addBook");
        } finally {
            em.close();
            emf.close();
        }
    }
}