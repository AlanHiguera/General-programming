Para ejecutar el codigo distribuido:
mpicc godistribuido.c -o tarea2.exe
mpirun -np k ./tarea2.exe -H -V < board-5x5-4.txt

Para el secuencial:
gcc gosecuencialalan.c -o t2.exe
./t2.exe k -H -V < board-5x5-4.txt
