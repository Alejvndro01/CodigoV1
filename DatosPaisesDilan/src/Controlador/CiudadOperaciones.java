package Controlador;

import Modelo.Conexion;
import Modelo.Ciudad;
import Vista.Ventana;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class CiudadOperaciones {
    PreparedStatement ps;
    ResultSet rs;
    Connection con;
    Conexion conectar = new Conexion();
    Ciudad c = new Ciudad();
    Ventana vista = new Ventana();
    
   public int agregarCiudad(Ciudad ciudad) {  
        int r=0;
        String sql="insert into ciudad(nombreCiudad, poblacionCiudad, codigoPais)values(?,?,?)";
        try{
            con = conectar.getConnection();
            ps = con.prepareStatement(sql);      
            ps.setString(1,ciudad.getNombreC());
            ps.setInt(2 ,ciudad.getPoblacionC());
            ps.setString(3,ciudad.getCodigoC());
            r=ps.executeUpdate();    
            
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
            }catch(Exception e)
            {
                  JOptionPane.showMessageDialog(null, "Error: " + e.getMessage());
            }
        return r;
    }
   
    public int modificarCiudad(Ciudad ciudad) {
        int r = 0;
        String sql = "UPDATE ciudad SET nombreCiudad = ?, poblacionCiudad = ?, codigoPais = ? WHERE idCiudad = ?";
        try {
            con = conectar.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ciudad.getNombreC());
            ps.setInt(2, ciudad.getPoblacionC());
            ps.setString(3, ciudad.getCodigoC());
            ps.setInt(4, ciudad.getIDC());
            r = ps.executeUpdate();
            if (r == 1) {
                JOptionPane.showMessageDialog(null, "Ciudad modificada con éxito.", "Éxito", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, "No se encontró una ciudad con el ID especificado.", "Error", JOptionPane.WARNING_MESSAGE);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error al modificar la ciudad: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        } finally {
            try {
                if (con != null) con.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Error al cerrar la conexión: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }
        return r;
    }
    
    public int eliminarCiudad(String nombre){
        int r=0;
        String sql = "Delete From ciudad "
                + "where nombreCiudad = ?";
        try{
        con = conectar.getConnection();
        ps = con.prepareStatement(sql);  
        ps.setString(1, nombre);
        r = ps.executeUpdate();
        if(r == 1){
            return 1; 
        }
        else{
            return 0; 
        }
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, "Error al eliminar el país: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        return r;
    }
    
    public int eliminarPorCodigoPais(String codigoPais) {
    int r = 0;
    String sql = "DELETE FROM ciudad WHERE codigoPais = ?";
    try {
        con = conectar.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, codigoPais);
        r = ps.executeUpdate();
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, "Error al eliminar ciudades: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
    }
    return r;
}
    
    public List<Ciudad> ConsultarCiudad(String nombre){
        List<Ciudad> ciudades = new ArrayList<>();
        String sql = "SELECT * FROM ciudad WHERE nombreCiudad = ?";
            try {
                con = conectar.getConnection();
                ps = con.prepareStatement(sql);
                ps.setString(1, nombre);
                rs = ps.executeQuery();
                
                    while (rs.next()) {
                        Ciudad ciudad = new Ciudad();
                        ciudad.setIDC(rs.getInt("idCiudad"));
                        ciudad.setNombreC(rs.getString("nombreCiudad"));
                        ciudad.setPoblacionC(rs.getInt("poblacionCiudad"));
                        ciudad.setCodigoC(rs.getString("codigoPais"));

                        ciudades.add(ciudad);
                    }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Error al consultar el país: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
            return ciudades;     
    }
}

