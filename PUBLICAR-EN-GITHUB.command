#!/bin/bash
# Doble clic para publicar la landing en GitHub.
# Solo te pedirá la URL del repositorio que creaste (vacío) en github.com
# y, la primera vez, abrirá el navegador para autorizar tu cuenta de GitHub.

cd "$(dirname "$0")" || exit 1

echo "=================================================="
echo "   Publicar MagicStick Landing en GitHub"
echo "=================================================="
echo ""
echo "Antes de continuar, crea un repositorio VACÍO en:"
echo "   https://github.com/new"
echo "   (Nombre sugerido: magicstick-landing  |  Public  |  SIN README)"
echo ""
read -r -p "Pega aquí la URL del repo (ej. https://github.com/tuusuario/magicstick-landing.git): " REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "No ingresaste una URL. Cancelado."
  read -r -p "Enter para cerrar..." _
  exit 1
fi

# Configura el remote (lo reemplaza si ya existía)
git remote remove origin 2>/dev/null
git remote add origin "$REPO_URL"
git branch -M main

echo ""
echo ">> Subiendo archivos... (si es la primera vez, se abrirá el navegador para autorizar)"
if git push -u origin main; then
  echo ""
  echo "=================================================="
  echo "  LISTO. Archivos subidos correctamente."
  echo "=================================================="
  echo ""
  echo "Ultimo paso (en el navegador):"
  echo "  1. Abre tu repo en GitHub -> Settings -> Pages"
  echo "  2. En 'Source' elige: Deploy from a branch"
  echo "  3. Branch: main  /  carpeta: / (root)  -> Save"
  echo "  4. Espera ~1 min. Tu link sera:"
  echo "     https://TU-USUARIO.github.io/$(basename "$REPO_URL" .git)/"
else
  echo ""
  echo "!! Hubo un problema al subir. Revisa la URL y que el repo este vacio."
fi

echo ""
read -r -p "Enter para cerrar esta ventana..." _
