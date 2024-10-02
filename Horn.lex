%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

struct Nodo {
    char* caracter;
    int marcado;
    struct Nodo* siguiente;
};

struct Nodo* crearNodo(char*);
struct Nodo* insertar(struct Nodo*, char*);
void mostrar(struct Nodo*);
void procesoexpresion(struct Nodo*, struct Nodo*);
void limpiar_cadena(struct Nodo*);
struct Nodo* lista_cadena = NULL;
struct Nodo* lista_atomos = NULL;
struct Nodo* lista_marcados = NULL;
int cuentapeso = 0;
%}

%option noyywrap

tautologia "\\top"
contradiccion "\\bot"
conjuncion "\\wedge"
implica "\\rightarrow"
abre_parentesis [(]
cierra_parentesis [)]
atomo [a-z][0-9]*
espacio [" "]
salto_de_linea [ \t\n]  
peso "$"
%%

{tautologia} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{contradiccion} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{conjuncion} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{implica} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{abre_parentesis} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{atomo} {{
    	lista_atomos = insertar(lista_atomos, yytext);
    	lista_cadena = insertar(lista_cadena, yytext);
}}
{cierra_parentesis} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{espacio} {{
	lista_cadena = insertar(lista_cadena, yytext);
}}
{peso} {
	cuentapeso = cuentapeso + 1;
	if(cuentapeso<=2){
		lista_cadena = insertar(lista_cadena, yytext);
	}
	if(cuentapeso==2){
		procesoexpresion(lista_cadena, lista_atomos);
		printf("%s", "\n");
		limpiar_cadena(lista_cadena);
		lista_cadena = NULL;
		limpiar_cadena(lista_atomos);
		lista_atomos = NULL;
		limpiar_cadena(lista_marcados);
		lista_marcados = NULL;
	}
	if(cuentapeso>2 && cuentapeso%2!=0){
		lista_cadena = insertar(lista_cadena, yytext);
	}
	if(cuentapeso>2 && cuentapeso%2==0){
		lista_cadena = insertar(lista_cadena, yytext);
		procesoexpresion(lista_cadena, lista_atomos);
		limpiar_cadena(lista_cadena);
		lista_cadena = NULL;
		limpiar_cadena(lista_atomos);
		lista_atomos = NULL;
		limpiar_cadena(lista_marcados);
		lista_marcados = NULL;
		printf("%s", "\n");
	}

}
{salto_de_linea} {  }
.   ; 

%%

struct Nodo *crearNodo(char *caracter)//estas funciones auxiliarán las funciones proceso expresion y procesa parentesis.
{
	struct Nodo *nuevoNodo = (struct Nodo *)calloc(1, sizeof(struct Nodo));
	if (nuevoNodo != NULL)
	{
		nuevoNodo->caracter = strdup(caracter);
		nuevoNodo->marcado = 0;
		nuevoNodo->siguiente = NULL;
	}
	return nuevoNodo;
}

struct Nodo* insertar(struct Nodo* lista, char *caracter)
{
	struct Nodo *nuevoNodo = crearNodo(caracter);
	if (lista == NULL)
	{
		return nuevoNodo;
	}
	else
	{
		struct Nodo *temp = lista;
		while (temp->siguiente != NULL)
		{
			temp = temp->siguiente;
		}
		temp->siguiente = nuevoNodo;
		return lista;
	}
}

void mostrar(struct Nodo *lista)
{
	struct Nodo *temp = lista;
	while (temp != NULL)
	{
		printf("%s", temp->caracter);
		temp = temp->siguiente;
	}
}

void limpiar_cadena(struct Nodo *p) {
    struct Nodo *q;
    while (p != NULL) {
        q = p->siguiente;
        free(p->caracter);
        free(p);
        p = q;
    }
}


unsigned int estaen(struct Nodo *lista, char *c)
{
	char *elemento = strdup(c);
	struct Nodo *aux = lista;
	while (aux != NULL)
	{
		if (strcmp(aux->caracter, elemento) == 0)
		{
			return 1;
		}
		aux = aux->siguiente;
	}
	return 0;
}

void cambia_marca(struct Nodo *lista_atomos, char *c)
{
	struct Nodo *aux = lista_atomos;
	char *elemento = strdup(c);
	while (aux != NULL)
	{
		if (strcmp(aux->caracter, elemento) == 0)
		{
			aux->marcado = 1;
		}
		aux = aux->siguiente;
	}
}

unsigned int estamarcado(struct Nodo *atomos, char *c)
{
	struct Nodo *aux = atomos;
	char *elemento = strdup(c);
	while (aux != NULL)
	{
		if (strcmp(aux->caracter, elemento) == 0 && aux->marcado == 1)
		{
			return 1;
		}
		aux = aux->siguiente;
	}
	return 0;
}

char *procesa_parentesis(struct Nodo *lista, struct Nodo *atomos)//procesa los parentesis, asume que los atomos de la izquierda estan marcados y simula el efecto de la tautologia.
{								//Sin embargo, los condicionales verifican si efectivamente estan marcados o no.
	struct Nodo *aux2 = lista;						
	unsigned int pasamos_implicancia = 0;
	unsigned int todosmarcados = 1;
	while (aux2 != NULL)
	{
		if (strcmp(aux2->caracter, "\\rightarrow") != 0 && pasamos_implicancia == 0 && estaen(atomos, aux2->caracter) == 1 && (estamarcado(atomos, aux2->caracter)) == 0)
		{
			todosmarcados = 0;
		}
		if (strcmp(aux2->caracter, "\\rightarrow") == 0)
		{
			pasamos_implicancia = 1;
		}
		if (pasamos_implicancia == 1 && estaen(atomos, aux2->caracter) == 1 && todosmarcados == 1 && estamarcado(atomos, aux2->caracter) == 0)
		{
			cambia_marca(atomos, aux2->caracter);
			return "1";
		}
		if (pasamos_implicancia == 1 && strcmp(aux2->caracter, "\\bot") == 0 && todosmarcados == 1)
		{
			return "2";
		}
		if (strcmp(aux2->caracter, ")") == 0)
		{
			todosmarcados = 1;
			pasamos_implicancia = 0;
		}
		aux2 = aux2->siguiente;
	}
	return "0";
}

void procesoexpresion(struct Nodo *lista, struct Nodo *atomos)
{
	struct Nodo *aux = lista;			 
	struct Nodo *reg_marcaciones = NULL;	// lista que registra si cada parentesis marcó atomo, contradiccion o no marcó nada;		 
	char *semarco = "0";	//elemento que se integrará en reg_marcaciones
	reg_marcaciones = insertar(reg_marcaciones, "1"); // registramos lo que sucede en reg_marcaciones para saber cuando parar.
	while (estaen(reg_marcaciones, "1") == 1)
	{
		semarco = procesa_parentesis(lista, atomos);
		limpiar_cadena(reg_marcaciones);
		reg_marcaciones = NULL;
		reg_marcaciones = insertar(reg_marcaciones, semarco);
		aux = aux->siguiente;
	}
	if (estaen(reg_marcaciones, "2") == 1)
	{
		printf("%s", "insatisfacible");
	}
	else
	{
		printf("%s", "satisfacible");
	}
	limpiar_cadena(reg_marcaciones);
	reg_marcaciones = NULL;
}

int main()
{
	yylex(); 
	return 0;
}

