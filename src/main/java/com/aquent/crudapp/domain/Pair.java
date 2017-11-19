package com.aquent.crudapp.domain;

public class Pair{
    String str;
    boolean bool;

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    public boolean isBool() {
        return bool;
    }

    public void setBool(boolean bool) {
        this.bool = bool;
    }

    public Pair(String str, boolean bool){
        this.str = str;
        this.bool = bool;
    }
}