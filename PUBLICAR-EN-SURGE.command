#!/bin/bash
# Doble clic para publicar la landing en Surge.sh (gratis, link permanente).
# La primera vez te pedira un email y una clave para crear tu cuenta (gratis, sin tarjeta).

cd "$(dirname "$0")/_optim" || { echo "No encuentro la carpeta _optim"; read -r _; exit 1; }

echo "=================================================="
echo "   Publicar MagicStick Landing en Surge.sh"
echo "=================================================="
echo ""
echo "Elige el nombre de tu link (solo letras/numeros/guiones)."
echo "Tu pagina quedara en:  NOMBRE.surge.sh"
echo ""
read -r -p "Nombre [magicstick-fungifeeling]: " NAME
NAME="${NAME:-magicstick-fungifeeling}"
# limpia espacios y caracteres raros
NAME=$(echo "$NAME" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9-')
DOMAIN="${NAME}.surge.sh"

echo ""
echo ">> Publicando en https://$DOMAIN ..."
echo "   (La primera vez: escribe tu email y una clave nueva cuando te lo pida)"
echo ""
npx --yes surge ./ "$DOMAIN"

echo ""
echo "=================================================="
echo "  Si ves 'Success!' arriba, tu link ya esta vivo:"
echo "     https://$DOMAIN"
echo "=================================================="
echo ""
echo "Para actualizar la pagina en el futuro, vuelve a hacer doble clic aqui."
echo ""
read -r -p "Enter para cerrar esta ventana..." _
