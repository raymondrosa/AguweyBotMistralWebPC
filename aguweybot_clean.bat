@echo off
title AguweyBot - Limpiar Instalación
color 0C

echo ========================================
echo    LIMPIANDO INSTALACIÓN
echo ========================================
echo.
echo ⚠️  Esto eliminará el entorno virtual y todos los archivos temporales
echo.
set /p confirm="¿Estás seguro? (s/n): "

if /i not "%confirm%"=="s" (
    echo Operación cancelada
    pause
    exit /b 0
)

echo.
echo 🗑️  Eliminando entorno virtual...
if exist "aguweybot_env" (
    rmdir /s /q aguweybot_env
    echo ✅ Entorno virtual eliminado
)

echo.
echo 🗑️  Eliminando caché de Python...
if exist "__pycache__" (
    rmdir /s /q __pycache__
)
for /d /r . %%d in (__pycache__) do @if exist "%%d" rmdir /s /q "%%d"

echo.
echo 🧹 Limpieza completada
echo.
echo 📝 Para reinstalar, ejecuta: aguweybot_install.bat
echo.

pause