# Handoff: MagicStick Landing Page (Fungi Feeling)

## Overview
Landing page de una sola página para **MagicStick**, chocolatina artesanal con hongos funcionales de la dulcería **Fungi Feeling**. Concepto de marca: **"Vuelve a Creer"**. Experiencia inmersiva, oscura y mágica: videos de fondo, scroll-driven animations, partículas doradas. Todo CTA de compra dirige a WhatsApp.

## About the Design Files
Los archivos de este paquete son **referencias de diseño creadas en HTML** — prototipos que muestran el look y comportamiento previsto, NO código de producción para copiar directamente. La tarea es **recrear estos diseños en el entorno del codebase destino** (React, Next.js, Vue, Astro, etc.) usando sus patrones y librerías establecidas — o, si no existe entorno aún, elegir el framework más apropiado (sugerencia: Next.js/React o Astro con React islands para las animaciones).

`MagicStick Landing.dc.html` usa un runtime propietario de la herramienta de diseño (`support.js`, tags `<x-dc>`, `<sc-for>`, `{{ holes }}`) — **ignora el runtime; lee el markup, los estilos inline y la clase `Component` al final del archivo como especificación**. La clase JS contiene la lógica exacta de scroll/scrub/reveal a portar.

## Fidelity
**High-fidelity (hifi).** Colores, tipografía, espaciado, copy e interacciones son finales. Recrear pixel-perfect.

## Screens / Views
Página única con 6 bloques, en orden:

### 1. Navbar (fija, transparente)
- `position:fixed; top:0; z-index:100`, flex space-between, padding `14px 28px`.
- Izquierda: logo Fungi Feeling (`assets/LOGO FungiFeel.png`, alto 44px) dentro de una píldora: fondo `rgba(20,12,38,.55)`, `backdrop-filter:blur(14px)`, borde `1px solid rgba(246,196,83,.18)`, radio 999px.
- Derecha: píldora igual (borde `rgba(255,255,255,.08)`) con links "Beneficios", "El Proceso", "Elige tu ritual" (anchors a `#beneficios`, `#proceso`, `#ritual`; Manrope 14.5px/700, color `#e9defc`, hover: fondo `rgba(180,92,240,.18)` + color blanco) y botón CTA WhatsApp dorado (ver Design Tokens → botones).

### 2. Hero (`#hero`, 100vh)
- Fondo: video `assets/Banner Principal.mp4` (object-fit cover, `filter:brightness(.75) saturate(1.05)`), **pausado**, controlado por scroll (ver Interactions).
- Overlays: gradiente lineal 100deg de `rgba(13,8,23,.88)` → `.55` → `.15` → `.55`; radial dorado `rgba(246,196,83,.10)` en 30% 70%; capa de ~26 partículas doradas parpadeantes (ver Interactions).
- Contenido a la izquierda (max-width 720px, padding `120px 6vw 80px`, gap 28px):
  - Logo MagicStick (`assets/LOGO MAGIC STICK.png`, `width:min(240px,50vw)`), animación float 6s (translateY ±14px, rotate ±2deg), `drop-shadow(0 12px 30px rgba(124,58,237,.5))`.
  - H1 Baloo 2 800, `clamp(64px,9.5vw,148px)`, line-height .92: "VUELVE" blanco / "A CREER" en `#f6c453` con `text-shadow:0 0 46px rgba(246,196,83,.55)`.
  - Párrafo (copy exacto): "No se trata de creer en algo externo. Se trata de creer en ti. En esa parte tuya que aún sueña, que aún se sorprende, que aún cree que todo es posible. Esa magia sigue ahí. Solo hace falta volver a ella." — Manrope `clamp(16px,1.4vw,19px)`, line-height 1.65, `rgba(243,237,255,.88)`, max-width 520px.
  - Botón CTA morado "Pedir por WhatsApp" (ver tokens).
  - Hint itálico 12.5px `rgba(243,237,255,.45)`: "Haz scroll para descubrir la magia ✨".

