package com.library.library_management_system.servlet;

import com.library.library_management_system.entity.Book;
import com.library.library_management_system.entity.Loan;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet("/returnBook")
public class ReturnBookServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            // Get all issued loans (not returned)
            Query query = em.createQuery("SELECT l FROM Loan l WHERE l.status = 'ISSUED' OR l.status = 'OVERDUE'");
            List<Loan> loans = query.getResultList();
            req.setAttribute("loans", loans);
            req.getRequestDispatcher("JSP/return-book.jsp").forward(req, resp);
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp");
        } finally {
            em.close();
            emf.close();
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String loanIdStr = req.getParameter("loanId");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        
        try {
            Long loanId = Long.parseLong(loanIdStr);
            Loan loan = em.find(Loan.class, loanId);
            
            if (loan == null) {
                resp.sendRedirect("returnBook");
                return;
            }
            
            // Calculate fine if overdue
            LocalDate today = LocalDate.now();
            double fine = 0.0;
            
            if (today.isAfter(loan.getDueDate())) {
                long daysLate = ChronoUnit.DAYS.between(loan.getDueDate(), today);
                fine = daysLate * 5.0; // $5 per day late
            }
            
            // Update loan
            loan.setReturnDate(today);
            loan.setFine(fine);
            loan.setStatus("RETURNED");
            
            // Make book available again
            Book book = loan.getBook();
            book.setAvailable(true);
            
            et.begin();
            em.merge(loan);
            em.merge(book);
            et.commit();
            
            req.setAttribute("fine", fine);
            req.setAttribute("loan", loan);
            req.getRequestDispatcher("JSP/return-confirmation.jsp").forward(req, resp);
            
        } catch (Exception e) {
            if (et.isActive()) et.rollback();
            e.printStackTrace();
            resp.sendRedirect("returnBook");
        } finally {
            em.close();
            emf.close();
        }
    }
}