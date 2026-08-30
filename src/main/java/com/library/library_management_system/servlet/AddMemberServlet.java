package com.library.library_management_system.servlet;

import com.library.library_management_system.entity.Member;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addMember")
public class AddMemberServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("JSP/add-member.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("library");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        
        try {
            Member member = new Member();
            member.setName(name);
            member.setEmail(email);
            member.setPhone(phone);
            
            et.begin();
            em.persist(member);
            et.commit();
            
            resp.sendRedirect("viewMembers");
        } catch (Exception e) {
            if (et.isActive()) et.rollback();
            e.printStackTrace();
            resp.sendRedirect("addMember");
        } finally {
            em.close();
            emf.close();
        }
    }
}