/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Janah
 */
public class DB_Worker {

    private Connection Connect_Db;
    private ResultSet R1, R2;

    public DB_Worker() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // important
            Connect_Db = DriverManager.getConnection("jdbc:mysql://localhost:3306/examfinal", "root", "");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // LOGIN ETUDIANT
    public Etudiant ConnexionEtudiant(String username, String password) {
        Etudiant e = null;
        try {
            PreparedStatement LoginEtudiant = Connect_Db.prepareStatement("select * from etudiant where username = ? and password = ?");
            LoginEtudiant.setString(1, username);
            LoginEtudiant.setString(2, password);
            R1 = LoginEtudiant.executeQuery();
            while (R1.next()) {
                e = new Etudiant(R1.getInt(1), R1.getString(2), R1.getString(3), R1.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    // LOGIN PROF
    public Prof ConnexionProf(String username, String password) {
        Prof p = null;
        try {
            PreparedStatement LoginProf = Connect_Db.prepareStatement("select * from prof where username = ? and password = ?");
            LoginProf.setString(1, username);
            LoginProf.setString(2, password);
            R1 = LoginProf.executeQuery();
            while (R1.next()) {
                p = new Prof(R1.getInt(1), R1.getString(2), R1.getString(3), R1.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }

    // PLAGE D'HORRAIRE
    /*AJOUTER*/
    public int AjouterHorraire_local(bloc_horraire hl) {
        int success = 0;
        try {
            Statement st = Connect_Db.createStatement();
            success = st.executeUpdate("INSERT INTO bloc_horraire (Etudiant_id, date_debut, date_fin) VALUES ('" + hl.getId_etudiant() + "','" + hl.getDate_debut() + "','" + hl.getDate_fin() + "'");
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }

        return success;
    }

    /*SELECT*/
    public ArrayList<bloc_horraire> GetBlocByEtudiant(int idEtudiant) {
        ArrayList<bloc_horraire> AllBloc = new ArrayList<bloc_horraire>();
        try {
            PreparedStatement St_allBloc = Connect_Db.prepareStatement("select * from bloc_horraire where Etudiant_id =?");
            St_allBloc.setInt(1, idEtudiant);
            R1 = St_allBloc.executeQuery();
            while (R1.next()) {
                AllBloc.add(new bloc_horraire(R1.getInt(1), R1.getInt(2), R1.getTimestamp(3), R1.getTimestamp(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return AllBloc;
    }

    /*MODIFIER*/
    public int ModifierBloc(bloc_horraire bl) {
        int e = 0;
        try {
            PreparedStatement UpdateBloc = Connect_Db.prepareStatement("Update bloc_horraire set date_debut=? and date_fin=? where id=" + bl.getId() + "and Etudiant_id=" + bl.getId_etudiant());
            UpdateBloc.setTimestamp(1, bl.getDate_debut());
            UpdateBloc.setTimestamp(2, bl.getDate_fin());
            e = UpdateBloc.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;
    }

    /*SUPPRIMMER*/
    public int DeleteBloc(int id_block) {
        int success = 0;
        try {
            Statement st = Connect_Db.createStatement();
            success = st.executeUpdate("delete from bloc_horraire where id="+id_block);
        } catch (SQLException ex) {
            Logger.getLogger(DB_Worker.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
  
}
