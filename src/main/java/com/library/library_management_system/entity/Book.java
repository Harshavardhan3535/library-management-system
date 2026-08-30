package com.library.library_management_system.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

@Entity
@Table(name = "books")
@NamedQueries({
    @NamedQuery(name = "Book.findByTitle",
                query = "SELECT b FROM Book b WHERE b.title LIKE :title"),
    @NamedQuery(name = "Book.findAvailable",
                query = "SELECT b FROM Book b WHERE b.available = true"),
    @NamedQuery(name = "Book.countTotal",
                query = "SELECT COUNT(b) FROM Book b")
})
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title;

    @Column(unique = true)
    private String isbn;

    private Integer year;
    private Double price;
    private Boolean available = true;

    // ✅ CORRECT: Only ONE @ManyToOne with @JoinColumn
    @ManyToOne
    @JoinColumn(name = "author_id")
    private Author author;

    // ✅ CORRECT: Only ONE @ManyToOne with @JoinColumn
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    // Constructors
    public Book() {}

    public Book(String title, String isbn, Integer year, Double price) {
        this.title = title;
        this.isbn = isbn;
        this.year = year;
        this.price = price;
        this.available = true;
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public Integer getYear() { return year; }
    public void setYear(Integer year) { this.year = year; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public Boolean getAvailable() { return available; }
    public void setAvailable(Boolean available) { this.available = available; }

    public Author getAuthor() { return author; }
    public void setAuthor(Author author) { this.author = author; }

    public Category getCategory() { return category; }
    public void setCategory(Category category) { this.category = category; }
}