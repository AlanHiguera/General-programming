#include<iostream>
#include <cstdlib>
#include <time.h>
#include <cstring>
#include <queue>
using namespace std;

typedef struct Nodo{
    int info;
    string par1;
    string par2;
    struct Nodo *link;
}Nodo;

typedef Nodo *Lista;
    Lista L;

void mostrar(Lista L){
    Lista p = L;
    while(p!=NULL){
        cout<<p->info<<endl;
        p = p->link;
    }
}
template <class T>
class Cola : private queue<T>{
public:
    void agregar(T value){
        queue<T>::push(value);
    }

    T extraer(){
        T temp = queue<T>::front();
        queue<T>::pop();
        return temp;
    }

    bool vacio(){
        return queue<T>::empty();
    }
};
void mostrarPares(Lista L, int primera){
    Lista p = L;
    cout<<"---Par y Peso---"<<endl;
    if(p==NULL){
        cout<<"es nula"<<endl;
    }
    if(primera==0){
        while(p!=NULL){
            cout<<"["<<p->par1<<","<<p->par2<<"]"<<"Peso: "<<p->info<<endl;
            p = p->link;
        }
    }
    else if(primera==1){
        cout<<p->par1;
        while(p!=NULL){
            cout<<"Costo del trayecto "<<"["<<p->par1<<"]: "<<p->info<<endl;
            p = p->link;
        }
    }
}
void mostrarParesConCosto(Lista L, Cola<int> F){
    Lista p = L;
    int elementocola = 0;
    while(p!=NULL){
        elementocola = F.extraer();
        cout<<"Costo del Trayecto "<<"["<<p->par1<<"]: "<<elementocola<<endl;
        p = p->link;
    }
}

void agregarIzq(Lista &L, int e, string pr, string seg){
    Lista p;
    p = new(Nodo);
    p->info = e;
    p->par1 = pr;
    p->par2 = seg;
    p->link = L;
    L = p;
}

int entregaPeso(string a, string b, Lista L){
    Lista p = L;
    while(p!=NULL){
        if(p->par1==a && p->par2==b){
            return p->info;
        }
    p = p->link;
    }
    return -5;
}

void permutations(string str, int i, int n, Lista &Permutaciones){
    if (i == n - 1){
        agregarIzq(Permutaciones,-1, "a"+str+"a", "z");
        cout<<str<<endl;
        return;
    }

    for (int j = i; j < n; j++){
        swap(str[i], str[j]);
        permutations(str, i + 1, n, Permutaciones);
        swap(str[i], str[j]);
    }
}
bool EstaEnCola(Cola<int> F, int e){
    while(!F.vacio()){
        if(F.extraer()==e){
            return true;
        }
    }
    return false;
}
void MenorDeQueue(Cola<int> F, Lista Permutaciones){
    Lista p = Permutaciones;
    int elementocolaBase = -1;
    int elementocola = 0, contador = 1;
    Cola<int> Menores;
    Cola<int> Repeticion = F;
    while(!F.vacio()){
        elementocola = F.extraer();
        if(elementocolaBase==-1){
            elementocolaBase = elementocola;
            Menores.agregar(elementocola);
        }
        else{
            if(elementocola<elementocolaBase){
                if(!Menores.vacio()){
                    Menores.extraer();
                    Menores.agregar(elementocola);
                }
                else{
                    Menores.agregar(elementocola);
                }
            elementocolaBase = elementocola;
            contador = contador+1;
            }
        }
    }
    cout<<"Camino(s) de menor(es) costo: "<<endl;
    while(p!=NULL){
        if(EstaEnCola(Menores, p->info)){
            cout<<p->par1<<": "<<p->info<<endl;
        }
        p = p->link;
    }
}

bool EstaElPar(Lista Pares, string a, string b){
    Lista p = Pares;
    while(p!=NULL){
        if(p->par1==a && p->par2==b || p->par1==b && p->par2==a){
            return true;
        }
        p = p->link;
    }
    return false;
}

int CostoDelPar(Lista Pares, string a, string b){
    Lista p = Pares;
    while(p!=NULL){
        if((p->par1==a && p->par2==b) || (p->par1==b && p->par2==a)){
            return p->info;
        }
        p = p->link;
    }
    return -1;
}
int main()
{
    int i = 0, n = 0, cpesos = 0, k = 0, j = 0, peso = 0, sumapeso = 0, iterador = 1, pos = 0, menor = 0, costoespecifico= 0;
    cout<<"Ingrese el numero de vertices: "<<endl;
    cin>>n;
    cpesos = (n*n - n)/2;
    time_t t;
    srand((unsigned) time(&t));

    Lista listaPares = NULL;
    string elemento = "z";
    string alfabeto[10] = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"};
    i = 0;
    k = 0;
    for(i; i<n; i++){
        elemento = alfabeto[i];
        for(k = 0; k<n; k++){
            if(k!=i){
                if(EstaElPar(listaPares, alfabeto[i], alfabeto[k])){
                    costoespecifico = CostoDelPar(listaPares, alfabeto[i], alfabeto[k]);
                    agregarIzq(listaPares, costoespecifico, alfabeto[i], alfabeto[k]);
                }
                else{
                    agregarIzq(listaPares, rand() % cpesos +1, alfabeto[i], alfabeto[k]);
                }
        }
    }
    }
    mostrarPares(listaPares, 0);
    cout<<"---Permutaciones Intermedias---"<<endl;
    string alfabeto_Permutacion[9] =  {"b", "c", "d", "e", "f", "g", "h", "i", "j"};
    string substring = "";
    for(j = 0; j<n-1; j++){
        substring = substring + alfabeto_Permutacion[j];
    }
    string abuscar = "";
    Lista Permutaciones = NULL;
    permutations(substring,0,n-1, Permutaciones);

    string busca1 = "", busca2 = "", mitad1 = "", mitad2 = "";
    Cola<int> Costos;
    Lista paux = Permutaciones;
    while(paux!=NULL){
        busca1 = paux->par1;
        cout<<"---Posibilidad de Trayecto "<<iterador<<":---"<<endl;
        for(i=0; i+1<busca1.length(); i++){
            mitad1 = busca1[i];
            mitad2 = busca1[i+1];
            peso = entregaPeso(mitad1, mitad2, listaPares);
            sumapeso = sumapeso + peso;
            cout<<mitad1<<"--"<<peso<<"-->"<<mitad2<<endl;
        }
        iterador = iterador +1;
        paux->info = sumapeso;
        Costos.agregar(sumapeso);
        sumapeso = 0;
        paux = paux->link;
    }
    mostrarParesConCosto(Permutaciones, Costos);
    MenorDeQueue(Costos, Permutaciones);
    return 0;
}
