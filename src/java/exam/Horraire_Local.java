/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exam;

import java.sql.Timestamp;

/**
 *
 * @author Janah
 */
public class Horraire_Local {
    private int id;
    private Timestamp date_debut,date_fin;
    private boolean supervise;

    public Horraire_Local(int id, Timestamp date_debut, Timestamp date_fin, boolean supervise) {
        this.id = id;
        this.date_debut = date_debut;
        this.date_fin = date_fin;
        this.supervise = supervise;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDate_debut() {
        return date_debut;
    }

    public void setDate_debut(Timestamp date_debut) {
        this.date_debut = date_debut;
    }

    public Timestamp getDate_fin() {
        return date_fin;
    }

    public void setDate_fin(Timestamp date_fin) {
        this.date_fin = date_fin;
    }

    public boolean isSupervise() {
        return supervise;
    }

    public void setSupervise(boolean supervise) {
        this.supervise = supervise;
    }
    
}
