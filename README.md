# Configuraciones para entorno de desarrollo

## Fase uno: Instalación de WSL y Ubuntu
1. Instalar WSL con la terminal de Windows:
    ```powershell
    wsl --install
    ```
2. Configurar WSL en la versión 2:
    ```powershell
    wsl --set-default-version 2
    ```
3. Instalar la última versión de Ubuntu desde la Microsoft Store o usando el siguiente comando:
    ```powershell
    wsl --install -d Ubuntu-22.04
    ```

## Fase dos: Actualizar e instalar herramientas esenciales
1. **Actualizar Ubuntu**:
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```
2. **Instalar herramientas esenciales**:
    ```bash
    sudo apt install -y build-essential git curl wget unzip zip xclip
    ```

## Fase tres: Instalar fuentes compatibles con caracteres especiales
1. Descargar la fuente Iosevka desde [Nerd Fonts](https://www.nerdfonts.com/).
2. Descomprimir e instalar la fuente:
    - Descomprimir el archivo descargado.
    - Seleccionar los archivos de fuente `.ttf` o `.otf` y hacer clic derecho para instalar.
3. Verificar que la fuente ha sido instalada correctamente (reiniciar si es necesario).

## Fase cuatro: Descargar e instalar Alacritty
1. Descargar el instalador de Alacritty desde la [página oficial](https://github.com/alacritty/alacritty).
2. Instalar Alacritty siguiendo las instrucciones de la documentación oficial.
3. Verificar que Alacritty se ha instalado correctamente:
    ```bash
    alacritty --version
    ```
4. Copiar las configuraciones de Alacritty a la ruta indicada (para Windows):
    ```text
    C:\Users\jcarr\AppData\Roaming
    ```

## Fase cinco: Descargar e instalar Homebrew
1. Copiar el comando de instalación desde la [página oficial](https://brew.sh) y ejecutarlo:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
2. Agregar Homebrew a la variable de entorno PATH:
    ```bash
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    ```
3. Verificar que Homebrew se ha instalado correctamente:
    ```bash
    brew --version
    ```

## Fase seis: Descargar e instalar Fish usando Homebrew
1. **Instalar Fish**:
    ```bash
    brew install fish
    ```
2. **Verificar que Fish se ha instalado correctamente**:
    ```bash
    fish --version
    ```
3. **Verificar si Fish está en las shells disponibles**:
    ```bash
    cat /etc/shells
    ```
    Si no aparece, añadirlo manualmente:
    ```bash
    echo '/home/linuxbrew/.linuxbrew/bin/fish' | sudo tee -a /etc/shells
    ```
4. **Cambiar la shell predeterminada a Fish**:
    ```bash
    chsh -s /home/linuxbrew/.linuxbrew/bin/fish
    ```
5. **Agregar Homebrew al PATH de Fish**:
    ```bash
    echo 'set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths' >> ~/.config/fish/config.fish
    ```

## Fase siete: Instalar plugins de Fish
1. Instalar Fisher usando el comando de instalación:
    ```bash
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    ```
2. Instalar los siguientes plugins de Fish:
    - **nvm.fish para gestionar versiones de Node.js**:
      ```bash
      fisher install jorgebucaran/nvm.fish
      ```
    - **z para navegación rápida entre directorios**:
      ```bash
      fisher install jethrokuan/z
      ```
    - **tide para un prompt personalizado**:
      ```bash
      fisher install IlanCosman/tide@v5
      ```

## Fase ocho: Instalar herramientas de desarrollo
1. Ejecutar el siguiente comando para instalar las herramientas de desarrollo:
    ```bash
    brew install fzf eza lazygit lsd maven openjdk ripgrep fd mysql go zlib node neovim tmux
    ```
2. Verificar que las herramientas de desarrollo se han instalado correctamente.

## Fase nueve: Configurar Git
1. Configurar Git con el siguiente comando:
    ```bash
    git config --global user.name "joscarranzs"
    git config --global user.email "jcarranzsosa@gmail.com"
    ```

## Fase diez: Copiar las configuraciones bases
1. Copiar el archivo de configuración de Fish a la carpeta de configuración:
    ```bash
    ~/.config/fish/config.fish
    ```
2. Copiar la carpeta de configuración de Neovim:
    ```bash
     ~/.config/nvim
    ```
3. Iniciar Neovim para instalar los plugins (verificar que están instalados Node.js y GCC):
    ```bash
    nvim
    ```
4. Copiar el archivo de configuración de Tmux a la ruta raiz:
    ```bash
    ~/.tmux.conf
    ```
