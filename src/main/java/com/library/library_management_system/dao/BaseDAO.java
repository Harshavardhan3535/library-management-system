package com.library.library_management_system.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BaseDAO {
    protected static EntityManagerFactory emf =
        Persistence.createEntityManagerFactory("library");

    protected EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    protected void close(EntityManager em) {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}