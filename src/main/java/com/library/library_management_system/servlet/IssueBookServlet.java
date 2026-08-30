package com.library.library_management_system.servlet;

import com.library.library_management_system.entity.Book;
import com.library.library_management_system.entity.Loan;
import com.library.library_management_system.entity.Member;
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
import java.util.List;

@WebServlet("/issueBook")
public class IssueBookServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        
        try {
            // Get available books
            Query bookQuery = em.createQuery("SELECT b FROM Book b WHERE b.available = true");
            List<Book> books = bookQuery.getResultList();
            
            // Get active members
            Query memberQuery = em.createQuery("SELECT m FROM Member m WHERE m.active = true");
            List<Member> members = memberQuery.getResultList();
            
            req.setAttribute("books", books);
            req.setAttribute("members", members);
            req.getRequestDispatcher("JSP/issue-book.jsp").forward(req, resp);
            
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
        
        String bookIdStr = req.getParameter("bookId");
        String memberIdStr = req.getParameter("memberId");
        String daysStr = req.getParameter("days");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        
        try {
            Long bookId = Long.parseLong(bookIdStr);
            Long memberId = Long.parseLong(memberIdStr);
            int days = Integer.parseInt(daysStr);
            
            Book book = em.find(Book.class, bookId);
            Member member = em.find(Member.class, memberId);
            
            if (book == null || member == null) {
                resp.sendRedirect("issueBook");
                return;
            }
            
            if (!book.getAvailable()) {
                req.setAttribute("error", "Book is already issued!");
                doGet(req, resp);
                return;
            }
            
            // Create Loan
            Loan loan = new Loan();
            loan.setBook(book);
            loan.setMember(member);
            loan.setDueDate(LocalDate.now().plusDays(days));
            loan.setStatus("ISSUED");
            
            // Update book availability
            book.setAvailable(false);
            
            et.begin();
            em.persist(loan);
            em.merge(book);
            et.commit();
            
            resp.sendRedirect("viewLoans");
            
        } catch (Exception e) {
            if (et.isActive()) et.rollback();
            e.printStackTrace();
            resp.sendRedirect("issueBook");
        } finally {
            em.close();
            emf.close();
        }
    }
}