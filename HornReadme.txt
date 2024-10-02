La entrada solo pueden ser expresiones ingresadas en latex que respeten las clásulas de Horn.
Se compila mediante gcc y en Linux.
ocupar:
flex HornMain2.lex
gcc -o HornMain2.exe lex.yy.c -lfl
./HornMain2.exe n <entrada.txt 
Siendo n un número natural.


