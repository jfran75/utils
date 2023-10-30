#### pacman commands
Pacman es el administrador de paquetes predeterminado en Arch Linux y distribuciones basadas en Arch, como Manjaro. Aquí tienes una lista de comandos y sus parámetros más utilizados junto con ejemplos y explicaciones:

1. **`sudo pacman -Syu`**
   - Ejemplo: `sudo pacman -Syu`
   - Explicación: Actualiza la base de datos de paquetes y actualiza todos los paquetes instalados en el sistema. Es el comando más común para mantener el sistema actualizado.

2. **`sudo pacman -S paquete`**
   - Ejemplo: `sudo pacman -S firefox`
   - Explicación: Instala un paquete en el sistema. Sustituye "paquete" por el nombre del paquete que deseas instalar, por ejemplo, Firefox.

3. **`sudo pacman -R paquete`**
   - Ejemplo: `sudo pacman -R firefox`
   - Explicación: Elimina un paquete del sistema. Ten cuidado al usar este comando, ya que eliminará el paquete y sus dependencias no utilizadas.

4. **`sudo pacman -Q`**
   - Ejemplo: `pacman -Q`
   - Explicación: Lista todos los paquetes instalados en el sistema.

5. **`sudo pacman -Qi paquete`**
   - Ejemplo: `pacman -Qi firefox`
   - Explicación: Muestra información detallada sobre un paquete, incluyendo versión, descripción y dependencias.

6. **`sudo pacman -Ss palabra_clave`**
   - Ejemplo: `pacman -Ss texteditor`
   - Explicación: Busca paquetes relacionados con la palabra clave proporcionada. Puede ser útil para encontrar paquetes que contengan ciertos programas o características.

7. **`sudo pacman -Sc`**
   - Ejemplo: `sudo pacman -Sc`
   - Explicación: Limpia la caché de paquetes descargados en `/var/cache/pacman/pkg/`. Esto puede liberar espacio en disco, pero ten en cuenta que no puedes volver a instalar versiones anteriores de paquetes si los eliminas de la caché.

8. **`sudo pacman -Syy`**
   - Ejemplo: `sudo pacman -Syy`
   - Explicación: Forza una actualización completa de la base de datos de paquetes, incluso si ya está actualizada. Esto puede ser útil en casos raros de problemas de sincronización.

9. **`sudo pacman -U paquete.tar.xz`**
   - Ejemplo: `sudo pacman -U paquete.tar.xz`
   - Explicación: Permite instalar un paquete desde un archivo `.tar.xz` descargado manualmente en lugar de desde los repositorios. Esto es útil para instalar paquetes que no están en los repositorios oficiales.

10. **`sudo pacman -Qdt`**
    - Ejemplo: `pacman -Qdt`
    - Explicación: Muestra una lista de paquetes que fueron instalados como dependencias pero que ya no son necesarios y pueden ser eliminados con `pacman -Rns`.