### 3. Manifiesto (`#manifiesto`, alto 170vh, inner sticky 100vh)
- Sección de `min-height:170vh`; dentro, contenedor `position:sticky; top:0; height:100vh` centrado.
- Fondo: video `assets/Proceso.mp4` autoplay + muted + loop, `filter:brightness(.45) saturate(1.1)`; overlay radial `rgba(13,8,23,.25)` centro → `.85` bordes.
- 5 líneas de texto centradas (max-width 880px, gap 26px, `perspective:900px`), que aparecen secuencialmente con el scroll (ver Interactions). Copy exacto:
  1. "Había una magia que olvidamos cómo ver."
  2. "No desapareció. Solo dejamos de creer en ella."
  3. "MagicStick despierta esa parte de ti que el mundo adulto silenció."
  4. "Cacao ancestral y hongos funcionales, unidos en un solo ritual."
  5. "No es magia de cuento. Es la que siempre estuvo dentro de ti." ← línea énfasis: dorada `#f6c453`, más grande, `text-shadow:0 0 40px rgba(246,196,83,.4)`.
- Tipografía líneas: Baloo 2 700, `clamp(21px,2.4vw,34px)`; línea énfasis 800, `clamp(26px,3.2vw,44px)`; line-height 1.3.

### 4. Beneficios (`#beneficios`)
- Fondo gradiente `#0d0817 → #150d26 → #0d0817`, padding `130px 6vw`. Glow ambiental: elipse radial dorada `rgba(246,196,83,.09)` 900×500px arriba-centro, pulso de opacidad .35↔.7 en 7s.
- Eyebrow centrado: "Lo que despierta en ti" — 13px/700, letter-spacing .25em, uppercase, `#f6c453`.
- Grid `repeat(auto-fit,minmax(230px,1fr))`, gap 26px, 4 tarjetas:
  - **Creatividad** — "La mente se abre a lo que antes no veías."
  - **Conexión** — "Con vos mismo, con los demás, con algo más grande."
  - **Claridad** — "El ruido se apaga y lo esencial aparece."
  - **Enfoque** — "Un solo punto de atención, sin fricción."
- Tarjeta: padding `34px 28px`, fondo `rgba(255,255,255,.03)`, borde `1px solid rgba(255,255,255,.08)`, radio 20px. Palabra: Baloo 2 800 `clamp(28px,2.6vw,38px)` blanco. Divisor 44×3px gradiente `#f6c453→#b45cf0`. Descripción: Manrope 15.5px, `rgba(243,237,255,.72)`.
- Reveal escalonado al entrar en viewport (ver Interactions).

### 5. La Fórmula (`#proceso`)
- Fondo `#080510` (negro casi puro, sección de pausa), padding `130px 6vw`. Grid 2 columnas (1fr 1fr, gap 60px, max-width 960px) — apilar en mobile.
- Columna izquierda: eyebrow "La Fórmula" (13px/700, .25em, uppercase, `#b45cf0`); H2 Baloo 2 800 `clamp(36px,4vw,56px)`: "Magia antigua." blanco + "Forma nueva." dorado; párrafo: "Los hongos funcionales han acompañado al ser humano desde antes de la memoria escrita. Nosotros solo les dimos una nueva forma: la de una chocolatina que cabe en tu ritual diario."
- Columna derecha: 3 tarjetas apiladas (gap 16px): padding `24px 26px`, fondo `rgba(255,255,255,.02)`, borde `rgba(255,255,255,.1)`, radio 18px. Hover: borde `rgba(246,196,83,.5)` + `translateX(6px)`. Contenido (etiqueta 11.5px/700 .2em uppercase dorada / nombre Baloo 2 700 24px / desc Manrope 14.5px `rgba(243,237,255,.65)`):
  - Capa 1 → **Origen** — "Cacao real, sin atajos."
  - Capa 2 → **Fusión propia** — "Nuestra mezcla exclusiva de hongos funcionales."
  - Capa 3 → **Experiencia** — "Claridad, conexión y magia en cada mordisco."
- Reveal: tarjetas entran desde la derecha (translateX 50px→0) escalonadas.

