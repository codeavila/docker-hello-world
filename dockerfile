# Usar nginx stable version basado en Alpine
FROM nginx:stable-alpine
# Copiar el archivo index.html desde el directorio local al directorio de Nginx dentro del contenedor
COPY index.html /usr/share/nginx/html/
# Exponer el puerto 83
EXPOSE 83
