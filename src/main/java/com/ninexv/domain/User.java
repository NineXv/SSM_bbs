package com.ninexv.domain;


public class User {
    private String id;
    private String username;
    private String password;
    private String company;
    private String job;
    private int active;
    private String resume;
    private String Email;
    private String role;
    private String rkey;

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", company='" + company + '\'' +
                ", job='" + job + '\'' +
                ", active=" + active +
                ", resume='" + resume + '\'' +
                ", Email='" + Email + '\'' +
                ", role='" + role + '\'' +
                ", rkey='" + rkey + '\'' +
                '}';
    }

    public String getRkey() {
        return rkey;
    }

    public void setRkey(String rkey) {
        this.rkey = rkey;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getResume() {
        return resume;
    }

    public void setResume(String resume) {
        this.resume = resume;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getId() {
        return id;
    }

    public void setId(String rid) {
        this.id = rid;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }
}
