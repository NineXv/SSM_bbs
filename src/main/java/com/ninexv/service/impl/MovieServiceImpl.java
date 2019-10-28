package com.ninexv.service.impl;

import com.ninexv.dao.MovieDao;
import com.ninexv.domain.Movie;
import com.ninexv.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MovieService")
public class MovieServiceImpl implements MovieService {

    @Autowired
    MovieDao movieDao;

    @Override
    public void addMovie(Movie movie) {
        movieDao.addMovie(movie);
    }
}
