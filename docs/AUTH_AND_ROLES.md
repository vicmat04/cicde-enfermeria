# Auth and Roles

## Proveedor

Utilizar Supabase Auth.

No implementar autenticacion personalizada.

---

# Roles

## ADMIN

Puede:

- crear contenido;
- editar contenido;
- gestionar fuentes;
- crear preguntas;
- editar preguntas;
- publicar evaluaciones;
- consultar resultados de estudiantes;
- gestionar cuentas habilitadas.

## STUDENT

Puede:

- consultar contenido publicado;
- realizar practicas;
- realizar evaluaciones;
- realizar simulacros;
- consultar sus resultados;
- consultar sus errores;
- consultar su progreso;
- utilizar funciones educativas habilitadas.

---

# profiles

Cada usuario de auth.users tendra un registro en public.profiles.

profiles.id = auth.users.id

---

# Creacion de perfil

Al crear una cuenta debe crearse automaticamente su perfil.

El rol predeterminado sera:

STUDENT

La asignacion de ADMIN no debe depender de datos enviados libremente desde el navegador.

---

# Row Level Security

RLS debe habilitarse en tablas sensibles.

## STUDENT

Puede leer y modificar solamente:

- su perfil permitido;
- sus intentos;
- sus respuestas;
- su progreso;
- sus revisiones de flashcards.

Puede leer:

- areas activas;
- temas activos;
- lecciones publicadas/verificadas;
- fuentes permitidas;
- preguntas cuando formen parte de una practica autorizada.

No puede:

- modificar respuestas correctas;
- modificar preguntas;
- modificar fuentes;
- modificar contenido;
- consultar intentos de otros estudiantes.

## ADMIN

Puede administrar contenido mediante politicas seguras y operaciones del servidor.

---

# Seguridad de respuestas

La respuesta correcta de una pregunta no debe enviarse al navegador antes de que corresponda mostrar la correccion.

Para simulacros:

- el cliente recibe la pregunta y opciones;
- la respuesta se registra;
- la correccion final ocurre de forma confiable en servidor/base de datos.

---

# Service Role

SUPABASE_SERVICE_ROLE_KEY nunca debe exponerse al navegador.

Solo puede utilizarse en entorno seguro de servidor cuando sea necesario.

---

# Variables de entorno previstas

NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY

*Nota: `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` reemplaza a la llave `NEXT_PUBLIC_SUPABASE_ANON_KEY` (legacy anon key) como convención moderna en este proyecto.*

Variables secretas adicionales se agregaran solamente cuando una funcionalidad del servidor las necesite.

Los archivos .env.local no deben subirse a Git.
