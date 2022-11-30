

- TPE2 API REST    -      Montagne tienda de ropa

- Endpoint principal:
    http://localhost/[TU CARPETA]/api/

- Que puedo hacer con este API?
    Ver los productos con detalle, ver un producto en concreto, ordenar la lista de productos, aniadir un producto, eliminar un producto. 

- Verbos HTTP implementados:
    GET, POST, DELETE.
    
- Importante:
    Para aniadir (POST) o eliminar (DELETE) un producto necesitas validar el token. (user: admin - passw: admin)
    Para ver (GET) o ordenar los productos, no es necesario validar token.


** ENDPOINTS **

    GET        - /api/product       (Trae todos los productos)
    GET        - /api/product?sort  (Trae todos los productos ordenados (parametros permitidos: ASC o DESC))
    GET        - /api/product/:ID   (Trae un producto especifico por ID)
    DELETE     - /api/product       (Elimina un producto especifico por ID (Es necesario tener el token))
    POST       - /api/product       (Agrega un elemento (Es necesario tener el token))

    GET        -/api/auth/token     (Crea un token para poder modificar la bbdd (user: admin - pass:admin) Metodo: Basic auth)

** ORDENAR **

    Podes visualizar la columna que quieras de forma ordenada ascendente o descendente:

    api/producto/product?sort=ASC&column=[COLUMNA]    -> Ascendente
    api/producto/product?sort=DESC&column=[COLUMNA]   -> Descendente

    Las columnas pueden ser:
    - Nombre        (nombre)
    - Precio        (precio)
    - Descripcion   (descripcion)
    - ID            (id_producto)


** POST **

    Para aniadir un producto, necesitas formatearlo a JSON. Un ejemplo:

    {
    "nombre" : "TEST",
    "precio" : 20,
    "id_categoriaFK" : 2,
    "descripcion" : "TEST"
    }   

** OBTENER TOKEN **

    Para generar un token y tener acceso a aniadir o eliminar un producto:
    1 - Accede a /api/auth/token , en Postman autentificate via Basic Token con el siguiente login: user:admin passw:admin. Vas a recibir un Bearer token.
    2 - Cuando quieras aniadir o eliminar un producto, en el apartado "Authorization" ingresa el token via Bearer token y vas a tener acceso.


** EJEMPLOS DE ENDPOINTS PARA LOS PRODUCTOS **

http://localhost:8888/tpe2/api/product ((GET PARA TODOS LOS PRODUCTOS))

http://localhost:8888/tpe2/api/product/1 ((GET PARA UN SOLO PRODUCTO))

http://localhost:8888/tpe2/api/product?sort=ASC&column=precio ((GET DE UN PRODUCTO ORDENADO ASCENDENTE SEGUN SU CAMPO PRECIO))

http://localhost:8888/tpe2/api/product/1    ((DELETE DEL PRODUCTO 1))

http://localhost:8888/tpe2/api/product (( ADD DE UN PRODUCTO))

    {
    "nombre" : "TEST",
    "precio" : 111,
    "id_categoriaFK" : 1,
    "descripcion" : "TEST"
    }


** EJEMPLOS DE ENDPOINTS PARA EL TOKEN DE USUARIO**

http://localhost:8888/tpe2/api/auth/token   ((USER: admin PASSW: admin))




    










