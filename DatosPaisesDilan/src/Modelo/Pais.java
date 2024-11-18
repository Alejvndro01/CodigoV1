package Modelo;

public class Pais {
    
    //Características --> Atributos
    private String codigo;
    private String nombre;
    private String continente;
    private int poblacion;
    private int tipoGobierno;
    
    //Constructores
    public Pais(){
    }

    public Pais(String codigo, String nombre, String continente, int poblacion, int tipoGobierno) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.continente = continente;
        this.poblacion = poblacion;
        this.tipoGobierno = tipoGobierno;
    }
    

    
    //Accesadores y mutadores.
    
    public String getCodigo(){
        return codigo;
    }
    
    public void setCodigo(String code){
        this.codigo = code;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContinente() {
        return continente;
    }

    public void setContinente(String continente) {
        this.continente = continente;
    }

    public int getPoblacion() {
        return poblacion;
    }

    public void setPoblacion(int poblacion) {
        this.poblacion = poblacion;
    }

    public int getTipoGobierno() {
        return tipoGobierno;
    }

    public void setTipoGobierno(int tipoGobierno) {
        this.tipoGobierno = tipoGobierno;
    }
    
}
    

   