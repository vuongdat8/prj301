/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;


public class AssignmentDAO extends DBContext {

    public ArrayList<Course> getCourse() {
        ArrayList<Course> proCate = new ArrayList<>();
        try {
            String sql = "select * from [Course] c join Users u  on c.teacher = u.id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                proCate.add(new Course(rs.getInt(1), rs.getString(2), rs.getString(5)));
            }
        } catch (SQLException e) {
        }
        return proCate;
    }

    public Course getCourseById(String cid) {
        try {
            String sql = "select * from [Course] c join Users u  on c.teacher = u.id where  c.id = " + cid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1), rs.getString(2), rs.getString(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<Assignment> getAllAssignment(String cid) {
        ArrayList<Assignment> proCate = new ArrayList<>();
        try {
            String sql = "select * from [Assignment] where [course_id] = " + cid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                proCate.add(new Assignment(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4),
                                rs.getInt(5), rs.getString(6), rs.getString(7)));
            }
        } catch (SQLException e) {

        }
        return proCate;
    }
//    public ArrayList<SubmitAssign> getAllAssignment(String aid) {
//        ArrayList<SubmitAssign> proCate = new ArrayList<>();
//        try {
//            String sql = "select * from [SubmitAssigment] where [assign_id] =  " + aid;
//            PreparedStatement stm = connection.prepareStatement(sql);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                proCate.add(new SubmitAssign(rs.getInt(1), rs.getString(2),rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6)));
//            }
//        } catch (SQLException e) {
//        }
//        return proCate;
//    }

    public Assignment getAssignmentById(String aid) {

        try {
            String sql = "select * from [Assignment] where id = " + aid;
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new Assignment(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    public SubmitAssign getSubmitAssignById(String aid , int uid) {

        try {
            String sql = "select * from [SubmitAssigment] where [assign_id] = " + aid + " and  [student_id]  = " + uid ;
            System.out.println(sql);
            
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return new SubmitAssign(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getInt(5), rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    public void insertAssigment(String name, String duedate, String desc, String cid, String link, String teacher) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[Assignment]  ([name] ,[duedate],[description] ,[course_id],[linkSource] ,[teacher]) VALUES  (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, duedate);
            ps.setString(3, desc);
            ps.setString(4, cid);
            ps.setString(5, link);
            ps.setString(6, teacher);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void editAssigment(String name, String duedate, String desc, String cid, String link, String teacher, String aid) {
        try {
            PreparedStatement ps = connection.prepareStatement("update [dbo].[Assignment] set [name] = ? ,[duedate]= ? ,[description]= ?  ,[course_id]= ? ,[linkSource]= ?  ,[teacher] = ? \n"
                    + "where id = ?");
            ps.setString(1, name);
            ps.setString(2, duedate);
            ps.setString(3, desc);
            ps.setString(4, cid);
            ps.setString(5, link);
            ps.setString(6, teacher);
            ps.setString(7, aid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteSubmitAssigment(String aid) {
        try {
            PreparedStatement ps = connection.prepareStatement("  delete [SubmitAssigment] where id = ?");
            ps.setString(1, aid);
            ;
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void enrollCOurse(String uid, String cid) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[Enroll]    ([course_id] ,[student_id])   VALUES   (?,?)");
            ps.setString(1, cid);
            ps.setString(2, uid);
            ;
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void submitAssignment(String cmt, int uid, String link, String aid) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO [dbo].[SubmitAssigment]\n"
                    + "           ([cmt]  ,[student_id]    ,[linkSource]  ,[assign_id] ,[submittime])  VALUES (?,?,?,?, getdate())");
            ps.setString(1, cmt);
            ps.setInt(2, uid);
            ps.setString(3, link);
            ps.setString(4, aid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editSubmitAssignment(String cmt, int uid, String link, String aid, String said) {
        try {
            PreparedStatement ps = connection.prepareStatement("Update [dbo].[SubmitAssigment] set\n" +
"   [cmt] =? ,[student_id]  =?    ,[linkSource] =?   ,[assign_id] =?  ,[submittime]  =getdate() where id = "+said);
            ps.setString(1, cmt);
            ps.setInt(2, uid);
            ps.setString(3, link);
            ps.setString(4, aid);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
