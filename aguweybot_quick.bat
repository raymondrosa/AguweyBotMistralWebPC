@echo off
title AguweyBot - Modo Rápido
color 0A

echo ========================================
echo    AGUWEYBOT CON MINISTRAL-3
echo ========================================
echo.

:: Verificar entorno virtual
if not exist "aguweybot_env" (
    echo ⚠️  Entorno virtual no encontrado
    echo 📝 Ejecuta primero: aguweybot_install.bat
    pause
    exit /b 1
)

:: Activar entorno virtual
call aguweybot_env\Scripts\activate.bat

:: Verificar archivo de configuración
if not exist ".streamlit\secrets.toml" (
    echo ⚠️  Configuración no encontrada
    echo 📝 Asegurate de configurar tu API Key en .streamlit\secrets.toml
    pause
    exit /b 1
)

:: Verificar API Key configurada
findstr /c:"tu-api-key-aqui" .streamlit\secrets.toml >nul
if not errorlevel 1 (
    echo ⚠️  API Key no configurada
    echo 📝 Edita .streamlit\secrets.toml y agrega tu API Key de Mistral
    pause
    exit /b 1
)

echo 🚀 Iniciando AguweyBot...
echo 📱 Abriendo en: http://localhost:8501
echo.
echo 💡 Presiona Ctrl+C para detener
echo ========================================
echo.

streamlit run aguweybotweb.py