package com.ninexv.domain;

public class RootKey {
    private int id;
    private String rkey;

    @Override
    public String toString() {
        return "rootKey{" +
                "id=" + id +
                ", rkey='" + rkey + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRkey() {
        return rkey;
    }

    public void setRkey(String rkey) {
        this.rkey = rkey;
    }
}
