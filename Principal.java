package Ventanas;
import javax.swing.table.DefaultTableModel;
import dba.Mysql;
import java.sql.Array.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;
/**
 *
 * @author Amadeo
 */
public class Principal extends javax.swing.JFrame {
DefaultTableModel model;
Connection conn;
Statement sent;
    /**
     * Creates new form Principal
     */
    public Principal() {
        initComponents();
        conn=Mysql.getConnection();
        Habilitar();
    }
    
    void Habilitar(){
       jTextField1.setEditable(true);
       jTextField1.requestFocus();
    }

private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        try {
       
        String checkSql = "SELECT * FROM lista WHERE Nombre = ?";
        PreparedStatement checkPs = conn.prepareStatement(checkSql);
        checkPs.setString(1, jTextField1.getText());
        ResultSet rs = checkPs.executeQuery();

        
        if(rs.next()){
            JOptionPane.showMessageDialog(null, "El equipo ya está registrado, registre un nuevo equipo");
        } else {
            
        String sql = "insert into lista (Nombre) values(?)";
        PreparedStatement ps = conn.prepareCall(sql);
        ps.setString(1, jTextField1.getText());

        int n = ps.executeUpdate();
        if(n > 0){
            JOptionPane.showMessageDialog(null, "Equipo registrado correctamente");
        }
    }

    } catch (Exception e) {
    JOptionPane.showMessageDialog(null,"Error: " + e.getMessage());
    }

    }

   private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        
        try {
            conn = Mysql.getConnection();
            String[]titulos = {"Equipos"}; 
            String sql = "select Nombre from lista";
            model = new DefaultTableModel(null, titulos);
            sent= conn.createStatement();
            ResultSet rs=sent.executeQuery(sql);
            
            String[]fila = new String[1];
            while(rs.next()){
                fila[0]=rs.getString("Nombre");
                
                model.addRow(fila);
            }
            jTable1.setModel(model);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    } 

      public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Principal().setVisible(true);
            }
        });
    }


  
