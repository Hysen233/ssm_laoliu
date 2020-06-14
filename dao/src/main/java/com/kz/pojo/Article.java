package com.kz.pojo;

public class Article {
    int id;
    String title;
    String content;
    int columnsid;
    int topping;
    int dispaly;
    Columns columns;

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", columnsid=" + columnsid +
                ", topping=" + topping +
                ", dispaly=" + dispaly +
                ", columns=" + columns +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getColumnsid() {
        return columnsid;
    }

    public void setColumnsid(int columnsid) {
        this.columnsid = columnsid;
    }

    public int getTopping() {
        return topping;
    }

    public void setTopping(int topping) {
        this.topping = topping;
    }

    public int getDispaly() {
        return dispaly;
    }

    public void setDispaly(int dispaly) {
        this.dispaly = dispaly;
    }

    public Columns getColumns() {
        return columns;
    }

    public void setColumns(Columns columns) {
        this.columns = columns;
    }
}
