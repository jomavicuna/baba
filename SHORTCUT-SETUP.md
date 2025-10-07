# 🌱 Baba Sync - Configuración del Botón

## 📱 Crear el Shortcut (3 minutos)

### **Paso 1: Abrir Shortcuts App**

1. Presiona `Cmd + Espacio`
2. Escribe: **"Shortcuts"**
3. Presiona `Enter`

---

### **Paso 2: Crear Nuevo Shortcut**

1. Click en el botón **`+`** (arriba a la derecha)
2. O presiona `Cmd + N`

---

### **Paso 3: Configurar el Shortcut**

Vas a agregar **2 acciones**:

#### **Acción 1: Run Shell Script**

1. En la barra de búsqueda de acciones, escribe: **"run shell"**
2. Arrastra **"Run Shell Script"** al área de trabajo
3. Configura:
   - **Input:** Ninguno (deja en blanco)
   - **Shell:** `/bin/bash`
   - **Script:**
     ```bash
     /Users/vicuna/home/astro/baba/sync-now.sh
     ```
   - **Pass Input:** Never (o "Nunca")

Debería verse así:
```
┌─────────────────────────────────────┐
│ Run Shell Script                    │
│                                     │
│ Shell: /bin/bash                    │
│                                     │
│ /Users/vicuna/home/astro/baba/     │
│ sync-now.sh                         │
│                                     │
│ Pass Input: Never                   │
└─────────────────────────────────────┘
```

---

### **Paso 4: Nombrar el Shortcut**

1. Click en el nombre **"Shortcut"** (arriba)
2. Cámbialo a: **"🌱 Sync Baba"**

---

### **Paso 5: Agregar Icono y Color**

1. Click derecho en el shortcut (en la lista izquierda)
2. Selecciona **"Choose Icon"** o **"Elegir icono"**
3. Busca el icono de: **🌱** (planta/seedling)
   - O usa: 🚀, 📤, ☁️, 🔄
4. Click en **"Choose Color"** o **"Elegir color"**
5. Selecciona **Verde**

---

### **Paso 6: Guardar**

1. Presiona `Cmd + S`
2. O click en "Done" / "Listo"

---

## 🎯 **Opciones de Acceso al Botón**

Ahora que tienes el Shortcut, hay **3 formas** de usarlo:

---

### **Opción A: Botón en Barra de Menú** ⭐ MÁS CONVENIENTE

#### Requiere: macOS Shortcuts en Menu Bar (gratis)

**Pasos:**

1. Abre **System Settings** / **Configuración del Sistema**
2. Ve a **Privacy & Security** > **Accessibility**
3. Activa **Shortcuts** (si no está)
4. Cierra Settings

5. Abre **Shortcuts app** nuevamente
6. Click derecho en tu shortcut **"🌱 Sync Baba"**
7. Selecciona **"Pin to Menu Bar"** o **"Anclar en barra de menú"**

**Resultado:**
```
Barra superior: [🍎] ... [🌱] [🔋] [⏰]
                        ↑
                   Click aquí
```

---

### **Opción B: App en Dock**

**Pasos:**

1. En Shortcuts app
2. Click derecho en **"🌱 Sync Baba"**
3. Selecciona **"Add to Dock"** / **"Agregar al Dock"**

**Resultado:**
```
Dock: [Chrome] [Obsidian] [🌱] [Slack]
                           ↑
                      Click aquí
```

---

### **Opción C: Spotlight / Raycast**

Ya funciona automáticamente:

1. Presiona `Cmd + Espacio`
2. Escribe: **"sync baba"**
3. Presiona `Enter`

---

## 🎨 **Experiencia al Usar el Botón**

### **Cuando haces click:**

```
1. Click en 🌱
   ↓
2. 🔔 Notificación:
   "🚀 Sincronizando notas..."
   ↓
3. (Script corre en background)
   ↓
4. (15 segundos después)
   ↓
5. 🔔 Notificación:
   "✅ 3 archivo(s) publicados en Vercel"
```

### **Si no hay cambios:**
```
1. Click en 🌱
   ↓
2. 🔔 Notificación:
   "✨ No hay cambios para sincronizar"
```

### **Si hay error:**
```
1. Click en 🌱
   ↓
2. 🔔 Notificación:
   "❌ Error al hacer push a GitHub"
```

---

## 🧪 **Probar el Shortcut**

### **Prueba 1: Sin cambios**

1. Click en el botón **🌱**
2. Deberías ver: **"✨ No hay cambios para sincronizar"**

### **Prueba 2: Con cambios**

1. Abre Obsidian
2. Edita cualquier archivo (ej: `pills.md`)
3. Agrega una línea: `- Test desde botón`
4. Guarda (`Cmd + S`)
5. Click en el botón **🌱**
6. Deberías ver:
   - **"🚀 Sincronizando notas..."**
   - (15s después)
   - **"✅ 1 archivo(s) publicados en Vercel"**

---

## 🔧 **Troubleshooting**

### **Problema: No aparece notificación**

**Solución:**
1. Abre **System Settings**
2. **Notifications** > **Shortcuts**
3. Activa **"Allow Notifications"**
4. Selecciona estilo **"Banners"** o **"Alerts"**

### **Problema: "Permission denied"**

**Solución:**
1. Verifica que el script sea ejecutable:
   ```bash
   ls -la /Users/vicuna/home/astro/baba/sync-now.sh
   ```
   Debe mostrar: `-rwxr-xr-x` (con `x`)

2. Si no, ejecuta:
   ```bash
   chmod +x /Users/vicuna/home/astro/baba/sync-now.sh
   ```

### **Problema: Shortcut no corre**

**Solución:**
1. Abre **Shortcuts app**
2. Click derecho en **"🌱 Sync Baba"**
3. **Run** (para probar manualmente)
4. Si funciona → todo bien
5. Si no funciona → revisa el path del script

---

## 📊 **Comparativa Final**

| Método | Pasos | Tiempo | Dónde |
|--------|-------|--------|-------|
| **Botón Barra Menú** | 1 click | 15s | Cualquier app |
| **Botón Dock** | 1 click | 15s | Desde Dock |
| **Spotlight** | Cmd+Space + "sync" + Enter | 15s | Cualquier lugar |
| **Watcher** | 0 (automático) | 60s | Background |
| **Terminal** | Abrir + comando | 10s | Terminal |

---

## ✅ **Siguiente Paso**

1. Sigue los pasos de arriba para crear el Shortcut
2. Elige dónde quieres el botón (Barra de Menú / Dock / Spotlight)
3. Pruébalo
4. ¡Listo!

**Tiempo total de setup: 3-5 minutos**

---

## 🎯 **Workflow Final**

```
Tu día normal:

1. Abres Obsidian
2. Escribes/editas notas
3. Guardas con Cmd+S
4. (Cuando quieras publicar)
5. Click en 🌱 en barra de menú
6. 🔔 Notificación de confirmación
7. Sigues trabajando
8. (1 minuto después está online)
```

**Simple, rápido, visual.**
