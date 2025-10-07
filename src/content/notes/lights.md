# 💡 Automatizaciones de Luces

**Sistema:** Apple HomeKit | **Última actualización:** 2025-10-06

## 📋 Todas las Automatizaciones

| Nombre | Inicio | Fin | Días | Estado |
|--------|--------|-----|------|--------|
| Torre Luz Madrugada | 2:20 AM | 4:00 AM | Todos los días | ✅ |
| Hora de Almuerzo | 11:55 AM | 1:00 PM | Lun-Vie | ✅ |
| Hora De Atardecer | 5:50 PM | 6:45 PM | Todos los días | ✅ |
| Alumbrar Cocina | 6:50 PM | 11:00 PM | Todos los días | ✅ |
| Luz De Escalera Caracol | 6:50 PM | 4:00 AM | Todos los días | ✅ |
| Luz Fogata Terraza | 6:50 PM | 4:00 AM | Todos los días | ✅ |
| Luz Noche Interna | 6:50 PM | 11:00 PM | Todos los días | ✅ |

## 🤖 JSON para AI

```json
{
  "system": "Apple HomeKit",
  "total": 7,
  "all_active": true,
  "automations": [
    {"name": "Torre Luz Madrugada", "start": "02:20", "end": "04:00", "days": "daily", "zone": "torre"},
    {"name": "Hora de Almuerzo", "start": "11:55", "end": "13:00", "days": "weekdays", "zone": "general"},
    {"name": "Hora De Atardecer", "start": "17:50", "end": "18:45", "days": "daily", "zone": "general"},
    {"name": "Alumbrar Cocina", "start": "18:50", "end": "23:00", "days": "daily", "zone": "cocina"},
    {"name": "Luz De Escalera Caracol", "start": "18:50", "end": "04:00", "days": "daily", "zone": "escalera"},
    {"name": "Luz Fogata Terraza", "start": "18:50", "end": "04:00", "days": "daily", "zone": "terraza"},
    {"name": "Luz Noche Interna", "start": "18:50", "end": "23:00", "days": "daily", "zone": "interior"}
  ]
}
```
