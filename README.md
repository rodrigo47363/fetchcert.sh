# fetchcert.sh

`fetchcert.sh` es un script de Bash diseñado para automatizar la generación de certificados y la descarga de archivos PDF asociados. Este script permite a los usuarios obtener certificados personalizados y sus archivos PDF correspondientes con facilidad y eficacia, todo desde la línea de comandos.

## Características

- **Generación de Certificados**: Automatiza la generación de certificados con un identificador único.
- **Descarga de PDF**: Descarga el PDF asociado al certificado generado.
- **Actualización Automática**: Permite actualizar el script a la última versión disponible desde un repositorio en línea.
- **Interfaz de Usuario Simple**: Menú interactivo para ejecutar el script, actualizarlo o salir.

## Instalación

1. **Clona el Repositorio**:

   ```bash
   git clone https://github.com/rodrigo47363/fetchcert.sh.git
   ```

2. **Copia el Script a una Ubicación Ejecutable**:

   ```bash
   sudo cp fetchcert.sh /usr/local/bin/fetchcert.sh
   ```

3. **Haz el Script Ejecutable**:

   ```bash
   sudo chmod +x /usr/local/bin/fetchcert.sh
   ```

## Uso

### Ejecutar el Script

Para ejecutar el script, abre una terminal y usa el siguiente comando:

```bash
fetchcert.sh
```

### Menú de Opciones

- **Ejecutar el Script**: Solicita el nombre para el certificado y gestiona la generación y descarga.
- **Actualizar el Script**: Descarga la última versión del script desde el repositorio.
- **Salir**: Cierra el menú.

### Ejemplo de Uso

```bash
fetchcert.sh
```

- Selecciona "Ejecutar el script" para iniciar el proceso de generación de certificado.
- Introduce el nombre requerido cuando se te solicite.

## Variables de Entorno

- **`REPO_URL`**: URL del repositorio desde donde se actualiza el script.
- **`SCRIPT_NAME`**: Nombre del script.
- **`LOCAL_PATH`**: Ruta local donde se almacena el script.

## Actualización del Script

El script incluye una opción para actualizarse automáticamente desde el repositorio remoto. Esto garantiza que siempre estés utilizando la última versión del script con las últimas características y correcciones.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar este script, por favor abre un **Issue** o un **Pull Request** en el [repositorio de GitHub](https://github.com/rodrigo47363/fetchcert.sh).

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Para preguntas, comentarios o sugerencias, por favor contacta a [Rodrigo](mailto:rodrigo@example.com) o abre un **Issue** en el [repositorio de GitHub](https://github.com/rodrigo47363/fetchcert.sh).
