La entrada solo pueden ser expresiones ingresadas en latex que respeten las clásulas de Horn.
Se compila mediante gcc y en Linux.
ocupar:
flex Horn.lex
gcc -o Horn.exe lex.yy.c -lfl
./Horn.exe n <HornEntrada.txt 
Siendo n un número natural.


