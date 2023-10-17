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
