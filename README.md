# Tienda API

API REST desarrollada en **.NET 8**, con **autenticación JWT**, persistencia mediante **Entity Framework Core** y arquitectura en **4 capas**.

---

## Requisitos previos

Instalar:

- [.NET 8 SDK]
- [SQL Server]
- [Visual Studio 2022]
- [Insomnia]

---

## Ejecución local

### 1) Descargar el código fuente

1. Hacer clic en el botón verde **"Code"** y luego seleccionar  
   **"Download ZIP"**.
2. Descomprimir el archivo ZIP en una carpeta local.
3. Abrir la solución `Tienda.sln` en **Visual Studio 2022**.

---

### 2) Configurar la cadena de conexión

Abrir el archivo:
```
Tienda.Api/appsettings.json
```

Y ajustar el nombre del servidor SQL local:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=REEMPLAZAR;Database=TiendaDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
```

> Reemplaza `REEMPLAZAR` por el nombre de la instancia local de SQL Server,  

---

### 3) Crear la base de datos

1. Abrir **SQL Server Management Studio (SSMS)**.  
2. Ejecutar el script `Tienda.sql` incluido en el repositorio.  
   Este script crea la base de datos `TiendaDB` y sus tablas.

---

## Ejecución

Ejecutar el proyecto principal **Tienda.Api**.  
Por defecto, la API correrá en:
```
https://localhost:{puerto}
```

> El puerto puede variar según el entorno local.  
> Verifica la URL mostrada en la consola de Visual Studio.

---

## Autenticación

Para generar un **token JWT**, realiza un login:

- **Método:** `POST`  
- **URL:** `https://localhost:7232/api/Auth/login`  
- **Body (JSON):**
  ```json
  {
    "correo": "admin@correo.com",
    "contrasena": "1234"
  }
  ```

---

## Colección de Endpoints

### Artículos

| Método | Endpoint | Descripción |
|:--------|:----------|:-------------|
| **GET** | `/api/Articulo` | Obtener todos los artículos |
| **GET** | `/api/Articulo/{id}` | Obtener artículo por ID |
| **GET** | `/api/Articulo/buscar/{descripcion}` | Buscar artículo por descripción |
| **GET** | `/api/Articulo/tienda/{idTienda}` | Obtener artículos por tienda |
| **POST** | `/api/Articulo` | Crear un nuevo artículo |
| **PUT** | `/api/Articulo/{id}` | Actualizar artículo existente |
| **DELETE** | `/api/Articulo/{id}` | Eliminar artículo |

**Ejemplo de creación:**
```json
{
  "codigo": "A001",
  "descripcion": "Mouse inalámbrico Logitech",
  "precio": 299.99,
  "imagen": "mouse.jpg",
  "stock": 10
}
```

---

### Clientes

| Método | Endpoint | Descripción |
|:--------|:----------|:-------------|
| **GET** | `/api/Clientes` | Obtener todos los clientes |
| **GET** | `/api/Clientes/{id}` | Obtener cliente por ID |
| **GET** | `/api/Clientes/buscar?nombre=Juan` | Buscar cliente por nombre |
| **POST** | `/api/Clientes` | Crear un nuevo cliente |
| **PUT** | `/api/Clientes/{id}` | Actualizar cliente existente |
| **DELETE** | `/api/Clientes/{id}` | Eliminar cliente |

**Ejemplo de creación:**
```json
{
  "nombre": "Juan",
  "apellidos": "Pérez",
  "direccion": "Calle 123",
  "correo": "juan@gmail.com",
  "contrasena": "123456"
}
```

---

### Tienda

| Método | Endpoint | Descripción |
|:--------|:----------|:-------------|
| **GET** | `/api/Tienda` | Obtener todas las tiendas |
| **GET** | `/api/Tienda/{id}` | Obtener tienda por ID |
| **POST** | `/api/Tienda` | Crear una tienda |
| **PUT** | `/api/Tienda/{id}` | Actualizar tienda |
| **DELETE** | `/api/Tienda/{id}` | Eliminar tienda |
| **POST** | `/api/Tienda/{idTienda}/agregar-articulo/{idArticulo}` | Agregar artículo a una tienda |

**Ejemplo de creación:**
```json
{
  "sucursal": "Sucursal Centro",
  "direccion": "Av. Hidalgo 123"
}
```

---

### Carrito

| Método | Endpoint | Descripción |
|:--------|:----------|:-------------|
| **GET** | `/api/carrito/{idCliente}` | Obtener el carrito del cliente |
| **POST** | `/api/carrito/crear/{idCliente}` | Crear un carrito para un cliente |
| **POST** | `/api/carrito/{idCliente}/agregar` | Agregar artículos al carrito |
| **POST** | `/api/carrito/{idCliente}/finalizar` | Finalizar la compra |
| **DELETE** | `/api/carrito/vaciar/{idCliente}` | Vaciar el carrito |
| **DELETE** | `/api/carrito/{idCliente}/articulo/{idArticulo}` | Eliminar un artículo del carrito |

**Ejemplo de agregar artículo:**
```json
{
  "idArticulo": 2,
  "cantidad": 1
}
```

---

### Login

| Método | Endpoint | Descripción |
|:--------|:----------|:-------------|
| **POST** | `/api/Auth/login` | Iniciar sesión y obtener token JWT |

**Ejemplo:**
```json
{
  "correo": "juan@gmail.com",
  "contrasena": "123456"
}
```

---

## Ejemplos de uso rápido

- **Listar artículos:**
  ```
  GET https://localhost:7232/api/Articulo
  ```
- **Buscar cliente:**
  ```
  GET https://localhost:7232/api/Clientes/buscar?nombre=Juan
  ```
- **Agregar artículo al carrito:**
  ```
  POST https://localhost:7232/api/carrito/1/agregar
  ```

---

## Tecnologías y librerías

- **.NET 8 Web API**
- **Entity Framework Core** (Database First)
- **SQL Server**
- **JWT Bearer Authentication**
- **AutoMapper**
- **Arquitectura 4 capas**  
  (API – Negocio – Datos – Entidades)

---

## Autor

**Tienda API**  
Desarrollado como demostración de evaluación y buenas prácticas en .NET.

📧 Contacto: [ytchris@outlook.com]  
🌐 GitHub: [https://github.com/christrabajo1]
