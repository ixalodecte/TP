%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG
%type <unit> main expression terme facteur
%left PLUS MOINS
%left FOIS
%nonassoc UMOINS
%start main
%%

main:
    expression EOL                {}
    ;
expression:
    expression PLUS expression    {}
    | expression MOINS expression   {}
    | expression FOIS expression    {}
    | expression expression     {}
    | GPAREN expression DPAREN      {}
    | MOINS expression %prec UMOINS {}
    | NOMBRE                        {}
    ;
