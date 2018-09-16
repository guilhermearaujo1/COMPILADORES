
package br.com.minic.analisadorlexico;

import java.io.FileReader;
import java.io.IOException;

import br.com.minic.token.Token;

public class AnalisadorLexicoApp {

	public static void main(String[] args) {

		FileReader fileToReader = null;
		
		try {
		
		  fileToReader = new FileReader( "programas/ProgramaTeste.txt" );
		
		  AnalisadorLexico analisadorLexico = new AnalisadorLexico( fileToReader );
		    
		  Token token = analisadorLexico.yylex();
		
		  while( token != null ) { 
			  
		    System.out.println( token );
		    token = analisadorLexico.yylex();
		    
		  }
		  fileToReader.close();
		  
		}catch (IOException e) {
		  e.printStackTrace();
		}
		
	  }
  
}
