package com.library.library_management_system.dao;

import java.util.List;

import com.library.library_management_system.entity.Book;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;

public class BookDAO extends BaseDAO {

    // Save
    public Book save(Book book) {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(book);
            et.commit();
            return book;
        } catch (Exception e) {
            if (et.isActive()) {
				et.rollback();
			}
            e.printStackTrace();
            return null;
        } finally {
            close(em);
        }
    }

    // Find by ID
    public Book findById(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Book.class, id);
        } finally {
            close(em);
        }
    }

    // Find All
    public List<Book> findAll() {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("FROM Book b ORDER BY b.id", Book.class)
                    .getResultList();
        } finally {
            close(em);
        }
    }

    // Update
    public Book update(Book book) {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            Book updated = em.merge(book);
            et.commit();
            return updated;
        } catch (Exception e) {
            if (et.isActive()) {
				et.rollback();
			}
            e.printStackTrace();
            return null;
        } finally {
            close(em);
        }
    }

    // Delete
    public boolean delete(Long id) {
        EntityManager em = getEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            Book book = em.find(Book.class, id);
            if (book != null) {
                et.begin();
                em.remove(book);
                et.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (et.isActive()) {
				et.rollback();
			}
            e.printStackTrace();
            return false;
        } finally {
            close(em);
        }
    }

    // Search by title (Named Query)
    public List<Book> searchByTitle(String title) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Book.findByTitle");
            query.setParameter("title", "%" + title + "%");
            return query.getResultList();
        } finally {
            close(em);
        }
    }

    // Find available books
    public List<Book> findAvailable() {
        EntityManager em = getEntityManager();
        try {
            return em.createNamedQuery("Book.findAvailable", Book.class)
                    .getResultList();
        } finally {
            close(em);
        }
    }

    // Count total books
    public Long countTotal() {
        EntityManager em = getEntityManager();
        try {
            return em.createNamedQuery("Book.countTotal", Long.class)
                    .getSingleResult();
        } finally {
            close(em);
        }
    }
}