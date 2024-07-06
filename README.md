# mGFS

Este repositorio sirve como un entorno de desarrollo para la práctica de miniGFS de la asignatura de Sistemas Distribuidos

Incluye configuración de VSCode para compilación y uso del debugger para las 3 partes del miniGFS

___
### Disclaimer
Todo lo proporcionado en este repositorio son recursos míos, que he creado para facilitar mi propio desarrollo, pero también me gusta compartir las herramientas que desarrollo para ayudar a otros (Véase mi otro repositorio, Estortura)
Se recomienda revisar el contenido del repositorio (en especial `setup.sh`) antes de descargarlo y hacer uso de este.
He tomado mi mejor esfuerzo para que no haya ningun error, aunque no garantizo nada
Cualquier petición de ayuda será ignorada

### Entorno
El entorno deseado es un sistema Linux, o WSL, requiere de gcc y gdb para compilación y depuración, así como VSCode y la extensión de C/C++, con id `ms-vscode.cpptools`
Se dispone de un script de inicializacion `setup.sh` que reorganiza las carpetas al estilo deseado por la configuracion

### Setup
1. Incluir la carpeta miniGFS.2024 en la raíz del proyecto
2. Ejecutar el script `setup.sh` desde la raiz del proyecto

El script extraerá el código a la carpeta src, hará un symlink a las cabeceras en `lib/include` y extraerá la carpeta `master_node/util` a `src`, además de `BORRAR miniGFS.2024` y los symlinks del proyecto, por lo que se recomienda hacer una copia de seguridad con anterioridad 

### Estructura
- `lib`: Carpeta en la que se guardan las librerias .so y links simbolicos a los ficheros cabecera .h
- `out`: Carpeta de salida de los binarios de `client`, `master` y `server`
- `src`: Carpeta con el codigo fuente

### Compilacion
Con VSCode y las extensiones previamente mencionadas, VSCode dispone de las `tasks` de compilación, accesibles desde el menú de comandos `Ctrl+Shift+P`, buscando `Run Task`.
Seleccionada la opción, deja elegir entre `Build all/client/server/master/libmgfs.so/lilbutil.so`

### Ejecución y depuración
Para modificar parámetros de arranque(variables de entorno o argumentos de entrada), se puede modificar el campo `args` en la tarea correspondiente de `.vscode/launch.json`

Para ejecutar o depurar alguno de los elementos, se requiere **experiencia básica** del uso del depurador de VSCode, pero en pocas palabras:
1. Accede a la pestaña debugger
2. En el panel de run and debug selecciona la configuración (master/client/server)
3. Pulsa el triángulo verde

Esto ejecutará las tareas de compilación y pondrá en marcha el debugger, que también sirve para ejecutar el maestro, cliente o servidor.

Si se quiere ejecutar maestro y cliente, basta con ejecutar el maestro, y posteriormente el cliente, ya que se dispondrá de dos terminales distintas para ambos procesos. Recomendo en este caso "arrastrar" la terminal de uno al otro, para tener ambas abietas al mismo tiempo.
Un pequeño error que suele ocurrir, es que al intentar ejecutar el cliente después de ejecutar el maestro, el primer intento de compilación falla porque hay un recurso abierto, pero al segundo intento funciona. 

Para breakpoints, consulta de variables, etc... eso entra en el campo de conocimiento del depurador de VSCode y no conviene explicar el funcionamiento aqui

### Entrega
La práctica requiere de entregar unos ficheros específicos en carpetas específicas en un servidor específico.
Basta con modificar el script de `entrega.sh`, incluyendo el usuario y host/maquina correspondiente y ejecutarlo.
Este script únicamente copia los ficheros del origen al destino, por lo que el alumno sigue necesitando inicar sesión ssh la máquina y realizar la entrega en remoto.

El comando scp del script **SOBREESCRIBE** los ficheros destino, por lo que el alumno debe tener cuidado de no sobreescribir algo de importancia, haciendo una copia previa, o siendo consciente, de que todo su codigo está en local, y solo usa el remoto para la entrega.