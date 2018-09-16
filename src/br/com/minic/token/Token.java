package br.com.minic.token;

/**
 * 
 * @author Hilario Tomaz Alves de Oliveira
 *
 */

public class Token {

  // Atributos

  private String tipo;
  private int linha;
  private int coluna;
  private String lexema;

  // Construtor

  public Token(String tipo, int linha, int coluna, String lexema) {

    this.setTipo( tipo );
    this.setLinha( linha );
    this.setColuna( coluna );
    this.setLexema( lexema );
        
  }

  
  // Métodos
  
  public String getTipo() {
	
    return tipo;

  }
  
  public void setTipo(String tipo) {
	
    this.tipo = tipo;
	
  }

  public int getLinha() {
	
    return linha;
	
  }

  public void setLinha(int linha) {
	
    this.linha = linha;
	
  }

  public int getColuna() {
	
    return coluna;
	
  }

  public void setColuna(int coluna) {
	
    this.coluna = coluna;

  }
  
  public String getLexema() {
	
    return lexema;
	
  }
 
  public void setLexema(String lexema) {
	
    this.lexema = lexema;
	
  }

  @Override
	
  public String toString() {
	
    StringBuilder stringBuilder = new StringBuilder();
    
    stringBuilder.append( "<" );
    
    stringBuilder.append( this.tipo );
    stringBuilder.append( ", " );
    
    stringBuilder.append( this.lexema );
    stringBuilder.append( ", " );
    
    stringBuilder.append( this.linha );
    stringBuilder.append( ", " );
    
    stringBuilder.append( this.coluna );
    stringBuilder.append( ">" );
    
	return stringBuilder.toString();
	
  }
  
}

