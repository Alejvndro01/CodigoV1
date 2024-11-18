package Modelo;

public class Ciudad {
    private String codigoCiudad;
    private String nombreCiudad;
    private int poblacionCiudad;
    private int IDCiudad;

    public Ciudad() {
    }

    public Ciudad(int idc,String nombrec, int poblacionc, String codigoc) {
        this.nombreCiudad = nombrec;
        this.poblacionCiudad = poblacionc;
        this.codigoCiudad = codigoc;
        this.IDCiudad = idc; 
    }

    public String getCodigoC() {
        return codigoCiudad;
    }

    public void setCodigoC(String codigoC) {
        this.codigoCiudad = codigoC;
    }

    public String getNombreC() {
        return nombreCiudad;
    }

    public void setNombreC(String nombreC) {
        this.nombreCiudad = nombreC;
    }

    public int getPoblacionC() {
        return poblacionCiudad;
    }

    public void setPoblacionC(int poblacionC) {
        this.poblacionCiudad = poblacionC;
    }

    public int getIDC() {
        return IDCiudad;
    }

    public void setIDC(int IDC) {
        this.IDCiudad = IDC;
    }

    
}

