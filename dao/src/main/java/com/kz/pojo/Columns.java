package com.kz.pojo;

public class Columns {
    Integer id;
    String name;
    String Englishname;
    int dispaly;
    Integer sub;

    @Override
    public String toString() {
        return "Columns{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", Englishname='" + Englishname + '\'' +
                ", dispaly=" + dispaly +
                ", sub=" + sub +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEnglishname() {
        return Englishname;
    }

    public void setEnglishname(String englishname) {
        Englishname = englishname;
    }

    public int getDispaly() {
        return dispaly;
    }

    public void setDispaly(int dispaly) {
        this.dispaly = dispaly;
    }

    public Integer getSub() {
        return sub;
    }

    public void setSub(Integer sub) {
        this.sub = sub;
    }
}
