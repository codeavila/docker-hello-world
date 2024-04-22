## Actividad 1

### 1. Ejecución de Nginx en Docker
Ejecuta un contenedor Docker en segundo plano usando la imagen `nginx:stable-alpine`. Mapea el puerto 80 del contenedor al puerto 8081 del host.

```bash
docker run -d -p 8081:80 nginx:stable-alpine
```
Accede a http://localhost:8081/ en tu navegador para ver la página por defecto de Nginx.

### 2. Verificación del contenedor
Lista todos los contenedores Docker para verificar que el contenedor de Nginx esté corriendo y obtener su nombre o ID.

```bash
docker ps -a
```

### 3. Acceso al contenedor
Accede al shell del contenedor de Nginx, reemplazando [container-name|container-id] por el nombre o ID del contenedor.

```bash
docker exec -it [container-name|container-id] sh
```

### 4. Navegación y revisión del archivo por defecto
Navega al directorio donde Nginx almacena los archivos estáticos y visualiza el contenido del index.html por defecto.

```bash
cd usr/share/nginx/html
cat index.html
```

### 5. Salida del contenedor
Sale del shell interactivo del contenedor.

```bash
exit
```

### 6. Creación de un nuevo archivo index.html local
En tu máquina local, navega a la ruta deseada y crea un nuevo archivo index.html con el contenido que quieras mostrar en el servidor Nginx.

### 7. Copia del archivo al contenedor
Copia el nuevo index.html desde tu máquina local al directorio adecuado dentro del contenedor, sobrescribiendo el archivo existente.

```bash
docker cp [ruta-local/index.html] [container-name|container-id]:/usr/share/nginx/html/
```

### 8. Verificación en el navegador
Visita http://localhost:8081/ nuevamente para ver los cambios reflejados en el navegador.

## Actividad 2

### 1. Ejecución del Contenedor Docker
Ejecutamos el contenedor, utilizando opciones para configurar su comportamiento en el sistema host.

```bash
docker run -d -v /home/ccavila/Documents/HolaMundoNginx:/usr/share/nginx/html -p 8082:80 nginx:stable-alpine
```
```
-d: Significa "daemon" y ejecuta el contenedor en segundo plano, permitiendo que el host continúe utilizándose para otras tareas.

-v /home/ccavila/Documents/HolaMundoNginx:/usr/share/nginx/html: Monta el volumen que contiene el index.html en la ruta especificada dentro del contenedor. Esto permite que los cambios en el archivo local se reflejen en el contenedor.

-p 8082:80: Mapea el puerto 80 del contenedor al puerto 8082 del host, haciendo que el Nginx del contenedor sea accesible a través del puerto 8082 del host.

nginx:stable-alpine: Nombre de la imagen Docker a utilizar.
```

### 3. Renombramiento del Contenedor
Para mayor claridad en la gestión de contenedores, renombramos el contenedor en ejecución.


```bash
docker rename [container-name] actividad_2
```

```
docker rename: Comando para cambiar el nombre de un contenedor Docker existente.

[container-name]: Nombre o ID del contenedor original.

actividad_2: Nuevo nombre asignado al contenedor.
```

# Actividad 3

### 1. El `Dockerfile` utilizado para esta actividad está diseñado para construir una imagen de Nginx que sirve una página estática personalizada:

```Dockerfile
# Usar nginx stable version basado en Alpine
FROM nginx:stable-alpine

# Copiar el archivo index.html desde el directorio local al directorio de Nginx dentro del contenedor
COPY index.html /usr/share/nginx/html/

# Exponer el puerto 80
EXPOSE 80
```

```
FROM nginx:stable-alpine: Establece la imagen base como Nginx en su versión estable, utilizando Alpine Linux, que es ligero y rápido.

COPY index.html /usr/share/nginx/html/: Copia el archivo index.html desde el directorio de contexto de la construcción (donde se encuentra el Dockerfile) al directorio que Nginx usa para servir archivos estáticos.

EXPOSE 80: Informa a Docker que el contenedor escuchará en el puerto 80. Este puerto será utilizado para acceder al servidor Nginx desde el navegador.
```

### 2. Construir la Imagen Docker
Construye la imagen utilizando el siguiente comando en el directorio donde se encuentran el Dockerfile y el index.html:

```bash
docker build -t mi-nginx .
```

```
docker build: Comando para construir imágenes Docker.

-t mi-nginx: Etiqueta la imagen construida como mi-nginx.
```

### 3. Ejecutar el Contenedor Docker
Una vez construida la imagen, ejecuta el contenedor usando:

```bash
docker run -d -p 8083:80 --name actividad_3 mi-nginx
```

```
-d: Ejecuta el contenedor en modo daemon, es decir, en segundo plano.

-p 8083:80: Mapea el puerto 80 del contenedor al puerto 8083 del host, permitiendo el acceso al servidor Nginx a través de http://localhost:8083.

--name actividad_3: Asigna el nombre actividad_3 al contenedor para facilitar su gestión.
```

Verificar la Implementación
Después de ejecutar el contenedor, puedes verificar que el servidor Nginx está sirviendo el index.html personalizado accediendo a:

```plaintext
http://localhost:8083
```

Esto debería mostrarte el contenido del archivo index.html que se ha integrado en la imagen Docker.