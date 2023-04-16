#include <stdio.h>
#include<iostream>
#include<math.h>
using namespace std;

class Fraccion{
    private:
        int num;
        int den;
    public:
        Fraccion();
        void mostrar();
        void setNum(int);
        void setDen(int);
        int getNum();
        int getDen();
        void sumar(Fraccion);
        void Simplificar();
        void Multiplicar(Fraccion);
};
Fraccion::Fraccion(){
    num = 0;
    den = 1;
}

void Fraccion::mostrar(){
    cout<<"La fraccion es: "<<num<<"/"<<den<<endl;
}
void Fraccion::setNum(int Num){
    num = Num;
}
void Fraccion::setDen(int Dem){
    den = Dem;
}
int Fraccion::getNum(){
    return num;
}
int Fraccion::getDen(){
    return den;
}
void Fraccion::Simplificar(){
    int numaux = 0, denaux = 0, guardasigno1 = 1, guardasigno2 = 1;
    numaux = num;
    denaux = den;
    if(num<0 && den>0){
            guardasigno1 = -1;
            numaux = num;
            num = -num;
            }
    else if(num>0 && den<0){
        guardasigno2 = -1;
        denaux = den;
        den = -den;
        }
    else if(num<0 && den<0){
        guardasigno1 = -1;
        guardasigno2 = -1;
        numaux = num;
        denaux = den;
        num = -num;
        den = -den;
    }
            
    if(num%den==0){
        num = num/den;
        den = 1;
        numaux = num;
        denaux = den;
    }
    if(num%den!=0){
        int cont = 2;
        if(num<den){
            while(cont<num){
                if(num%cont==0 && den%cont==0){
                    num = num/cont;
                    den = den/cont;
                    cont = cont-1;
                    numaux = num;
                    denaux = den;
                }
                cont++;
            } 
        }
        else{
            cont = 2;
            while(cont<den){
                if(num%cont==0 && den%cont==0){
                    num = num/cont;
                    den = den/cont;
                    cont = cont-1;
                    numaux = num;
                    denaux = den;
                }
                cont++;
            }
        }
    }
    num = numaux*guardasigno1;
    den = denaux*guardasigno2;
    
}

void Fraccion::sumar(Fraccion F2){
    int denaux=0;
    int numaux1 = 0;
    int numaux2 = 0;
    
    denaux = den*F2.getDen();
    
    numaux1 = den*F2.getNum();
    numaux2 = F2.getDen()*num;
    
    num = numaux1+numaux2;
    den = denaux;
}
void Fraccion::Multiplicar(Fraccion F){
    num = num*F.num;
    den = den*F.den;
}


int main(){
    int sigue = 0;
    int instruccion1 = 0;
    int f1creada = 1;
    while(sigue==0){
        //Menu de la clase Fraccion.
            int instruccion2 = 0;
            Fraccion F1;
            while(instruccion2!=8){
                cout<<"Que metodo quieres ocupar? DefinirNumerador(0), DefinirDenominador(1), MostrarFraccion(2), ObtenerNumerador(3), ObtenerDenominador(4), SumarFracciones(5), Simplificar(6), Multiplicar(7), o Salir(8)"<<endl;
                cin>>instruccion2;
                if(instruccion2==0){
                    int numpropuesto=0;
                    cout<<"Que numerador quieres? "<<endl;
                    cin>>numpropuesto;
                    F1.setNum(numpropuesto);
                    }
                if(instruccion2==1){
                    int numpropuesto = 0;
                    cout<<"Que denominador quieres? "<<endl;
                    cin>>numpropuesto;
                    while(numpropuesto==0){
                        cout<<"No puede ser 0. Dame el denominador de la nueva fraccion: "<<endl;
                        cin>>numpropuesto;
                        }
                    F1.setDen(numpropuesto);
                }
                if(instruccion2==2){
                        F1.mostrar();
                    }
                if(instruccion2==3){
                    int copianum = 0, numpropuesto=0;
                    cout<<"Dame el numerador de la fraccion que quieres obtener: "<<endl;
                    cin>>numpropuesto;
                    F1.setNum(numpropuesto);
                    copianum = F1.getNum();
                    cout<<"La copia del numerador es: "<<copianum<<endl;
                }
                if(instruccion2==4){
                    int copiaden = 0, denpropuesto=0;
                    cout<<"Dame el denominador de la fraccion que quieres obtener: "<<endl;
                    cin>>denpropuesto;
                    F1.setDen(denpropuesto);
                    copiaden = F1.getDen();
                    cout<<"La copia del denominador es: "<<copiaden<<endl;
                    }
                if(instruccion2==5){
                    int num2 = 0, num3 = 0, num4 = 0, num5 = 0;
                    cout<<"Dame el numerador de la primera fraccion: "<<endl;
                    cin>>num2;
                    cout<<"Dame el denominador de la primera fraccion: "<<endl;
                    cin>>num3;
                    while(num3==0){
                        cout<<"No puede ser 0. Dame el denominador de la nueva fraccion: "<<endl;
                        cin>>num3;
                        }
                    cout<<"Dame el numerador de la segunda fraccion: "<<endl;
                    cin>>num4;
                    cout<<"Dame el denominador de la segunda fraccion: "<<endl;
                    cin>>num5;
                    while(num5==0){
                        cout<<"No puede ser 0. Dame el denominador de la nueva fraccion: "<<endl;
                        cin>>num5;
                        }
                    F1.setNum(num2);
                    F1.setDen(num3);
                    Fraccion F2;
                    F2.setNum(num4);
                    F2.setDen(num5);
                    F1.sumar(F2);
                    F1.mostrar();
                    }
                    
                if(instruccion2==6){
                    int num6 =0, num7 = 0;
                    cout<<"Ingrese el numerador de la fraccion que deseas simplificar: "<<endl;
                    cin>>num6;
                    cout<<"Ingrese el denominador de la fraccion que deseas simplificar: "<<endl;
                    cin>>num7;
                    Fraccion F3;
                    F3.setNum(num6);
                    F3.setDen(num7);
                    F3.Simplificar();
                    F3.mostrar();
                    }
                if(instruccion2==7){
                    int num6 = 0, num7 = 0, num8 =0, num9 = 0;
                    cout<<"Ingrese el numerador de la primera fraccion que deseas multiplicar: "<<endl;
                    cin>>num6;
                    cout<<"Ingrese el denominador de la primera fraccion que deseas multiplicar: "<<endl;
                    cin>>num7;
                    while(num7==0){
                        cout<<"No puede ser 0. Por favor ingrese un numero valido: "<<endl;
                        cin>>num7;
                        }
                    cout<<"Ingrese el numerador de la segunda fraccion que deseas multiplicar: "<<endl;
                    cin>>num8;
                    cout<<"Ingrese el denominador de la segunda fraccion que deseas multiplicar: "<<endl;
                    cin>>num9;
                    while(num9==0){
                        cout<<"No puede ser 0. Por favor ingrese un numero valido: "<<endl;
                        cin>>num9;
                        }
                    Fraccion F4;
                    Fraccion F5;
                    
                    F4.setNum(num6);
                    F4.setDen(num7);
                    
                    F5.setNum(num8);
                    F5.setDen(num9);
                    
                    F4.Multiplicar(F5);
                    F4.mostrar();
                    }
                if(instruccion2==8){
                    cout<<"El programa se ha terminado: "<<endl;
                    sigue = 1;
                }
                }
                
        
    }  
    return 0;
}
