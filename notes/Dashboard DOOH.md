# Dashboard DOOH Maps (PANEL-DOOH)

Frontend administrativo para operar cotizaciones DOOH (Digital Out-Of-Home), tratamiento de inventarios y validación geográfica de pantallas.

## Stack Tecnológico

| Capa           | Tecnología                                          |
| -------------- | --------------------------------------------------- |
| Frontend       | React 19 + Vite 8 + Tailwind CSS 4 + React Router 7 |
| API            | PHP 8 externa en `ntpmedia.com.mx`                  |
| Mapas          | Google Maps JS API (`@googlemaps/js-api-loader`)    |
| Excel          | SheetJS (`xlsx`) con import dinámico                |
| Virtualización | `react-window` para listados grandes                |

## Estado del Repositorio

El proyecto contiene **solo el frontend**. No hay carpetas `/api` ni `/database`. La autenticación y persistencia viven en la API PHP externa:
- `https://www.ntpmedia.com.mx/Dooh/dooh_api`

## Estructura del Proyecto

```
PANEL-DOOH/
├── docs/
│   ├── project-structure.md     # Documentación de arquitectura
│   └── api-contract.md          # Contrato de API
├── src/
│   ├── config/
│   │   └── env.js               # Variables de entorno
│   ├── services/
│   │   ├── apiClient.js         # Cliente HTTP centralizado (fetch + Bearer token)
│   │   ├── locationsApi.js      # CRUD de ubicaciones (legacy)
│   │   └── googleMapsLoader.js  # Cargador de Google Maps API
│   ├── routes/
│   │   ├── AppRouter.jsx        # Definición de rutas
│   │   └── RutaPrivada.jsx      # Guard de autenticación y roles
│   ├── components/
│   │   ├── layout/
│   │   │   ├── DisenoAplicacion.jsx  # Layout principal
│   │   │   └── Encabezado.jsx        # Header con navegación
│   │   └── ui/
│   │       ├── Boton.jsx             # Botón reutilizable
│   │       ├── Tarjeta.jsx           # Contenedor tipo card
│   │       ├── CampoTexto.jsx        # Input/Textarea/Select
│   │       └── EtiquetaEstado.jsx    # Badge de estado
│   └── features/
│       ├── autenticacion/        # Login, contexto, API auth
│       ├── panel/                # Dashboard principal
│       ├── cotizaciones/         # Nueva cotización e historial
│       ├── tratamiento/          # Grilla editable + operaciones matemáticas
│       ├── usuarios/             # CRUD de usuarios del sistema
│       ├── mapa-cliente/         # Google Maps + Street View
│       ├── excel-import/         # Parser de Excel/CSV (SheetJS)
│       └── locations/            # Utilidades de coordenadas
```

## Rutas Principales

| Ruta                                        | Módulo         | Descripción                    |
| ------------------------------------------- | -------------- | ------------------------------ |
| `/login`                                    | Autenticación  | Inicio de sesión               |
| `/panel`                                    | Panel          | Dashboard principal            |
| `/cotizaciones/nueva`                       | Cotizaciones   | Nueva cotización con Excel     |
| `/cotizaciones/historial`                   | Cotizaciones   | Historial de cotizaciones      |
| `/cotizaciones/:id/tratamiento`             | Tratamiento    | Edición de pantallas y cálculos |
| `/cotizaciones/:id/mapa`                    | Mapa Cliente   | Vista de mapa + Street View    |
| `/usuarios`                                 | Usuarios       | Administración de usuarios     |

## Módulos

### 1. Autenticación

- Login con email/contraseña via `POST /login.php`
- Validación de sesión con `GET /session.php`
- Token JWT guardado en `localStorage` (`dooh_auth_token`)
- Modo mock activado con `VITE_AUTH_MOCK=true`
- Roles: `administrador` (acceso total) y otros roles con permisos restringidos

### 2. Dashboard (Panel Principal)

- Tarjetas de acceso rápido a cada módulo
- Módulo "Usuarios" visible solo para administradores

### 3. Cotizaciones

- **Nueva Cotización**: Carga de archivo Excel/CSV, parser automático, vista previa de ubicaciones, y envío a API
- **Historial**: Listado con filtros (búsqueda, usuario creador, estado)

### 4. Tratamiento (Edición)

- Grilla editable con operaciones matemáticas en vivo (suma, resta, multiplicación, división, porcentaje)
- Cálculo de CPM e inversión
- Detección de cambios y actualización por lotes
- Resumen de presupuesto

### 5. Mapa Cliente

- Google Maps con marcadores `AdvancedMarkerElement`
- Street View integrado
- Listado virtualizado de pantallas con búsqueda
- Filtro por pantallas activas

### 6. Usuarios

- Tabla de usuarios con roles, estado de credenciales, último acceso
- Solo accesible para rol `administrador`

