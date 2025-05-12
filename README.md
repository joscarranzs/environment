# Configuración inicial

Este documento describe los pasos para configurar un entorno de desarrollo utilizando Fedora, Alacritty, Fish, Neovim, y otros. Sigue cada una de las fases a continuación para garantizar que todo funcione correctamente.

## Fase 1: Actualizar el sistema e instalar herramientas esenciales

1. **Actualizar el sistema**:
   ```bash
   sudo dnf update -y
   ```

2. **Instalar herramientas esenciales para desarrollo**:
   ```bash
   sudo dnf install -y build-essential git
   ```

## Fase 2: Descargar fuente compatible

1. **Descarga la fuente Iosevka, compatible con el entorno de desarrollo**:
Puedes obtenerla desde el sitio oficial de Nerd Fonts.

2. **Una vez descargada, instala la fuente en tu sistema descomprimiendo los archivos y haciendo clic derecho en los `.ttf` para instalarlos**.

## Fase 3: Descargar e instalar Alacritty

1. **Instala Alacritty utilizando DNF**:
   ```bash
   sudo dnf install -y alacritty
   ```

2. **Verifica la instalación**:
   ```bash
   alacritty --version
   ```

## Fase 4: Configurar Alacritty y Homebrew

1. **Configura Alacritty**:
Crea un archivo de configuración para Alacritty en `~/.config/alacritty/alacritty.yml` y personalízalo según tus necesidades.

2. **Descargar e instalar Homebrew**:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. **Verifica la instalación**:
   ```bash
   brew --version
   ```

4. **Añade Homebrew al PATH para que esté disponible globalmente**:
   ```bash
   echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
   ```

## Fase 5: Descargar e instalar Fish (utilizando Brew)

1. **Instala el shell Fish usando Homebrew**:
   ```bash
   brew install fish
   ```

2. **Verifica si la instalación fue correcta**:
   ```bash
   fish --version
   ```

3. **Comprueba si Fish está en la lista de shells permitidos**:
   ```bash
   cat /etc/shells
   ```
   Si no aparece, añádelo manualmente:
   ```bash
   echo '/home/linuxbrew/.linuxbrew/bin/fish' | sudo tee -a /etc/shells
   ```

4. **Cambia tu shell predeterminado a Fish**:
   ```bash
   chsh -s /home/linuxbrew/.linuxbrew/bin/fish
   ```

5. **Añade Fish al PATH global**:
   ```bash
   set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
   ```

6. **Añade Homebrew al PATH de Fish**:
   ```bash
   echo 'set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths' >> ~/.config/fish/config.fish
   ```

## Fase 6: Instalar plugins de Fish

1. **Instala el gestor de plugins Fisher en Fish**:
   ```bash
   curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
   ```

2. **Instala los siguientes plugins de Fish**:
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

## Fase 7: Instalar herramientas adicionales

1. **Instala las siguientes herramientas utilizando Homebrew**:
   ```bash
   brew install git gcc fzf eza lazygit lsd maven openjdk ripgrep fd mysql go zlib-devel
   ```
   Nota: Para evitar errores, instala las herramientas de 3 en 3 o una por una si es necesario.

2. **Inicializa las configuraciones globales de Git**:
   ```bash
   git config --global user.name "joscarranzs"
   git config --global user.email "tu-correo-generico@example.com"
   ```

## Fase 8: Instalar Neovim

1. **Instala Neovim usando Homebrew**:
   ```bash
   brew install neovim
   ```

2. **Clona las configuraciones desde el repositorio de inicio**:
   ```bash
   git clone https://github.com/tu-repo-de-configs/nvim-config.git ~/.config/nvim
   ```

3. **Abre Neovim para que se carguen las configuraciones**:
   ```bash
   nvim
   ```

## Fase 9: Instalación y configuración de Tmux

1. **Instala Tmux utilizando Homebrew**:
   ```bash
   brew install tmux
   ```

2. **Copia el archivo de configuración de Tmux en la raíz del sistema**:
   ```bash
   cp /ruta/a/tu/config/tmux.conf ~/.tmux.conf
   ```

   Asegúrate de reemplazar `/ruta/a/tu/config/tmux.conf` con la ruta real del archivo de configuración de Tmux que deseas usar.
