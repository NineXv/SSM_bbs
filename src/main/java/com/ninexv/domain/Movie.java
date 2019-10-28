package com.ninexv.domain;

public class Movie {
    private int mid;
    private String name;
    private String country;
    private String director;
    private String actor;
    private String type;
    private String score;

    @Override
    public String toString() {
        return "Movie{" +
                "mid=" + mid +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", director='" + director + '\'' +
                ", actor='" + actor + '\'' +
                ", type='" + type + '\'' +
                ", score='" + score + '\'' +
                '}';
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
