package com.ninexv.domain;

import java.util.Date;

public class Post {
    private int pid;
    private int mid;
    private String id;
    private String mname;
    private String pname;
    private String pcontent;
    private Date pdate;
    private int nice;
    private String movieName;

    @Override
    public String toString() {
        return "Post{" +
                "pid=" + pid +
                ", mid=" + mid +
                ", id='" + id + '\'' +
                ", mname='" + mname + '\'' +
                ", pname='" + pname + '\'' +
                ", pcontent='" + pcontent + '\'' +
                ", pdate=" + pdate +
                ", nice=" + nice +
                ", movieName='" + movieName + '\'' +
                '}';
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public int getNice() {
        return nice;
    }

    public void setNice(int nice) {
        this.nice = nice;
    }

    public Date getPdate() {
        return pdate;
    }

    public void setPdate(Date pdate) {
        this.pdate = pdate;
    }



    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