### 7. Importación de Excel
- Soporte para `.xlsx`, `.xls`, `.csv`
- Detección automática de hoja de inventario
- Reconocimiento inteligente de columnas por sinónimos
- Validación de coordenadas
- Diagnóstico técnico del parser

## API Endpoints

### Autenticación
| Método | Endpoint          | Descripción            |
| ------ | ----------------- | ---------------------- |
| POST   | `/login.php`      | Iniciar sesión         |
| GET    | `/session.php`    | Validar sesión         |
| POST   | `/logout.php`     | Cerrar sesión          |
| GET    | `/health.php`     | Health check           |

### Cotizaciones
| Método | Endpoint                          | Descripción                        |
| ------ | --------------------------------- | ---------------------------------- |
| GET    | `/cotizaciones.php`               | Listar cotizaciones (con filtros)  |
| POST   | `/cotizaciones.php`               | Crear cotización                   |
| GET    | `/cotizacion.php?id=:id`          | Obtener detalle                    |
| PUT    | `/cotizacion.php?id=:id`          | Actualizar cotización              |
| DELETE | `/cotizacion.php?id=:id`          | Archivar cotización                |

### Batch (creación/actualización masiva)
| Método | Endpoint                             | Descripción                       |
| ------ | ------------------------------------ | --------------------------------- |
| POST   | `/cotizaciones_iniciar.php`          | Iniciar lote de creación          |
| POST   | `/pantallas_lote.php`                | Enviar lote de pantallas          |
| POST   | `/cotizaciones_finalizar.php`        | Finalizar lote                    |
| POST   | `/cotizaciones_actualizar_iniciar.php` | Iniciar lote de actualización   |
| POST   | `/pantallas_cambios_lote.php`        | Enviar cambios por lote           |

### Usuarios
| Método | Endpoint        | Descripción          |
| ------ | --------------- | -------------------- |
| GET    | `/usuarios.php` | Listar usuarios      |
| POST   | `/usuarios.php` | Crear usuario        |

### Mapas
| Método | Endpoint           | Descripción                     |
| ------ | ------------------ | ------------------------------- |
| GET    | `/maps_config.php` | Obtener API key y Map ID        |

## Variables de Entorno

```env
VITE_API_BASE_URL=https://www.ntpmedia.com.mx/Dooh/dooh_api
VITE_AUTH_MOCK=false
VITE_GOOGLE_MAPS_API_KEY=tu_api_key
```

| Variable                 | Descripción                                    |
| ------------------------ | ---------------------------------------------- |
| `VITE_API_BASE_URL`      | URL base de la API PHP externa                 |
| `VITE_AUTH_MOCK`         | `true` usa mock, `false` usa API real          |
| `VITE_GOOGLE_MAPS_API_KEY` | API Key de Google Maps                      |

## Flujo de Cotización

1. Usuario carga archivo Excel/CSV en `/cotizaciones/nueva`
2. Parser detecta hoja, encabezados y columnas automáticamente
3. Se muestra vista previa con ubicaciones detectadas
4. Usuario ingresa nombre de campaña y cliente
5. Se envía a API: `POST /cotizaciones.php` → batch de pantallas
6. Redirección a `/cotizaciones/:id/tratamiento`
7. Usuario edita datos, aplica operaciones matemáticas
8. Cambios enviados a API con detección de diferencias
9. Se genera mapa para vista del cliente

## Mantenimiento

### Agregar funcionalidad
- Seguir organización por feature: `features/<modulo>/`
- Componentes compartidos en `components/ui/`
- API calls en `features/<modulo>/services/`

### Convenciones del código
- Todo en **español**: componentes, funciones, variables, comentarios
- API fields en inglés por compatibilidad con backend
- Feature-based organization (cada módulo autocontenido)
- Import dinámico de librerías pesadas (`xlsx`)
- Logs solo en desarrollo (`import.meta.env.DEV`)

### Troubleshooting

| Problema                              | Posible causa                        | Solución                                |
| ------------------------------------- | ------------------------------------ | --------------------------------------- |
| Login no funciona                     | API caída o `VITE_AUTH_MOCK=false`   | Verificar API en `ntpmedia.com.mx`      |
| Mapas no cargan                       | API key inválida o bloqueada         | Verificar `VITE_GOOGLE_MAPS_API_KEY`    |
| `ERR_BLOCKED_BY_CLIENT`               | Brave / adblock bloqueando Maps      | Desactivar bloqueo para el sitio        |
| Excel no se parsea                    | Formato de columnas no reconocido    | Usar diagnóstico del parser             |
| Cotización no se guarda               | Error en API batch                   | Revisar logs de red y consola           |
| Grilla de tratamiento no carga        | `cotizacionId` inválido              | Verificar ID en la URL y en BD          |



