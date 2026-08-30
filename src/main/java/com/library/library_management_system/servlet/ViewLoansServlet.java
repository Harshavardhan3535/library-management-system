package com.library.library_management_system.servlet;

import com.library.library_management_system.entity.Loan;
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

@WebServlet("/viewLoans")
public class ViewLoansServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            Query query = em.createQuery("SELECT l FROM Loan l ORDER BY l.id DESC");
            List<Loan> loans = query.getResultList();
            req.setAttribute("loans", loans);
            req.getRequestDispatcher("JSP/view-loans.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp");
        } finally {
            em.close();
            emf.close();
        }
    }
}