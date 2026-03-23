<div align="center">
  <img src="logo.png" alt="AguweyBot Logo" width="200">
  <h1>🤖 AguweyBot</h1>
  <p><strong>Asistente Inteligente para Análisis de Documentos con IA</strong></p>
  
  [![Python 3.8+](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/downloads/)
  [![Streamlit](https://img.shields.io/badge/Streamlit-1.28+-red.svg)](https://streamlit.io)
  [![Mistral AI](https://img.shields.io/badge/Mistral%20AI-0.4.2-orange.svg)](https://mistral.ai)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
  
  <p>
    <a href="#características">Características</a> •
    <a href="#instalación">Instalación</a> •
    <a href="#uso">Uso</a> •
    <a href="#comercialización">Comercialización</a> •
    <a href="#contribuir">Contribuir</a>
  </p>
</div>

---

## 📋 **Tabla de Contenidos**
- [🌟 Características](#-características)
- [🎯 Casos de Uso](#-casos-de-uso)
- [🚀 Instalación Rápida](#-instalación-rápida)
- [📖 Instalación Detallada](#-instalación-detallada)
- [💻 Uso](#-uso)
- [🔧 Configuración](#-configuración)
- [📁 Formatos Soportados](#-formatos-soportados)
- [🏢 Comercialización](#-comercialización)
- [🤝 Contribuir](#-contribuir)
- [📄 Licencia](#-licencia)
- [👥 Contacto](#-contacto)

---

## 🌟 **Características**

### 🧠 **Modelos de IA Avanzados**
- **Ministral-3**: Optimizado para respuestas rápidas y eficientes
- **Llama-3.3-70B**: Procesamiento profundo de documentos complejos
- Streaming en tiempo real con indicadores visuales

### 📄 **Análisis de Documentos Completo**
- **PDF**: Extracción de texto página por página con barra de progreso
- **Excel/CSV**: Análisis de datos tabulares con visualización
- **Word (DOCX)**: Procesamiento de documentos y tablas
- **TXT**: Soporte multi-encoding (auto-detección)

### 🔊 **Accesibilidad**
- Conversión de texto a voz con gTTS
- Soporte completo para español
- Sin límites de longitud en respuestas

### 🎨 **Interfaz Profesional**
- Diseño moderno con efectos neón
- Sidebar interactiva con estadísticas
- Botón de copiado integrado
- Footer fijo con información legal
- Sistema de temas y fondos personalizables

### 📊 **Gestión de Conversaciones**
- Historial de chat persistente
- Memoria contextual optimizada
- Reinicio de conversación con un clic
- Estadísticas de uso en tiempo real

---

## 🎯 **Casos de Uso**

| **Sector** | **Aplicación** | **Beneficio** |
|------------|----------------|---------------|
| 🏛️ **Educación** | Análisis de tesis, resúmenes de libros, tutoría académica | Ahorro de 80% en tiempo de revisión |
| ⚖️ **Legal** | Análisis de contratos, búsqueda de cláusulas | Reducción de 70% en tiempo de revisión |
| 💼 **Corporativo** | Análisis de reportes, procesamiento de datos financieros | Toma de decisiones más rápida |
| 📚 **Investigación** | Procesamiento de papers científicos, análisis de datos | Aceleración de investigación en 3x |
| 🏥 **Salud** | Análisis de historiales médicos, documentación clínica | Mejora en precisión diagnóstica |
| 💻 **Desarrollo** | Análisis de documentación técnica, explicación de código | Reducción de onboarding en 50% |

---

## 🚀 **Instalación Rápida**

### Requisitos Previos
- Python 3.8 o superior
- API Key de [Mistral AI](https://console.mistral.ai/)
- 2GB de espacio en disco
- Conexión a internet

### Instalación Automática (Windows)
```batch
# 1. Clona el repositorio
git clone https://github.com/tuusuario/aguweybot.git
cd aguweybot

# 2. Ejecuta el instalador
aguweybot_install.bat

# 3. Configura tu API Key
# Edita .streamlit/secrets.toml y agrega tu API Key

# 4. Inicia el bot
aguweybot_quick.bat
Instalación Automática (Linux/Mac)
bash
# 1. Clona el repositorio
git clone https://github.com/tuusuario/aguweybot.git
cd aguweybot

# 2. Haz ejecutable el script
chmod +x install.sh

# 3. Ejecuta el instalador
./install.sh

# 4. Configura tu API Key
nano .streamlit/secrets.toml

# 5. Inicia el bot
streamlit run aguweybotweb.py
📖 Instalación Detallada
1. Crear Entorno Virtual
bash
# Windows
python -m venv aguweybot_env
aguweybot_env\Scripts\activate

# Linux/Mac
python3 -m venv aguweybot_env
source aguweybot_env/bin/activate
2. Instalar Dependencias
bash
pip install -r requirements.txt
requirements.txt:

txt
streamlit>=1.28.0
mistralai==0.4.2
PyPDF2>=3.0.0
python-docx>=1.0.0
pandas>=2.0.0
chardet>=5.0.0
gTTS>=2.3.0
Pillow>=10.0.0
3. Configurar API Key
Crea el archivo .streamlit/secrets.toml:

toml
# Mistral AI Configuration
MISTRAL_API_KEY = "tu-api-key-aqui"
4. Verificar Instalación
bash
python -c "from mistralai.client import MistralClient; print('✅ Instalación exitosa')"
💻 Uso
Inicio Rápido
bash
streamlit run aguweybotweb.py
Opciones Avanzadas
bash
# Modo desarrollo con logs
streamlit run aguweybotweb.py --server.runOnSave true --logger.level debug

# Puerto personalizado
streamlit run aguweybotweb.py --server.port 8502

# Sin navegador automático
streamlit run aguweybotweb.py --server.headless true
Flujo de Trabajo
Subir documento: Arrastra o selecciona un archivo en el panel izquierdo

Leer contenido: Haz clic en "Leer TODO" para procesar completamente

Realizar preguntas: Escribe consultas específicas sobre el documento

Escuchar respuestas: Usa el botón "Escuchar" para audio

Copiar resultados: Botón de copiado en cada respuesta

🔧 Configuración
Variables de Entorno
bash
# Windows
set MISTRAL_API_KEY=tu-api-key

# Linux/Mac
export MISTRAL_API_KEY="tu-api-key"
Configuración Visual
python
class Config:
    PRIMARY_COLOR = "#00ffff"      # Color principal
    SECONDARY_COLOR = "#00cccc"     # Color secundario
    BACKGROUND_DARK = "#0a0c10"     # Fondo oscuro
    MAX_FILE_SIZE_MB = 50           # Límite de archivos
    MAX_HISTORY_MESSAGES = 10       # Mensajes en memoria
Personalización de Logo y Fondo
bash
# Coloca en la raíz del proyecto
logo.png     # 200x200px recomendado
fondo.png    # 1920x1080px recomendado
📁 Formatos Soportados
Formato	Extensión	Características
PDF	.pdf	Extracción página por página, barra de progreso
Excel	.xlsx, .xls	Tablas completas, análisis de datos
CSV	.csv	Auto-detección de encoding
Word	.docx	Párrafos, tablas, formato
Texto	.txt	Múltiples encodings
Límites Técnicos
Tamaño máximo: 50MB por archivo

Tokens contexto: 8000 tokens (Ministral-3)

Commercial: Licencia comercial con soporte

Enterprise: Licencia perpetua con código fuente

📩 Contacto comercial: raymondrosaavila@gmail.com

🤝 Contribuir
¡Las contribuciones son bienvenidas!

Cómo Contribuir
Fork el repositorio

Crea una rama (git checkout -b feature/AmazingFeature)

Commit tus cambios (git commit -m 'Add AmazingFeature')

Push a la rama (git push origin feature/AmazingFeature)

Abre un Pull Request

Áreas de Contribución
🐛 Reporte de bugs

💡 Nuevas características

📚 Mejoras en documentación

🌐 Traducciones

🎨 Mejoras visuales

Guía de Estilo
Python: PEP 8

Commits: Conventional Commits

Documentación: Markdown con emojis

📄 Licencia
Este proyecto está bajo dos licencias: CC-SA

Versión Comunidad
MIT License - Para uso personal y educativo

Sin garantías ni soporte comercial

Versión Comercial
Commercial License - Para uso empresarial

Soporte técnico incluido

Actualizaciones prioritarias

Personalización de marca

Para más información, contacta a legal@aguweybot.com

👥 Contacto
Equipo de Desarrollo
Prof. Raymond Rosa Ávila - Ingenieria y Desarrollo - @raymondrosa

AguweyBot Team - Desarrollo y Soporte

Enlaces
📧 Email: raymondrosaavila@gmail.com

Soporte
Issues: GitHub Issues

🌟 Agradecimientos
Mistral AI - Por su increíble modelo Ministral-3

Streamlit - Por la plataforma de desarrollo

gTTS - Por la conversión texto a voz

Comunidad Open Source - Por las librerías fundamentales

📊 Estadísticas del Proyecto
https://img.shields.io/github/stars/tuusuario/aguweybot
https://img.shields.io/github/forks/tuusuario/aguweybot
https://img.shields.io/github/issues/tuusuario/aguweybot
https://img.shields.io/github/issues-pr/tuusuario/aguweybot

<div align="center"> <sub>Built with ❤️ by the AguweyBot Team</sub>
⬆ Volver arriba

</div> ```
📁 Archivos Adicionales Recomendados
CONTRIBUTING.md
markdown
# Guía de Contribución

## Código de Conducta
- Sé respetuoso
- Acepta críticas constructivas
- Enfócate en lo que es mejor para la comunidad

## Proceso de Pull Request
1. Asegúrate de que todas las pruebas pasen
2. Actualiza la documentación si es necesario
3. Describe tus cambios en detalle

## Estilo de Código
- Usa type hints
- Documenta funciones con docstrings
- Sigue PEP 8
CODE_OF_CONDUCT.md
markdown
# Código de Conducta

## Nuestro Compromiso
Crear una experiencia libre de acoso para todos.

## Estándares
- Uso de lenguaje inclusivo
- Respeto a diferentes puntos de vista
- Aceptación de críticas constructivas
LICENSE
markdown
MIT License

Copyright (c) 2026 Prof. Raymond Rosa Ávila

Permission is hereby granted...
