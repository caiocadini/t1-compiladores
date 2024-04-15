package br.ufscar.dc.compiladores.novo.la.lexico;


import java.io.IOException;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.Token;
import  java.io.PrintWriter;

public class App {

    public static void main(String[] args) {
        //Obter o arquivo onde se escreve o retorno do analisador
        String arquivoSaida = args[1];
        try {
            //
            CharStream cs = CharStreams.fromFileName(args[0]);
            //Instanciamento do Analisador Léxico para a Linguagem LA definido em LaLexer.g4 usando antlr4
            LaLexer lex = new LaLexer(cs);
            Token t = null;
            //Instanciamento para escrever a saída do Analisador no arquivo de saída
            PrintWriter pw = new PrintWriter(arquivoSaida);
            //Enquanto não chegamos no final do arquivo, lemos token a token pelo LALexer e pegamos seu tipo
            while ((t = lex.nextToken()).getType() != Token.EOF) {
                //Definimos o nome do tipo do token a partir do número retornado em getType
                String nomeToken = LaLexer.VOCABULARY.getDisplayName(t.getType());
                //Foi criado um Token específico para lindar com situações onde o símbolo não foi encontrado
                if(nomeToken.equals("SIMBOLO_NAO_ENCONTRADO")) {
                    //Escreve onde ocorreu o erro(linha) no arquivo de saída e sai do loop
                    pw.println("Linha "+t.getLine()+": "+t.getText()+" - simbolo nao identificado");
                    break;
                //Foi criado um Token para lidar com situações onde o comentário não foi fechado
                } else if(nomeToken.equals("COMENTARIO_NAO_FECHADO")) {
                    pw.println("Linha "+t.getLine()+": comentario nao fechado");
                    break;
                //Erro para quando uma string (cadeia literal) não foi fechada
                } else if (nomeToken.equals("CADEIA_LITERAL_NAO_FECHADA")){
                    pw.println("Linha "+t.getLine()+": cadeia literal nao fechada");
                    break;
                //Situações restantes, ou seja, o token e seu tipo foi pego sem qualquer erro
                } else {
                    pw.println("<'" + t.getText() + "'," + nomeToken + ">");
                }
                //Garantir a escrita no arquivo
                pw.flush();
            }
            //Fechar o stream
            pw.close();
        //catch para garantir tratamento de erro
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}