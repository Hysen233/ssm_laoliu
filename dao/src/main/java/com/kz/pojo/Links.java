package com.kz.pojo;

import java.util.Date;

public class Links {
    int id;
    String name;
    String url;
    String desc;
    String contactperson;
    String qq;
    int dispaly;
    Date data;

    @Override
    public String toString() {
        return "Links{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", desc='" + desc + '\'' +
                ", contactperson='" + contactperson + '\'' +
                ", qq='" + qq + '\'' +
                ", dispaly=" + dispaly +
                ", data=" + data +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public int getDispaly() {
        return dispaly;
    }

    public void setDispaly(int dispaly) {
        this.dispaly = dispaly;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
