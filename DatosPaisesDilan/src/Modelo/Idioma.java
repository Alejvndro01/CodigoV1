package Modelo;

public class Idioma {
    private int IdIdioma;
    private String nombreIdioma;
    private String CodigoPaIdioma;
    private int oficialIdioma;

    public Idioma() {
    }

    public Idioma(int id, String nombre, int oficial , String codigoP ) {
        this.IdIdioma = id;
        this.nombreIdioma = nombre;
        this.CodigoPaIdioma = codigoP;
        this.oficialIdioma = oficial;
    }

    public int getIdIdio() {
        return IdIdioma;
    }

    public void setIdIdio(int IdIdio) {
        this.IdIdioma = IdIdio;
    }

    public String getNombre() {
        return nombreIdioma;
    }

    public void setNombre(String nombre) {
        this.nombreIdioma = nombre;
    }

    public String getCodigoP() {
        return CodigoPaIdioma;
    }

    public void setCodigoP(String CodigoP) {
        this.CodigoPaIdioma = CodigoP;
    }

    public int getOficial() {
        return oficialIdioma;
    }

    public void setOficial(int oficial) {
        this.oficialIdioma = oficial;
    }
}
