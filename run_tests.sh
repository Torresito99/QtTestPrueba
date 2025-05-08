#!/bin/bash

# Cambia al directorio build
cd build

# Ejecuta el programa tst_login y guarda la salida en ../tst_log.txt (fuera del directorio build)
./tst_login > ../tst_log.txt 2>&1

echo "Resultados de las pruebas guardados en tst_log.txt"
