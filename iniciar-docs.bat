@echo off
REM Documentacao da API de Integracao Comercial (Rhyla) - previa com recarga em http://localhost:3333
cd /d "%~dp0"

where node >nul 2>nul
if errorlevel 1 (
  echo Node.js nao encontrado. Instale com: winget install OpenJS.NodeJS.LTS
  pause
  exit /b 1
)

if not exist "node_modules\rhyla" (
  echo Instalando dependencias...
  call npm.cmd install
)

start "" http://localhost:3333
call npm.cmd run dev
pause
