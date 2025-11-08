/******Modo De Ejecución********/

gcc grafoFCparalelofinal.c -o  t1.exe
./t1.exe 4 -H -V < data.txt

k: numero de threads
P = {V: particion vertical, H: particion horizontal}
O = {V: modo verboso, S: modo silencioso}

El formato del archivo de datos es:
n
a11
a12
.
.
.
ann

En el directorio se encuentran sugerencias de archivos de prueba.
La cantidad de hilos está no solo sujeta a la cantidad de vértices del grafo sino también a la cantidad que se posea en Hardware.
