/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;


public class SubmitAssign {

    int id;
    String cmt;
    int student_id;
    String linkSource;
    int assign_id;
    String submittime;

    public SubmitAssign(int id, String cmt, int student_id, String linkSource, int assign_id, String submittime) {
        this.id = id;
        this.cmt = cmt;
        this.student_id = student_id;
        this.linkSource = linkSource;
        this.assign_id = assign_id;
        this.submittime = submittime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getLinkSource() {
        return linkSource;
    }

    public void setLinkSource(String linkSource) {
        this.linkSource = linkSource;
    }

    public int getAssign_id() {
        return assign_id;
    }

    public void setAssign_id(int assign_id) {
        this.assign_id = assign_id;
    }

    public String getSubmittime() {
        return submittime;
    }

    public void setSubmittime(String submittime) {
        this.submittime = submittime;
    }
    
    

}
