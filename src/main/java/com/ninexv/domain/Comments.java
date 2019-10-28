package com.ninexv.domain;


import java.util.Date;

public class Comments {
    private String cid;
    private String id;
    private int pid;
    private String name;
    private String content;
    private Date cdate;

    @Override
    public String toString() {
        return "Comments{" +
                "cid=" + cid +
                ", id='" + id + '\'' +
                ", pid=" + pid +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", cdate=" + cdate +
                '}';
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }
}
