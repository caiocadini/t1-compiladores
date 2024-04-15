lexer grammar LaLexer;


/* PALAVRAS CHAVE */
//Algoritmo
ALGORITMO: 'algoritmo';
FIM_ALGORITMO: 'fim_algoritmo';
//Tipos de dados
LIT : 'literal';
INT: 'inteiro';
REAL: 'real';
LOG: 'logico';
REG: 'registro';
FIM_REG: 'fim_registro';
VAR: 'var';
CONST: 'constante';

//Booleanos
VERDADEIRO: 'verdadeiro';
FALSO: 'falso';

//Ponteiros e Vetores
ENDERECO: '^';
PONTEIRO: '&';
PONTO: '.';
ABRE_VETOR: '[';
FECHA_VETOR: ']';


//Delimitadores
DELIM    :   ':'
    ;
ABREPAR :   '('
    ;
FECHAPAR:   ')'
    ;
COMMA: ',';

//Comandos
CMD_LEIA: 'leia';
CMD_ESCREVA: 'escreva';
CMD_SE : 'se';
CMD_FIMSE: 'fim_se';
CMD_SENAO: 'senao';
CMD_ENTAO: 'entao';
CMD_CASO: 'caso';
CMD_FIMCASO: 'fim_caso';
CMD_PARA: 'para';
CMD_FIMPARA: 'fim_para';
CMD_ENQUANTO: 'enquanto';
CMD_FIMENQUANTO:'fim_enquanto';
CMD_FACA: 'faca';
CMD_ATE: 'ate';
CMD_SEJA: 'seja';
CMD_ATIBUICAO: '<-';
CMD_RETORNE: 'retorne';
CMD_DECLARE: 'declare';
CMD_TIPO: 'tipo';
/*PROCEDIMENTOS E FUNÇÕES */
PROCEDIMENTO: 'procedimento';
FIM_PROCEDIMENTO: 'fim_procedimento';
FUNCAO: 'funcao';
FIM_FUNCAO: 'fim_funcao';
/* OPERADORES */
INTERVALO: '..';
//Operadores Aritméticos
OPARIT_SOMA    :   '+'
    ;
OPARIT_SUB: '-';
OPARIT_MULT : '*';
OPARIT_DIV : '/';
OPARIT_RESTO: '%';
//Operadores Relacionais
OPREL_MENOR: '<';
OPREL_MAIOR: '>';
OPREL_IGUAL: '=';
OPREL_DIFER: '<>';
OPREL_MAIORIGUAL:'>=';
OPREL_MENORIGUAL:'<=';
//Operadores Lógicos
OPLOG_E: 'e';
OPLOG_OU: 'ou';
OPLOG_NAO: 'nao';

/* VALORES E VARIÁVEIS */
NUM_INT    : ('0'..'9')+
    ;
NUM_REAL    : ('0'..'9')+ ('.' ('0'..'9')+)?
    ;
//Variavel
IDENT : ('a'..'z'|'A'..'Z') ('_' | 'a'..'z'|'A'..'Z'|'0'..'9')*
     ;
//String
CADEIA    : '"' ( ~('\n') )*? '"'
;
//Pular na leitura quando encontrar comentário, espaço em branco, quebra de linha, tabulação, não quebramento da linha
COMENTARIO: '{' ( ~('\n') )*? '}' {skip();}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {skip();}
    ;
/* ERROS */
CADEIA_LITERAL_NAO_FECHADA   : '"' ( ~('\n'))*?;
COMENTARIO_NAO_FECHADO: '{' ( ~('\n') )*? ;
SIMBOLO_NAO_ENCONTRADO: .;
