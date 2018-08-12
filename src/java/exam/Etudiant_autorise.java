/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exam;

/**
 *
 * @author Janah
 */
public class Etudiant_autorise {
    private int id,id_etudiant,id_horraire_local;

    public Etudiant_autorise(int id, int id_etudiant, int id_horraire_local) {
        this.id = id;
        this.id_etudiant = id_etudiant;
        this.id_horraire_local = id_horraire_local;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_etudiant() {
        return id_etudiant;
    }

    public void setId_etudiant(int id_etudiant) {
        this.id_etudiant = id_etudiant;
    }

    public int getId_horraire_local() {
        return id_horraire_local;
    }

    public void setId_horraire_local(int id_horraire_local) {
        this.id_horraire_local = id_horraire_local;
    }
    
}
