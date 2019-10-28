package com.ninexv.controller;

import com.ninexv.domain.Movie;
import com.ninexv.service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    MovieService movieService;

    @RequestMapping("/addMovie")
    @ResponseBody
    public String addMovie(@RequestBody Movie movie){
        System.out.println(movie);
        movieService.addMovie(movie);
        return "1";
    }
}
