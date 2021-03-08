%token NOMBRE PLUS MOINS FOIS GPAREN DPAREN PT_VIRG
%left PLUS MOINS
%left FOIS
%nonassoc UMOINS

%type <int> main expression
%start main
%%

main:
    expression PT_VIRG                {}
    ;
expression:
    expression PLUS expression    { $1+$3}
    | expression MOINS expression   { $1-$3 }
    | expression FOIS expression    { $1*$3 }
    | GPAREN expression DPAREN      { $2 }
    | MOINS expression %prec UMOINS { -$2 }
    | NOMBRE                        { $1 }
    ;