### 6. Elige tu ritual (`#ritual`)
- Fondo gradiente `#080510 → #160d28 → #0d0817`, padding `130px 6vw`; glow morado radial `rgba(180,92,240,.12)` abajo-centro.
- H2 centrado Baloo 2 800 `clamp(38px,4.5vw,60px)`: "Elige tu **ritual**" (ritual en dorado).
- Grid `repeat(auto-fit,minmax(300px,1fr))`, gap 32px, 2 tarjetas de producto:
  - Tarjeta: fondo `rgba(255,255,255,.03)`, radio 24px, overflow hidden. Hover: `translateY(-6px)` + glow shadow. Área de imagen de producto 280px alto (en el prototipo es un `<image-slot>` drag-and-drop; en producción, `<img>` con la foto real). Cuerpo padding 28px, gap 14px.
  - **MagicStick Grande** (acento dorado `#f6c453`, borde `rgba(246,196,83,.25)`): "60 gr" / "3 gr de hongos funcionales" / precio "$110.000 COP" Baloo 2 800 36px dorado / botón dorado → `https://wa.me/573107608070?text=Hola%2C%20quiero%20pedir%20mi%20MagicStick%20Grande%20%F0%9F%8D%AB%E2%9C%A8`
  - **MagicStick Pequeña** (acento morado `#b45cf0`, borde `rgba(180,92,240,.3)`): "15 gr" / "0.5 gr de hongos funcionales" / precio "$65.000 COP" morado / botón morado → `https://wa.me/573107608070?text=Hola%2C%20quiero%20pedir%20mi%20MagicStick%20Peque%C3%B1a%20%F0%9F%8D%AB%E2%9C%A8`
  - Título tarjeta: Baloo 2 800 27px blanco; gramaje 12px/700 .12em en color de acento; sublínea Manrope 14.5px `rgba(243,237,255,.65)`.

### 7. Footer
- `min-height:70vh`, fondo: video `assets/Hand_holding_glowing_chocolate_bar_202607052121.mp4` autoplay + muted + loop, `brightness(.55)`; overlay gradiente vertical `rgba(13,8,23,.92) → .45 → .9`.
- Contenido centrado (max-width 820px, gap 28px): logo Fungi Feeling (`width:min(220px,55vw)`); párrafo "Creamos dulces con propósito: que cada mordisco te recuerde que la magia no se busca afuera, se despierta desde adentro."; botón CTA dorado WhatsApp; línea de copyright sobre borde superior `rgba(255,255,255,.1)`: "© 2024–2026 Fungi Feeling. Todos los derechos reservados." (13px, `rgba(243,237,255,.45)`).

## Interactions & Behavior

### Hero — video scrub por scroll
- El video del hero NUNCA se reproduce; se controla `currentTime` por scroll.
- Al cargar: `currentTime = min(duration - 0.1, 4)` (empieza en el segundo 4; el clip dura ~4s, así que arranca en su último fotograma).
- En scroll: `progress = clamp(scrollY / innerHeight, 0, 1)`; `targetTime = min(duration-0.1, 4) - 3 * progress` (baja del seg. 4 al seg. 1).
- Suavizado: loop `requestAnimationFrame` que hace lerp `currentTime += (targetTime - currentTime) * 0.14`, con umbral de 0.035s para no escribir cada frame.
- Forzar `video.muted = true` por JS además del atributo (autoplay policies).

### Partículas doradas (hero)
- ~26 divs absolutos: posiciones pseudo-aleatorias determinísticas (`left = i*37.7 % 100 %`, `top = i*53.3 % 100 %`), tamaño 2–5px, círculo dorado `#f6c453` con `box-shadow: 0 0 8px 2px rgba(246,196,83,.55)`.
- Keyframe twinkle: opacity .15→.9→.15 + scale .7→1.2, duración 3–6s, delays escalonados, infinito. `pointer-events:none`.

