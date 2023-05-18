#include <stdio.h>
#include<iostream>
#include<math.h>
using namespace std;
class Complejo{
    private:
        int real;
        int imaginaria;
    public:
        Complejo();
        void mostrar();
        void setReal(int);//basta con int, sin el a.
        void setImaginaria(int);// en vdd poner que reciben float
        int getReal();
        int getImaginaria();
        void sumar(Complejo);
        void restar(Complejo);
        void modulo();
};
Complejo::Complejo(){
    real = 0;
    imaginaria = 0;
}
void Complejo::mostrar(){
    if(imaginaria>0){
        cout<<real<<"+"<<imaginaria<<"i"<<endl;
    }
    if(imaginaria<0){
        cout<<real<<imaginaria<<"i"<<endl;
    }
    if(imaginaria==0){
        cout<<real<<endl;
    }
}
void Complejo::setReal(int a){
    real = a;
}
void Complejo::setImaginaria(int b){
    imaginaria = b;
}

int Complejo::getReal(){
    return real;
}
int Complejo::getImaginaria(){
    return imaginaria;
}
void Complejo::sumar(Complejo C){
    real = real + C.real;
    imaginaria = imaginaria + C.imaginaria;
}
void Complejo::restar(Complejo C){
    real = real - C.real;
    imaginaria = imaginaria - C.imaginaria;
}
void Complejo::modulo(){
    int aux=0;
    float aux2 = 0;
    aux = real*real + imaginaria*imaginaria;
    aux2 = sqrt(aux);
    cout<<"El modulo es: "<<aux2<<endl;
}


int main(){
    int sigue = 0;
    while(sigue==0){//menu de clase Compleja.
        int instruccion5 = 0, instruccion3=0;
        Complejo C1;
            while(instruccion5==0){
                cout<<"Que metodo quieres ocupar? DefParteReal(0), DefParteImaginaria(1), Mostrar(2), ObtenerParteReal(3), ObtenerParteImaginaria(4), Sumar(5), Restar(6), SacarModulo(7), o Salir(8)"<<endl;
                cin>>instruccion3;
                if(instruccion3==0){
                    int nreal=0;
                    cout<<"Defina la parte real: "<<endl;
                    cin>>nreal;
                    C1.setReal(nreal);
                    }
                if(instruccion3==1){
                    int nimaginario=0;
                    cout<<"Defina la parte imaginaria: "<<endl;
                    cin>>nimaginario;
                    C1.setImaginaria(nimaginario);
                    }
                if(instruccion3==2){
                    cout<<"El numero complejo es: "<<endl;
                    C1.mostrar();
                    }
                if(instruccion3==3){
                    int copiareal=0;
                    copiareal = C1.getReal();
                    cout<<"La copia de la parte real es: "<<copiareal<<endl;
                    }
                if(instruccion3==4){
                    int copiaimaginaria=0;
                    copiaimaginaria = C1.getImaginaria();
                    cout<<"La copia de la parte imaginaria es: "<<copiaimaginaria<<endl;
                    }
                if(instruccion3==5){
                    int real1=0, real2 = 0, imaginaria1 = 0, imaginaria2 = 0;
                    cout<<"Dame la parte real del primer numero: "<<endl;
                    cin>>real1;
                    cout<<"Dame la parte imaginaria del primer numero: "<<endl;
                    cin>>imaginaria1;
                    cout<<"Dame la parte real del segundo numero: "<<endl;
                    cin>>real2;
                    cout<<"Dame la parte imaginaria del segundo numero: "<<endl;
                    cin>>imaginaria2;
                    
                    C1.setReal(real1);
                    C1.setImaginaria(imaginaria1);
                    
                    Complejo C2;
                    C2.setReal(real2);
                    C2.setImaginaria(imaginaria2);
                    
                    C1.sumar(C2);
                    cout<<"El resultado es: "<<endl;
                    C1.mostrar();
                }
                if(instruccion3==6){
                    int real1=0, real2 = 0, imaginaria1 = 0, imaginaria2 = 0;
                    cout<<"Dame la parte real del primer numero: "<<endl;
                    cin>>real1;
                    cout<<"Dame la parte imaginaria del primer numero: "<<endl;
                    cin>>imaginaria1;
                    cout<<"Dame la parte real del segundo numero: "<<endl;
                    cin>>real2;
                    cout<<"Dame la parte imaginaria del segundo numero: "<<endl;
                    cin>>imaginaria2;
                    
                    C1.setReal(real1);
                    C1.setImaginaria(imaginaria1);
                    Complejo C2;
                    C2.setReal(real2);
                    C2.setImaginaria(imaginaria2);
                    
                    cout<<"El resultado es: "<<endl;
                    C1.restar(C2);
                    C1.mostrar();
                }
                if(instruccion3==7){
                    int real1=0, real2 = 0, imaginaria1 = 0, imaginaria2 = 0;
                    cout<<"Dame la parte real numero: "<<endl;
                    cin>>real1;
                    cout<<"Dame la parte imaginaria numero: "<<endl;
                    cin>>imaginaria1;
                    
                    C1.setReal(real1);
                    C1.setImaginaria(imaginaria1);
                    
                    C1.modulo();
                }
                if(instruccion3==8){
                    instruccion5 = 1;
                    sigue = 1;
                }
                }
        }  
        
    cout<<"El programa ha terminado."<<endl;    
    return 0;
    }
