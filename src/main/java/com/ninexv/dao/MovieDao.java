package com.ninexv.dao;

import com.ninexv.domain.Movie;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public interface MovieDao {

    @Insert("insert into movie (name,country,director,actor,type) values (#{name},#{country},#{director},#{actor},#{type})")
    public void addMovie(Movie movie);
}