### Manifiesto — aparición scroll-driven
- Progress `p = clamp(-rect.top / (rect.height - innerHeight), 0, 1)` de la sección 170vh (listener de scroll con rAF throttle).
- Por línea i (n=5): `start = i/(n+1.2)`; `t = clamp((p - start) * (n+1.2) * 0.9, 0, 1)`; ease-out cúbico `e = 1-(1-t)^3`.
- Estilo por línea: `opacity: .04 + e*.96`; `transform: rotateX((1-e)*28deg) translateY((1-e)*50px) scale(.9 + e*.1)`; `transform-origin: center bottom`; contenedor con `perspective: 900px`.

### Reveals (Beneficios y Fórmula)
- IntersectionObserver, `threshold: 0.25`, dispara una sola vez.
- Beneficios: `opacity 0→1` + `translateY(40px)→0`, transición `.7s cubic-bezier(.2,.7,.3,1)`, delay `i*0.13s`.
- Fórmula: igual pero `translateX(50px)→0`, delay `i*0.15s`.

### Botones y links
- Todos los CTA abren WhatsApp en pestaña nueva (`target="_blank" rel="noopener"`).
- Hover botones: glow (`box-shadow: 0 0 28–40px rgba(acento,.4–.5)`) + leve translateY/scale, transición .3s.
- Navegación: anchors con `scroll-behavior:smooth` en `html`.

## State Management
- `manifestoProgress: number` (0–1, derivado de scroll; solo re-render si delta > 0.004).
- `benefitsIn: boolean`, `formulaIn: boolean` (IntersectionObserver, one-shot).
- `targetTime: number` (mutable, fuera del state — lo consume el rAF loop del hero).
- Sin data fetching. Sin formularios.
- Flags opcionales del prototipo: `scrubHero` (si false, el video hero pasa a autoplay/loop) y `showParticles`.

## Design Tokens

### Colores
- Fondo base: `#0d0817` (morado noche) · variantes de sección: `#080510`, `#150d26`, `#160d28`
- Texto principal: `#f3edff` · blanco puro `#fff` en títulos
- Texto secundario: `rgba(243,237,255,.65–.9)` según jerarquía
- Dorado (acento primario): `#f6c453`, gradiente botón `#f6c453 → #e8a93a`, texto sobre dorado: `#241238`
- Morado (acento secundario): `#b45cf0`, gradiente botón `#b45cf0 → #8b3fd6`
- Bordes/paneles: `rgba(255,255,255,.02–.1)` sobre fondos oscuros

### Tipografía (Google Fonts)
- Display/títulos: **Baloo 2** — 600/700/800
- Cuerpo: **Manrope** — 400/500/600/700/800
- Escala: eyebrows 11.5–13px (uppercase, tracking .12–.25em) · cuerpo 14.5–19px · nombres tarjeta 24–27px · precios 36px · H2 clamp(36–60px) · H1 clamp(64–148px)

### Espaciado y forma
- Padding secciones: `130px 6vw` (hero `120px 6vw 80px`)
- Gaps: 14–32px en tarjetas/grids, 56–60px entre bloques de sección
- Radios: pills/botones 999px · tarjetas 18–24px
- Botones: padding `14–16px 24–34px`, Baloo 2 700 17–19px

## Assets (incluidos en `/assets`)
- `Banner Principal.mp4` — video hero (≈4s, scrub por scroll)
- `Proceso.mp4` — video manifiesto (≈8s, loop)
- `Hand_holding_glowing_chocolate_bar_202607052121.mp4` — video footer (≈8s, loop)
- `LOGO FungiFeel.png` — logo Fungi Feeling (navbar + footer). Usar tal cual, no redibujar.
- `LOGO MAGIC STICK.png` — logo MagicStick (hero). Usar tal cual.
- Fotos de producto: **pendientes del cliente** — en el prototipo son placeholders drag-and-drop.
- Icono WhatsApp: path SVG inline (ver prototipo) o el ícono oficial del design system que use el codebase.

## Files
- `MagicStick Landing.dc.html` — prototipo completo (markup + estilos inline + lógica JS al final del archivo).
- `image-slot.js` — componente placeholder de imagen del prototipo (solo referencia; en producción usar `<img>` reales).
- `assets/` — videos y logos listos para producción.
