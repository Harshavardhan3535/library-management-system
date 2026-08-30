# 📚 Library Management System

A complete Library Management System built with **Hibernate + Servlets + JSP + PostgreSQL**.

## 📸 Screenshots

| Homepage | Book List |
|----------|-----------|
| ![Homepage](screenshots/homepage.png) | ![Book List](screenshots/book-list.png) |

| Issue Book | Search Results |
|------------|----------------|
| ![Issue Book](screenshots/issue-book.png) | ![Search](screenshots/search.png) |

## ✨ Features

- ✅ **Book Management**: Add, View, Update, Delete books
- ✅ **Member Management**: Add and View members
- ✅ **Loan Management**: Issue and Return books with fine calculation
- ✅ **Search**: Search books by title or author (case insensitive)
- ✅ **Professional UI**: Clean, modern interface

## 🛠️ Tech Stack

### Frontend
- **JSP** (Java Server Pages)
- **HTML5** & **CSS3**
- **JavaScript**
- **JSTL**

### Backend
- **Java 17**
- **Servlets**
- **Hibernate** (ORM)
- **JDBC**

### Database
- **PostgreSQL**

### Tools
- **Apache Tomcat 10**
- **Maven**
- **Git & GitHub**

## 📊 Database Schema

- **books** (id, title, isbn, year, price, author_id, category_id, available)
- **authors** (id, name, biography)
- **categories** (id, name, description)
- **members** (id, name, email, phone, active)
- **loans** (id, book_id, member_id, issue_date, due_date, return_date, fine, status)

## 🏗️ Architecture

![Architecture](screenshots/architecture.png)

## 🔧 Setup Instructions

### Prerequisites
- Java 17+
- PostgreSQL
- Apache Tomcat 10
- Maven

### 1. Clone Repository
```bash
git clone https://github.com/Harshavardhan3535/library-management-system.git
cd library-management-system