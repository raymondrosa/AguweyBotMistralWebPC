@echo off
title AguweyBot - Actualizador
color 0E

echo ========================================
echo    ACTUALIZANDO AGUWEYBOT
echo ========================================
echo.

if not exist "aguweybot_env" (
    echo ❌ Entorno virtual no encontrado
    echo 📝 Ejecuta primero: aguweybot_install.bat
    pause
    exit /b 1
)

echo 🔄 Activando entorno virtual...
call aguweybot_env\Scripts\activate.bat

echo.
echo 📦 Actualizando pip...
python -m pip install --upgrade pip

echo.
echo 📦 Actualizando dependencias...
pip install --upgrade streamlit mistralai PyPDF2 python-docx pandas chardet gTTS Pillow

echo.
echo ✅ Actualización completada
echo.
echo 📊 Versiones instaladas:
pip show streamlit | findstr Version
pip show mistralai | findstr Version

echo.
pause