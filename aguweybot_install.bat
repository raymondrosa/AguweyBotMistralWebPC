@echo off
title AguweyBot - Instalador y Lanzador
color 0A

echo ========================================
echo    AGUWEYBOT CON MINISTRAL-3
echo    Asistente Inteligente con IA
echo ========================================
echo.

:: Verificar si Python está instalado
echo [1/5] Verificando Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python no está instalado.
    echo 📥 Por favor, instala Python desde: https://www.python.org/downloads/
    echo    (Asegurate de marcar "Add Python to PATH" durante la instalacion)
    pause
    exit /b 1
)
echo ✅ Python encontrado
python --version
echo.

:: Verificar si existe el entorno virtual
echo [2/5] Configurando entorno virtual...
if not exist "aguweybot_env" (
    echo Creando entorno virtual...
    python -m venv aguweybot_env
    echo ✅ Entorno virtual creado
) else (
    echo ✅ Entorno virtual ya existe
)
echo.

:: Activar entorno virtual e instalar dependencias
echo [3/5] Instalando dependencias...
call aguweybot_env\Scripts\activate.bat

:: Actualizar pip
python -m pip install --upgrade pip

:: Instalar requerimientos
pip install streamlit>=1.28.0
pip install mistralai==0.4.2
pip install PyPDF2>=3.0.0
pip install python-docx>=1.0.0
pip install pandas>=2.0.0
pip install chardet>=5.0.0
pip install gTTS>=2.3.0
pip install Pillow>=10.0.0

echo.
echo ✅ Dependencias instaladas
echo.

:: Verificar archivo de configuración
echo [4/5] Verificando configuracion...
if not exist ".streamlit" (
    mkdir .streamlit
    echo 📝 Carpeta .streamlit creada
)

if not exist ".streamlit\secrets.toml" (
    echo.
    echo ⚠️  Archivo de configuracion no encontrado!
    echo.
    echo Creando archivo secrets.toml...
    (
        echo # AguweyBot - Configuracion de Mistral AI
        echo # Obtén tu API Key en: https://console.mistral.ai/
        echo.
        echo MISTRAL_API_KEY = "tu-api-key-aqui"
    ) > .streamlit\secrets.toml
    echo ✅ Archivo creado: .streamlit\secrets.toml
    echo.
    echo 🔑 IMPORTANTE: Edita el archivo y agrega tu API Key de Mistral
    echo    Ruta: .streamlit\secrets.toml
    echo.
    echo    Abriendo archivo para edicion...
    timeout /t 2 >nul
    notepad .streamlit\secrets.toml
)

:: Verificar archivos del bot
echo.
echo [5/5] Verificando archivos del bot...
if not exist "aguweybotweb.py" (
    echo ❌ No se encuentra el archivo aguweybotweb.py
    echo 📂 Asegurate de tener el archivo en la misma carpeta que este instalador
    pause
    exit /b 1
)
echo ✅ Archivo del bot encontrado
echo.

:: Menú de opciones
echo ========================================
echo    CONFIGURACION COMPLETA
echo ========================================
echo.
echo ¿Que deseas hacer?
echo.
echo [1] Iniciar AguweyBot (Modo Normal)
echo [2] Iniciar AguweyBot (Modo Desarrollo - con logs)
echo [3] Actualizar dependencias
echo [4] Verificar API Key
echo [5] Salir
echo.
set /p opcion="Selecciona una opcion (1-5): "

if "%opcion%"=="1" goto iniciar_normal
if "%opcion%"=="2" goto iniciar_dev
if "%opcion%"=="3" goto actualizar
if "%opcion%"=="4" goto verificar_key
if "%opcion%"=="5" goto salir

:iniciar_normal
echo.
echo ========================================
echo    INICIANDO AGUWEYBOT...
echo ========================================
echo.
echo 🚀 Abriendo el navegador en http://localhost:8501
echo.
echo 💡 Consejos:
echo    - Presiona Ctrl+C para detener el bot
echo    - Los archivos cargados se procesan localmente
echo    - Las respuestas pueden tomar unos segundos
echo.
echo ========================================
echo.
call aguweybot_env\Scripts\activate.bat
streamlit run aguweybotweb.py
goto fin

:iniciar_dev
echo.
echo ========================================
echo    INICIANDO EN MODO DESARROLLO...
echo ========================================
echo.
echo 🐛 Modo debug activado - Mostrando logs detallados
echo.
call aguweybot_env\Scripts\activate.bat
streamlit run aguweybotweb.py --server.runOnSave true --logger.level debug
goto fin

:actualizar
echo.
echo ========================================
echo    ACTUALIZANDO DEPENDENCIAS...
echo ========================================
echo.
call aguweybot_env\Scripts\activate.bat
pip install --upgrade streamlit mistralai PyPDF2 python-docx pandas chardet gTTS Pillow
echo.
echo ✅ Actualizacion completada
echo.
pause
goto menu

:verificar_key
echo.
echo ========================================
echo    VERIFICANDO API KEY...
echo ========================================
echo.
if exist ".streamlit\secrets.toml" (
    echo ✅ Archivo de configuracion encontrado
    echo.
    echo 📄 Contenido del archivo:
    echo ----------------------------------------
    type .streamlit\secrets.toml
    echo ----------------------------------------
    echo.
    echo 🔍 Verificando si la API Key esta configurada...
    findstr /c:"tu-api-key-aqui" .streamlit\secrets.toml >nul
    if errorlevel 1 (
        echo ✅ La API Key parece estar configurada
        echo.
        echo 🧪 Probando conexion con Mistral AI...
        call aguweybot_env\Scripts\activate.bat
        python -c "from mistralai.client import MistralClient; import streamlit as st; import os; exec(open('.streamlit/secrets.toml').read()); client = MistralClient(api_key=MISTRAL_API_KEY); print('✅ Conexion exitosa con Mistral AI!')" 2>nul
        if errorlevel 1 (
            echo ❌ Error de conexion. Verifica tu API Key
        ) else (
            echo ✅ Conexion exitosa con Mistral AI!
        )
    ) else (
        echo ❌ La API Key no ha sido configurada
        echo 📝 Edita el archivo .streamlit/secrets.toml y agrega tu API Key
        echo    Obtén tu key en: https://console.mistral.ai/
    )
) else (
    echo ❌ Archivo de configuracion no encontrado
)
echo.
pause
goto menu

:salir
echo.
echo 👋 ¡Hasta luego!
goto fin

:menu
cls
goto inicio_menu

:fin
echo.
echo ========================================
echo    AGUWEYBOT CERRADO
echo ========================================
pause