package com.library.library_management_system.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "loans")
public class Loan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "book_id", nullable = false)
    private Book book;
    
    @ManyToOne
    @JoinColumn(name = "member_id", nullable = false)
    private Member member;
    
    private LocalDate issueDate = LocalDate.now();
    private LocalDate dueDate;
    private LocalDate returnDate;
    private Double fine;
    private String status = "ISSUED";  // ← ADD THIS!
    
    public Loan() {}
    
    public Loan(Book book, Member member, LocalDate dueDate) {
        this.book = book;
        this.member = member;
        this.dueDate = dueDate;
        this.issueDate = LocalDate.now();
        this.status = "ISSUED";
    }
    
    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public Book getBook() { return book; }
    public void setBook(Book book) { this.book = book; }
    
    public Member getMember() { return member; }
    public void setMember(Member member) { this.member = member; }
    
    public LocalDate getIssueDate() { return issueDate; }
    public void setIssueDate(LocalDate issueDate) { this.issueDate = issueDate; }
    
    public LocalDate getDueDate() { return dueDate; }
    public void setDueDate(LocalDate dueDate) { this.dueDate = dueDate; }
    
    public LocalDate getReturnDate() { return returnDate; }
    public void setReturnDate(LocalDate returnDate) { this.returnDate = returnDate; }
    
    public Double getFine() { return fine; }
    public void setFine(Double fine) { this.fine = fine; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }  // ← ADD THIS!
}