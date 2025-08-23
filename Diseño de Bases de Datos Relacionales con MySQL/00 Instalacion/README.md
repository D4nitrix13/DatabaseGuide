<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Instalacion***

- **Windows:**
    • *[VSCode](https://code.visualstudio.com/download "https://code.visualstudio.com/download")*
    • *[Git, Git Bash y Windows Terminal](https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe "https://github.com/git-for-windows/git/releases/download/v2.46.0.windows.1/Git-2.46.0-64-bit.exe")*
    • *[Xampp (lo necesitamos para MySQL)](https://www.apachefriends.org/download.html "https://www.apachefriends.org/download.html")*
    • *[Nodejs y NPM](https://nodejs.org/en/download/package-manager "https://nodejs.org/en/download/package-manager")*

- **Linux (basado en Ubuntu/Debian y Arch):**
    • *Git*

    ```bash
    sudo apt update && sudo apt-get install -y git
    ```

    • *Paru*

    ```bash
    sudo apt update && sudo apt-get install -y git
    ```

    • *VSCode*

    ```bash
    sudo snap install --classic code
    ```

    • *MySQL con Xampp. Si lo prefieres, puedes instalarlo con Docker.*

    ```bash
    
    ```

    • *Nodejs y NPM*

    ```bash
    # installs fnm (Fast Node Manager)
    curl -fsSL https://fnm.vercel.app/install | bash
    
    # activate fnm
    source ~/.bashrc
    
    # download and install Node.js
    fnm use --install-if-missing 20
    
    # verifies the right Node.js version is in the environment
    node -v # should print `v20.17.0`
    
    # verifies the right npm version is in the environment
    npm -v # should print `10.8.2`
    ```

---

## ***Temas***

**Lista de temas:**
    • *[Material Theme](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme "https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme")*
    • *[One Dark Pro](https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme "https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme")*
    • *[Ayu Theme](https://marketplace.visualstudio.com/items?itemName=teabyii.ayu "https://marketplace.visualstudio.com/items?itemName=teabyii.ayu")*
    • *[One Monokai](https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai "https://marketplace.visualstudio.com/items?itemName=azemoh.one-monokai")*
    • *[Bluloco Dark](https://marketplace.visualstudio.com/items?itemName=uloco.theme-bluloco-dark "https://marketplace.visualstudio.com/items?itemName=uloco.theme-bluloco-dark")*
    • *[Dracula](https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula "https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula")*

---

### ***XAMPP es un paquete de software libre que incluye las aplicaciones necesarias para desarrollar y probar sitios web de manera local. Su nombre es un acrónimo que refleja las tecnologías incluidas:***

- **X:** *Se refiere a la multiplataforma (puede funcionar en sistemas operativos como Windows, Linux y macOS).*
- **A:** *Apache, que es un servidor web.*
- **M:** *MySQL o MariaDB, que son sistemas de gestión de bases de datos.*
- **P:** *PHP, un lenguaje de programación para desarrollo web.*
- **P:** *Perl, otro lenguaje de programación.*

- *XAMPP facilita a los desarrolladores la creación de servidores locales para probar aplicaciones web sin necesidad de acceder a servidores en línea. Es ideal para desarrollo, ya que permite instalar de manera fácil y rápida un entorno que incluye todo lo necesario para ejecutar sitios web dinámicos.*

---

### ***Características principales***

- *Instalación sencilla y rápida.*
- *Incluye herramientas populares como **phpMyAdmin** para gestionar bases de datos MySQL/MariaDB.*
- *Ideal para ambientes de desarrollo y pruebas locales.*
- *Soporta PHP, MySQL/MariaDB, y otros lenguajes como Perl.*

---

### ***Usos comunes***

- *Probar sitios web y aplicaciones de manera local antes de lanzarlas en un servidor de producción.*
- *Desarrollo de aplicaciones web que utilicen tecnologías como PHP y MySQL.*

---

### ***Cómo instalar `paru` (AUR helper) en distribuciones basadas en Arch Linux***

- *`Paru` es un ayudante de AUR (Arch User Repository) diseñado para facilitar la búsqueda, instalación y actualización de paquetes desde los repositorios oficiales y AUR. Es una herramienta eficiente y popular entre los usuarios de Arch Linux por su velocidad, flexibilidad y funcionalidades adicionales como la resolución de dependencias.*

- *Existen dos versiones de `paru`:*

- **paru:** *Compila e instala el paquete desde el código fuente disponible en AUR.*
- **paru-bin:** *Instala una versión precompilada del paquete, lo que ahorra tiempo de compilación.*

- *Ambas versiones ofrecen la misma funcionalidad, pero la diferencia está en el proceso de instalación.*

---

#### ***Instalación de **paru** desde el AUR***

1. **Instalar los paquetes necesarios:**
   - *Asegúrate de tener el grupo de paquetes **base-devel**, requerido para compilar paquetes desde el AUR.*

   ```bash
   sudo pacman -Syu --needed --noconfirm base-devel
   ```

2. **Clonar el repositorio de paru:**
   - *Utiliza Git para clonar el repositorio de **paru** desde AUR.*

   ```bash
   git clone https://aur.archlinux.org/paru.git --depth=1
   ```

3. **Compilar e instalar:**
   - *Cambia al directorio clonado y utiliza `makepkg` para compilar e instalar **paru**.*

   ```bash
   cd ./paru
   makepkg -si
   ```

---

#### ***Instalación de **paru-bin** (versión precompilada)***

- **Si prefieres evitar la compilación, puedes instalar **paru-bin** desde AUR con el siguiente comando:**

```bash
paru -Syu paru-bin
```

---

#### ***Enlaces útiles***

- *[GitHub de paru:](https://github.com/Morganamilo/paru "https://github.com/Morganamilo/paru")*

---

#### ***Extension Client MySQL***

**Nombre:** *MySQL*
**ID:** *cweijan.vscode-mysql-client2*
**Descripción:** *Database manager for MySQL/MariaDB, PostgreSQL, SQLite, Redis and ElasticSearch.*
**Versión:** *4.5.12*
**Editor:** *Weijan Chen*
**[Vínculo de VS Marketplace:](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2 "https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2")**

---

### ***Cómo instalar y gestionar fuentes a nivel de usuario local en Linux***

- **En Linux, las fuentes se pueden instalar a nivel del sistema o a nivel de usuario. Si deseas instalar fuentes solo para el usuario actual sin afectar a otros usuarios del sistema, el lugar adecuado es el directorio **`~/.local/share/fonts`**. Esto te permite tener un entorno personalizado sin necesidad de permisos de administrador.**

---

#### ***Pasos para instalar fuentes a nivel de usuario local***

1. **Crear el directorio de fuentes (si no existe):**
   - *Aunque este directorio suele estar presente en la mayoría de las distribuciones, si no existe, puedes crearlo manualmente con el siguiente comando:*

   ```bash
   mkdir -p ~/.local/share/fonts
   ```

2. **Copiar las fuentes al directorio:**
   - *Descarga las fuentes que desees y cópialas al directorio **`~/.local/share/fonts`**. Esto puede incluir ficheros en formatos como `.ttf`, `.otf`, o `.woff`.*

   - *Ejemplo de comando para copiar una fuente:*

   ```bash
   cp /ruta/de/las/fuentes/*.ttf ~/.local/share/fonts/
   ```

3. **Actualizar la caché de fuentes:**
   - *Para que las nuevas fuentes estén disponibles de inmediato, es necesario actualizar la caché de fuentes con el siguiente comando:*

   ```bash
   fc-cache -f -v
   ```

   -- *Este comando actualizará las cachés de fuentes, asegurando que el sistema detecte las nuevas instalaciones.*

4. **Verificar la instalación de las fuentes:**
   - *Puedes usar el comando `fc-list` para listar todas las fuentes disponibles, incluidas las que acabas de instalar:*

   ```bash
   fc-list | grep -i "nombreFuente"
   ```

---

#### ***Ventajas de usar `~/.local/share/fonts`***

- **No requiere permisos de administrador:** *Puedes instalar y gestionar fuentes sin necesidad de utilizar `sudo` o afectar a otros usuarios.*
- **Personalización:** *Cada usuario puede tener su propio conjunto de fuentes sin interferir con las fuentes del sistema.*
- **Portabilidad:** *Al estar las fuentes en tu directorio personal, puedes respaldarlas o sincronizarlas fácilmente entre diferentes sistemas.*

---

#### ***Ejemplo práctico***

- *Si quieres instalar la fuente **JetBrains Mono**, puedes seguir estos pasos:*

1. **Descargar la fuente** *desde la página oficial:*
   *[JetBrains Mono: https://www.jetbrains.com/lp/mono/](https://www.jetbrains.com/lp/mono/)*

2. **Mover la fuente descargada** *al directorio `~/.local/share/fonts`:*

   ```bash
   mv ~/Descargas/JetBrainsMono-*.ttf ~/.local/share/fonts/
   ```

3. **Actualizar la caché** *para que esté disponible:*

   ```bash
   fc-cache -f -v
   ```

- *¡Y listo! La fuente estará disponible solo para tu usuario.*

---

### ***Opción 1: Instalar MySQL con XAMPP en Linux***

- *XAMPP es un entorno de desarrollo web que incluye Apache, MySQL (o MariaDB), y PHP/Perl. Esta guía te mostrará cómo instalar XAMPP en Linux y cómo configurar el entorno para desarrollar proyectos web localmente.*

#### ***Paso 1: Descargar e instalar XAMPP***

- **Descarga el instalador de XAMPP desde el siguiente enlace:**

- *[Descargar XAMPP para Linux](https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run "https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/8.0.30/xampp-linux-x64-8.0.30-0-installer.run")*

- *Una vez descargado el fichero, sigue estos pasos para instalarlo:*

1. **Dar permisos de ejecución al instalador:**

   ```bash
   chmod +x xampp-linux-x64-8.0.30-0-installer.run
   ```

2. **Ejecutar el instalador:**

   ```bash
   sudo ./xampp-linux-x64-8.0.30-0-installer.run
   ```

   - *Esto iniciará el asistente gráfico de instalación de XAMPP.*

---

#### ***Paso 2: Ubicación de los binarios***

- *Después de instalar XAMPP, los binarios (incluidos Apache y MySQL) estarán ubicados en el siguiente directorio:*

- **Directorio de binarios de XAMPP:** `/opt/lampp/bin`

---

#### ***Paso 3: Añadir XAMPP al PATH del usuario***

- *Para poder ejecutar comandos de XAMPP como `mysql` o `php` desde cualquier lugar en la terminal, debes agregar el directorio de binarios de XAMPP a tu variable `PATH`. Para ello, edita el fichero `.profile` de tu usuario:*

1. **Editar `.profile` con tu editor preferido:**

   ```bash
   nvim ~/.profile
   ```

2. **Añadir la siguiente línea al final del fichero:**

   ```bash
   PATH="$PATH:/opt/lampp/bin/"
   ```

3. **Actualizar el perfil:**

   ```bash
   source ~/.profile
   ```

- *Ahora puedes ejecutar comandos de XAMPP desde cualquier directorio.*

---

#### ***Paso 4: Iniciar el gestor de XAMPP***

- *Puedes iniciar el gestor gráfico de XAMPP con el siguiente comando:*

```bash
sudo /opt/lampp/manager-linux-x64.run
```

- *Este gestor te permitirá controlar los servicios de Apache, MySQL, y otros componentes de XAMPP.*

---

#### ***Paso 5: Acceder a localhost***

- **Después de iniciar los servicios de XAMPP, puedes hacer una petición en tu navegador web apuntando a **`localhost`** para verificar que el servidor Apache está funcionando. Esto mostrará la página de bienvenida de XAMPP.**

---

#### ***Paso 6: Ubicación de los ficheros servidos por Apache***

- *El directorio donde Apache almacena los ficheros para las solicitudes web es:*

- **Directorio raíz de XAMPP:** `/opt/lampp/htdocs`

- *Este es el directorio predeterminado donde puedes crear tus proyectos web. Para ver el contenido actual del directorio, puedes ejecutar:*

```bash
ls -lA /opt/lampp/htdocs
```

---

#### ***Paso 7: Crear un proyecto en el directorio `htdocs`***

- *Si deseas crear un nuevo proyecto, debes crear un directorio dentro de `htdocs`. Sin embargo, como este directorio pertenece a **root**, necesitas permisos de superusuario:*

1. **Crear un directorio para tu proyecto:**

   ```bash
   sudo mkdir /opt/lampp/htdocs/project
   ```

2. **Asignar permisos al directorio:**

   - *Para poder trabajar sin tener que usar `sudo` constantemente, asigna los permisos del directorio a tu usuario:*

   ```bash
   sudo chown -R $USER:$USER /opt/lampp/htdocs/project
   ```

   - *Con este comando, podrás crear y editar ficheros en tu proyecto sin problemas.*

---

#### ***Paso 8: Acceder al proyecto desde el navegador***

- *Una vez creado el directorio y configurado el entorno, puedes acceder a tu proyecto desde el navegador escribiendo:*

```bash
http://localhost/project
```

- *Esto cargará el contenido del directorio `project` que acabas de crear en el servidor local.*

---

Aquí tienes la información mejorada y organizada sobre la instalación de Docker para MySQL, así como la instalación de Node.js y npm en diferentes sistemas operativos:

---

### ***Instalar Docker para MySQL***

- *Docker es una plataforma que permite ejecutar aplicaciones en contenedores, facilitando la configuración y despliegue de servicios como MySQL de manera sencilla y eficiente. A continuación, se explican los pasos para instalar Docker y Docker Compose, y cómo verificar su versión.*

---

#### ***Paso 1: Instalar Docker en Ubuntu***

- *Para instalar Docker en Ubuntu, sigue la guía oficial que te proporciona los pasos necesarios para configurar el motor de Docker en tu sistema. Asegúrate de utilizar la última versión disponible siguiendo este enlace:*

- *[Guía de instalación de Docker en Ubuntu](https://docs.docker.com/engine/install/ubuntu/ "https://docs.docker.com/engine/install/ubuntu/")*

---

#### ***Paso 2: Configuración post-instalación de Docker***

- *Tras la instalación, es recomendable realizar algunas configuraciones adicionales para que el usuario pueda ejecutar Docker sin necesidad de usar `sudo` y para asegurar que Docker se inicie automáticamente. Puedes seguir los pasos de post-instalación en el siguiente enlace:*

- *[Guía de post-instalación para Docker en Linux](https://docs.docker.com/engine/install/linux-postinstall/ "https://docs.docker.com/engine/install/linux-postinstall/")*

---

#### ***Paso 3: Verificar la versión de Docker Compose***

- *Una vez instalado Docker, puedes verificar que Docker Compose también esté instalado correctamente. Docker Compose es una herramienta que permite definir y gestionar aplicaciones multi-contenedor. Verifica su versión con el siguiente comando:*

```bash
docker compose version
```

- *La salida debería ser algo como esto, dependiendo de la versión instalada:*

```bash
Docker Compose version v2.29.2
```

---

### ***Instalar Node.js y npm***

- *Node.js es un entorno de ejecución para JavaScript que permite ejecutar código en el servidor. npm es el gestor de paquetes predeterminado de Node.js, y te permite instalar dependencias y gestionar tus proyectos. Aquí se explica cómo instalar Node.js y npm tanto en Arch Linux como en Ubuntu.*

---

#### ***Instalación en Arch Linux (y derivadas)***

- **Para instalar Node.js y npm en sistemas basados en Arch Linux, usa el siguiente comando:**

```bash
sudo pacman -Syu --noconfirm nodejs npm
```

---

#### ***Instalación en Ubuntu***

- **En Ubuntu, es recomendable utilizar un script proporcionado por NodeSource para asegurarse de que instalas la versión correcta de Node.js. Los pasos son los siguientes:**

1. **Descargar y ejecutar el script de NodeSource:**

   ```bash
   cd ~
   curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
   sudo bash /tmp/nodesource_setup.sh
   ```

2. **Instalar Node.js y npm:**

   ```bash
   sudo apt install -y nodejs
   ```

- *Este método instala la versión 20.x de Node.js junto con npm.*
