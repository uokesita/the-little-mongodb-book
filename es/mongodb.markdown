\thispagestyle{empty}
\changepage{}{}{}{-1.5cm}{}{2cm}{}{}{}
![El pequeño libro MongoDB, por Karl Seguin](title.png)\ 

\clearpage
\changepage{}{}{}{1.5cm}{}{-2cm}{}{}{}

## Acerca de este libro ##

### Licencia ###
El pequeño libro MongoDB esta licenciado bajo [Reconocimiento-NoComercial 3.0 Unported (CC BY-NC 3.0)](<http://creativecommons.org/licenses/by-nc/3.0/deed.es_ES>). ** No debiste haber pagado por este libro.**

Eres libre de copiar, distribuir, modificar o mostrar el libro. Sin embargo, pido que siempre atribuyas el libro a mi, Karl Seguin y no lo uses para propósitos comerciales.

Puedes leer el texto completo de la licencia en: 

<http://creativecommons.org/licenses/by-nc/3.0/deed.es_ES>

### Acerca del autor ###
Karl Seguin es un desarrollador con experiencia en varios campos y tecnologías. Es un experto en .NET y desarrollador en ruby. Es un colaborador semi-activo de proyectos OSS, escritor técnico y presentador ocasional. Con respecto a MongoDB, fue un colaborador principal de la librería C# NoRM, escribió el tutorial interactivo [mongly](http://mongly.com) así como el administrador web Mongo [Mongo Web Admin](https://github.com/karlseguin/Mongo-Web-Admin). Su servicio gratuito para desarrolladores de juegos casuales [mogade.com](http://mogade.com/), esta soportado con MongoDB.

Su blog esta en: <http://openmymind.net> y sus tweets vía [@karlseguin](http://twitter.com/karlseguin)

### Agradecimientos ###
Gracias especiales a [Perry Neal](http://twitter.com/perryneal) por prestarme sus ojos, mente y pasión. Me proporciono una ayuda invaluable. Gracias.

### Ultima Versión ###
La ultima versión de este libro esta disponible en:

<http://github.com/karlseguin/the-little-mongodb-book>. (ENG)
<https://github.com/uokesita/the-little-mongodb-book> (ESP)

\clearpage

## Introducción ##
 > No es mi culpa que los capítulos sean cortos, MongoDB solo es fácil de aprender.

A menudo se dice que la tecnología avanza a rápidamente. Es cierto que hay una creciente lista de nuevas tecnologías y técnicas que son liberadas. Sin embargo, desde hace mucho tiempo siempre he sido de la opinión de que las tecnologías fundamentales utilizadas por los programadores se mueven a un ritmo más bien lento. Uno podría pasar años aprendiendo poco pero seguir siendo relevantes. 

Lo que es sorprendente es la velocidad a la que las tecnologías tradicionales son reemplazadas. Al parecer de la noche a la mañana, las tecnologías desde hace tiempo se ven amenazados por cambios en el enfoque de los desarrolladores.

Nada puede ser mas representativo de este cambio repentino que el progreso de tecnologías NoSQL contra bases de datos relacionales bien establecidas. Pareciera que un día la web fuera llevada por algunas RDBMS y al siguiente, 5 o mas soluciones NoSQL se han establecido como soluciones dignas.

Aunque estas transiciones parecen ocurrir de la noche a la mañana, la realidad es que puede tomar años en convertirse en practicas aceptadas. El entusiasmo inicial es llevado por un grupo de desarrolladores y compañías relativamente pequeños. Las soluciones son refinadas, lecciones aprendidas y ver que una nueva tecnología esta aquí para quedarse, otros lentamente lo intentan por si mismos. De nuevo, esto es particularmente cierto en el caso de NoSQL donde muchas soluciones no remplazan a las soluciones mas tradicionales de almacenamiento de datos, pero en lugar de eso, se enfocan en necesidades especificas ademas de lo que uno puede obtener de las soluciones tradicionales.

Habiendo dicho todo eso, lo primero que debemos hacer es explicar qué se entiende por NoSQL. Es un término amplio que significa diferentes cosas para diferentes personas. Personalmente, lo uso de manera muy amplia en el sentido de un sistema que interviene en el almacenamiento de datos. Dicho de otra manera, NoSQL (de nuevo, para mí), es la creencia de que la capa de persistencia no es necesariamente la responsabilidad de un solo sistema. Donde los proveedores de bases de datos relacionales históricamente han tratado de posicionar su software como la solución única para todo, NoSQL se inclina hacia unidades más pequeñas de responsabilidad donde la mejor herramienta para un trabajo determinado se puede aprovechar. Por lo tanto, tu stack NoSQL todavía puede aprovechar una bases de datos relacionales, por ejemplo MySQL, pero también puede contener Redis como la persistencia de búsqueda de partes específicas del sistema, así como Hadoop para el procesamiento intensivo de datos.
En pocas palabras, NoSQL se trata de ser abierto y consciente de alternativas existentes y adicionales patrones y herramientas para la gestión de sus datos.

Puedes estarte preguntando donde cae MongoDB en todo esto. Como una base de datos orientada a documentos, Mongo es una solución mas general de NoSQL. Debe ser vista como una alternativa a las bases de datos relacionales. Como las bases de datos relacionales, también puede beneficiarse de la relación con otras soluciones NoSQL mas especializadas. MongoDB tiene ventajas y desventajas que cubriremos en otros capítulos de este libro. 

Como pudiste haber notado, usamos el termino MongoDB y Mongo indistintamente.

## Primeros Pasos ##
La mayoría de este libro se enfoca en el núcleo de la funcionalidad de MongoDB. Por lo tanto usaremos la terminal de MongoDB. La terminal es útil tanto para aprender como para usarla como una herramienta administrativa, tu código usara un driver MongoDB.

Esto trae a colación lo primero que debes saber de MongoDB: sus drivers. MongoDB tiene un numero de [drivers oficiales](http://www.mongodb.org/display/DOCS/Drivers) para varios lenguajes. Estos drivers pueden ser vistos como los diferentes drivers para bases de datos con los cuales probablemente estarás familiarizado. Sobre estos drivers, la comunidad de desarrollo han construido otros frameworks y librerías especificas para ciertos lenguajes. Por ejemplo, [NoRM](https://github.com/atheken/NoRM) es una librería en C# que implementa LINQ, y [MongoMapper](https://github.com/jnunemaker/mongomapper) es una librería ruby que es ActiveRecord-friendly. Así decidas programar directamente contra el núcleo de drivers de MongoDB, o alguna librería de alto nivel, es tu opción. Hago esta acotación solo porque muchas personas que vienen a MongoDB están confundidas sobre porque hay librerias oficiales y librerías de la comunidad, las primeras se enfocan en la comunicacion/conectividad con MongoDB y la segunda esta centrada en las implementaciones de lenguaje/framework especificamente.

Mientras lees este libro, te invito a que juegues con MongoDB para replicar lo que demuestro así como explorar las dudas que puedas tener. Es fácil comenzar con MongoDB, así que tomemos unos minutos para establecer las cosas.

1. Ve a la pagina de [descargas oficial](http://www.mongodb.org/downloads) y toma los binarios de la primera fila (la versión estable recomendada) para tu sistema operativo. Para efectos de desarrollo puedes tomar 32-bit o 64 bit.

2. Extrae el archivo (donde lo desees) y navega a la sub-carpeta `bin`. No ejecutes nada aun, pero ten en cuenta que `mongod` es el proceso para el servidor y `mongo` es la terminal cliente - estos son dos ejecutables en los que pasaremos la mayoría del tiempo.

3. Crea un nuevo archivo de texto en la sub-carpeta `bin` llamado `mongodb.config`

4. Añade una sola linea a tu mongod.config: `dbpath=RUTA_DONDE_QUIERES_GUARDAR_TUS_ARCHIVOS_DE_BASE_DE_DATOS`. Por ejemplo, en Windows podrias hacer `dbpath=c:\mongodb\data` y en Linux `dbpath=/etc/mongodb/data`.

5. Asegúrate que la ruta `dbpath` que especificaste exista.

6. Lanza mongod con el parametro `--config /ruta/a/tu/mongodb.config`

Como ejemplo para usuarios windows, si extrajiste el archivo en `c:\mongodb\` y creaste `c:\mongodb\data\` entonces en `c:\mongodb\bin\mongodb.config` especificaras la ruta `dbpath=c:\mongodb\data\`. Puedes lanzar `mongod` desde la terminal con `c:\mongodb\bin\mongod --config c:\mongodb\bin\mongodb.config`.

Siéntete libre de agregar la carpeta `bin` a tu path para poder lanzar mongod sin estas especificaciones. Usuarios de MacOSX y Linux siguen los mismos pasos. La única cosa que debes cambiar son las rutas. 

Espero que ahora tengas MongoDB corriendo. Si tienes un error, lee la salida con cuidado - el servidor es muy bueno explicando cual es el error.

Ahora puedes lanzar `mongo` (sin la *d*) que conectara tu terminal con el servidor que esta corriendo. Intenta escribir `db.version()` para asegurarte que todo funciona como debe ser. Si todo va bien veras el numero de la versión que has instalado.

\clearpage

## Capitulo 1 - Lo Básico ##
Comenzamos nuestro viaje conociendo la mecánica básica de trabajar con MongoDB. Obviamente este es el núcleo para entender MongoDB, pero también nos ayuda a responder dudas técnicas acerca de MongoDB.

Para comenzar, hay seis simples conceptos que necesitamos entender.

1. MongoDB tiene el mismo concepto de 'base de datos' con el que probablemente estés familiarizado (o un schema para los amigos de Oracle). En una instancia de MongoDB puedes tener cero o mas bases de datos, cada una actuando como un contenedor de alto nivel para todo lo demás.

2. Una base de datos puede tener cero o mas 'colecciones'. Una colección comparte lo suficiente con lo que es tradicionalmente una tabla por lo que puedes pensar en ellas como la misma cosa.

3. Las colecciones están hechas de cero o mas 'documentos'. De nuevo, un documento puede ser visto como una 'fila'.

4. Un documento esta compuesto de uno o mas 'campos', probablemente puedas adivinar que son las 'columnas'.

5. 'Indices' en MongoDB funcionan muy parecido a sus equivalentes en RDBMS.

6. 'Cursores' son un concepto diferente de los otros 5 pero son tan importantes, y comúnmente pasados por alto, que pienso valdría la pena crear un tema de discusión para ellos. Lo importante a entender sobre los cursores es que cuando le pides datos a MongoDB, mongo retorna un cursor, con el que podemos hacer algunas cosas, como contar o saltar algún dato, sin descargarlos de hecho.

Para resumir, MongoDB esta hecho de `bases de datos` que contienen `colecciones`. Una `coleccion` esta hecha de `documentos`. Cada `documento` esta compuesto de `campos`. Las `colecciones` pueden ser indexadas, lo cual mejora la búsqueda y ordenamiento. Finalmente, cuando obtenemos datos de MongoDB lo hacemos a través de un cursor cuya ejecución es retrasada hasta que sea necesario.

Te preguntaras, porque usar una nueva terminología (colecciones vs tablas, documentos vs filas y campos vs columnas). Es solo para hacer las cosas mas complicadas? La verdad es que mientras estos conceptos son similares a sus contrapartes en base de datos relacionales, no son idénticos. La diferencia principal viene del hecho de que las bases de datos relacionales definen `columnas` a nivel de la `tabla` mientras que bases de datos orientadas a documentos definen sus `campos` a nivel de `documento`. Eso es, cada `documento` dentro de una `coleccion` puede tener su propio y único set de `campos`. Por lo tanto una `coleccion` es un contenedor silencioso en comparación a una `tabla`, mientras que un `documento` tiene mucha mas información que una `fila`.

A pesar de que esto es importante de entender, no te preocupes si las cosas no te quedan claras. No tomara mas que un par de inserciones para ver lo que realmente significa. Al final, el punto es que una colección no es estricta acerca de lo que contiene (sin schema). Los campos son rastreados con cada documento individual. Los beneficios e inconvenientes de esto serán explorados en un capitulo mas adelante.

Manos a la obra. Si no tienes MongoDB corriendo aun, ve y lanza el servidor `mongod` así como la terminal `mongo`. La terminal corre JavaScript. Hay algunos comandos globales que puedes ejecutar, como `help` (ayuda) o `exit` (salir). Los comandos que ejecutes contra la base de datos, son ejecutados a través de el objeto `db`, como `db.help()` (ayuda de la base de datos) o `db.stats()` (estadísticas sobre la base de datos). 

Ve y escribe en la terminal `db.help()`, obtendrás una lista de los comandos que puedes ejecutar contra el objeto `db`.

Una pequeña nota. Como esta es una consola JavaScript, si ejecutas un método y omites los paréntesis `()`, veras el cuerpo del método en vez de la ejecución del mismo. Solo lo menciono porque la primera vez que lo hagas no te sorprendas cuando obtengas una respuesta que comience con `function (...){`. Por ejemplo, si escribes `db.help` (sin paréntesis), veras la implementacion del método `help`.

Primero usaremos el método global `use` (usar) para cambiar de base de datos, inténtalo y escribe `use learn`. No importa si la base de datos aun no existe. La primera colección que crearemos de hecho creara la base de datos `learn`. Ahora que estas dentro de una base de datos puedes comenzar a utilizar comandos de bases de datos, como `db.getCollectionNames()`. Si lo haces, deberás obtener un arreglo vacio (`[ ]`). Ya que las colecciones son sin schema, no necesitamos crearlo. Podemos insertar simplemente un documento en una nueva colección. Para hacerlo, usa el comando `insert`, suministrando el documento a insertar.

	db.unicorns.insert({name: 'Aurora', gender: 'f', weight: 450})

La linea anterior ejecuta `insert` contra la colección `unicorns`, pasándole un solo argumento. Internamente MongoDB usa un formato binario serializado en JSON. Externamente, esto significa que usaremos mucho JSON, como es el caso de nuestros parámetros. Si ejecutamos `db.getCollectionNames()`, veremos dos colecciones: `unicorns` y `system.indexes`. `system.indexes` es creado una vez por base de datos, y contiene la información de los indices de nuestra base de datos.

Ahora puedes usar el comando `find` contra `unicorns` para retornar una lista de documentos:

	db.unicorns.find()

Fíjate que, a parte de los datos que especificas, hay un campo `_id`. Todo documento debe tener un campo `_id` único. Puedes generar uno por tu cuenta o dejar a MongoDB que genere un ObjectId por ti. La mayoría del tiempo probablemente quieras que MongoDB lo genere por ti. Por defecto, el campo `_id` es indexado - lo que explica porque la colección `system.indexes` fue creada. Puedes mirar `system.indexes`:

	db.system.indexes.find()

Lo que estas viendo es el nombre del indice, la base de datos y colección contra la que fue creada y los campos incluidos en el indice.

Ahora, de vuelta a la discusión acerca de colecciones sin schema. Inserta un documento totalmente diferente en `unicorns` como:

	db.unicorns.insert({name: 'Leto', gender: 'm', home: 'Arrakeen', worm: false})

Y, de nuevo usa `find` para listar los documentos. Luego que conocemos mas, discutiremos este interesante comportamiento de MongoDB, pero con suerte estarás comenzando a entender porque la terminología tradicional no es la mejor opción.

### Dominando los Selectores ###
Ademas de los seis conceptos que hemos explorado, hay un aspecto practico de MongoDB que necesitas conocer antes de movernos a temas mas avanzados: selectores de consulta. Un selector de consulta MongoDB es como una clausula `where` de una declaración SQL. Por lo tanto, la usaras cuando buscas, actualizas y borras documentos de las colecciones. Un selector es un objeto JSON, el mas simple es `{}` retorna todos los documentos (`null` funciona también). Si quisiéramos encontrar todos los unicorns hembras, usaríamos `{gender:'f'}`.

Antes de profundizar mas en los selectores, crearemos algo de data para jugar. Primero, borraremos lo que hemos colocado en la colección  `unicorns` via: `db.unicorns.remove()` (como no le proveemos un selector, borrara todos los documentos). Ahora, haz los siguientes inserts para tener mas datos (Sugiero que copies y pegues esto):

	db.unicorns.insert({name: 'Horny', dob: new Date(1992,2,13,7,47), loves: ['carrot','papaya'], weight: 600, gender: 'm', vampires: 63});
	db.unicorns.insert({name: 'Aurora', dob: new Date(1991, 0, 24, 13, 0), loves: ['carrot', 'grape'], weight: 450, gender: 'f', vampires: 43});
	db.unicorns.insert({name: 'Unicrom', dob: new Date(1973, 1, 9, 22, 10), loves: ['energon', 'redbull'], weight: 984, gender: 'm', vampires: 182});
	db.unicorns.insert({name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], weight: 575, gender: 'm', vampires: 99});
	db.unicorns.insert({name: 'Solnara', dob: new Date(1985, 6, 4, 2, 1), loves:['apple', 'carrot', 'chocolate'], weight:550, gender:'f', vampires:80});
	db.unicorns.insert({name: 'Ayna', dob: new Date(1998, 2, 7, 8, 30), loves: ['strawberry', 'lemon'], weight: 733, gender: 'f', vampires: 40});
	db.unicorns.insert({name: 'Kenny', dob: new Date(1997, 6, 1, 10, 42), loves: ['grape', 'lemon'], weight: 690,  gender: 'm', vampires: 39});
	db.unicorns.insert({name: 'Raleigh', dob: new Date(2005, 4, 3, 0, 57), loves: ['apple', 'sugar'], weight: 421, gender: 'm', vampires: 2});
	db.unicorns.insert({name: 'Leia', dob: new Date(2001, 9, 8, 14, 53), loves: ['apple', 'watermelon'], weight: 601, gender: 'f', vampires: 33});
	db.unicorns.insert({name: 'Pilot', dob: new Date(1997, 2, 1, 5, 3), loves: ['apple', 'watermelon'], weight: 650, gender: 'm', vampires: 54});
	db.unicorns.insert({name: 'Nimue', dob: new Date(1999, 11, 20, 16, 15), loves: ['grape', 'carrot'], weight: 540, gender: 'f'});
	db.unicorns.insert({name: 'Dunx', dob: new Date(1976, 6, 18, 18, 18), loves: ['grape', 'watermelon'], weight: 704, gender: 'm', vampires: 165});

Ahora que tenemos datos, podemos aprender los selectores. `{field: value}` es usado para encontrar cualquier documento donde `field` es igual a a `value`. `{field1: value1, field2: value2}` es como haremos una declaración `and`. Los selectores especiales `$lt`, `$lte`, `$gt`, `$gte` y `$ne` son usados por las operaciones menor que, menor o igual que, mayor que, mayor o igual que y no igual a. Por ejemplo, para obtener todos los unicorns que pesen mas de 700 libras, podemos hacer:

	db.unicorns.find({gender: 'm', weight: {$gt: 700}})
	//o (no exactamente lo mismo, pero para propósitos de demostración)
	db.unicorns.find({gender: {$ne: 'f'}, weight: {$gte: 701}})

El operador `$exists` es usado para determinar la presencia o ausencia de un campo, por ejemplo:

	db.unicorns.find({vampires: {$exists: false}})

Debe retornar un solo documento. Si queremos un OR en ves de AND usamos el operador `$or` y le asignamos a un arreglo de valores que queremos:

	db.unicorns.find({gender: 'f', $or: [{loves: 'apple'}, {loves: 'orange'}, {weight: {$lt: 500}}]})

Lo anterior retornara todos los unicorns hembras que le gusten las manzanas o las naranjas o pesen menos de 500 libras.

Hay algo muy elegante en nuestro ejemplo anterior. Tal ves ya lo notaste, pero el campo `loves` es un arreglo. MongoDB soporta arreglos como objetos de primera clase. Esto es una característica muy útil. Una vez que lo comienzas a usar, te preguntaras como has vivido sin el.  Lo que es mas interesante es lo fácil que es seleccionar basándose en un arreglo: `{loves: 'watermelon'}` retornara cualquier documento donde `watermelon` sea un valor de `loves`.
  
Hay algunos otros operadores disponibles aparte de los que hemos visto. El mas flexible es `$where` que nos deja pasarle JavaScript para ejecutar en el servidor. Estos están todos descritos en la sección de [Selecciones Avanzadas](http://www.mongodb.org/display/DOCSES/Consultas+avanzadas+o+complejas) del sitio web de MongoDB. Lo que hemos cubierto hasta ahora es lo básico para comenzar. También es lo que mas usaras la mayoría del tiempo.

Hemos visto como estos selectores pueden ser usados con el comando `find`. También pueden ser usados el comando `remove` que vimos superficialmente, el comando `count`, que no hemos visto pero probablemente has podido descifrar, y el comando `update` en el que nos centraremos mas adelante.

El objeto `ObjectId` que MongoDB genera por nosotros de nuestro campo `_id` puede ser seleccionado via:

	db.unicorns.find({_id: ObjectId("TheObjectId")})

### En este Capitulo ###
No hemos visto el comando `update` aun, o lo creativos que podemos ser con el comando `find`. Sin embargo, si logramos tener corriendo MongoDB,
vimos brevemente los comandos `insert` y `remove` (no son mucho mas de lo que vimos). También vimos `find` y los que son los selectores de MongoDB. Hemos tenido un buen comienzo y sentamos una base solida para lo que veremos mas adelante. Créelo o no, ya sabes la mayoría de lo que se trata MongoDB - de verdad esta hecho para aprenderlo rápido y de fácil uso. Te recomiendo fuertemente que juegues con tu copia local antes de continuar leyendo. Insertar diferentes documentos, nuevas colecciones, y familiarizarte con los diferentes selectores. Usa `find`, `count` y `remove`. Luego de algunos intentos por tu cuenta, las cosas que te parecieron extrañas al principio, con suerte comenzaran a tomar su lugar.

\clearpage

## Capitulo 2 - Actualizando ##
En el capitulo 1 nos introducimos en tres de las cuatro operaciones del CRUD (create, read, update y delete). Este capitulo esta dedicado al que saltamos `update`. `Update` tiene algunos comportamientos sorprendentes, por lo que dedicaremos un capitulo a la misma.

### Actualizando: Replace Versus $set ###
En su forma mas simple, `update` tiene 2 argumentos: el selector (where) a usar y el campo a actualizar. Si Roooooodles a ganado un poco de peso, podríamos ejecutar:

	db.unicorns.update({name: 'Roooooodles'}, {weight: 590})

(Si has jugado con tu colección `unicorns` y ya no tienes los datos originales, sigue adelante y `remove` todos los documentos y vuelve a insertar el código en el capitulo 1.)

Si esto fuera código verdadero, probablemente habría que actualizar sus registros por `_id`, pero como yo no se que `_id` genero MongoDB para ti, usare `names`. Ahora bien, si nos fijamos en el registro actualizado:

	db.unicorns.find({name: 'Roooooodles'})

Descubrirás la primera sorpresa de `update`, No se encuentran documentos porque el segundo parámetro suministrado es utilizado para **remplazar** el original. En otras palabras, el `update` encontró un documento por `name` y remplazo el documento completo con un nuevo documento (el segundo parámetro). Esto es diferente a como trabaja el comando `update` en SQL. En algunas situaciones, esto es ideal y se puede aprovechar para algunas actualizaciones realmente dinámicas. Sin embargo, cuando todo lo que quiero es modificar uno o algunos de los campos, es mejor usar el modificador `$set` de MongoDB:

	db.unicorns.update({weight: 590}, {$set: {name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], gender: 'm', vampires: 99}})

Esto va a restablecer los campos perdidos. No se sobrescribe el nuevo `weight` ya que no lo especifique. Ahora si ejecutamos:

	db.unicorns.find({name: 'Roooooodles'})

Obtenemos el resultado esperado. Por lo tanto, la forma correcta de haber actualizado el `weight` en el primer lugar es:

	db.unicorns.update({name: 'Roooooodles'}, {$set: {weight: 590}})

### Modificadores de Update ###
Adicionalmente a `$set`, podemos aprovechar otros modificadores para hacer algunas cosas ingeniosas. Todos estos modificadores de Update trabajan en los campos - entonces el documento completo no sera remplazado o borrado. Por ejemplo, el modificador `$inc` es usado para incrementar un campo en cierto monto positivo o negativo. Por ejemplo, si a Pilot se le adjudico incorrectamente la muerte de un par de vampires, se podría corregir el error ejecutando:

	db.unicorns.update({name: 'Pilot'}, {$inc: {vampires: -2}})

Si Aurora de pronto desarrolla un gusto por el dulce podemos agregarlo a su campo `loves` con el modificador `$push`:

	db.unicorns.update({name: 'Aurora'}, {$push: {loves: 'sugar'}})

La sección de [Actualizar](http://www.mongodb.org/display/DOCSES/Actualizar) del sitio web  de MongoDB tiene más información sobre los modificadores de actualización disponibles.

### Upserts ###
Una de las sorpresas mas agradables de los `updates` es que es completamente compatible con `upserts`. Un `upsert` actualiza el documento si lo encuentra o lo inserta sino lo encuentra. Upserts son útiles de tener en determinadas situaciones, cuando lo ejecutes, lo sabrás. Para habilitar upserting fijamos un tercer parámetro a `true`.

Un ejemplo clásico es un contador de visitas de un sitio web. Si queremos mantener un recuento total en tiempo real, tendríamos que ver si el registro ya existía para la página, y basado en eso decidiremos si correr un update o un insert. Con el tercer parámetro omitido (o establecido en false), ejecutando lo siguiente y no hará nada:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}});
	db.hits.find();

Sin embargo, si nos permiten upserts, los resultados son muy diferentes:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

Dado que no existen documentos con un campo `page` igual `unicorns`, se inserta un nuevo documento. Si se ejecuta una segunda vez, el documento existente se actualiza y `hits` se incrementa a 2.

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

### Actualizaciones Multiples ###
La ultima sorpresa que `update` tiene para ofrecer es que, por defecto, se va a actualizar un unico documento. Hasta el momento, por los ejemplos que hemos visto,  esto puede parecer lógico. Sin embargo, si se ejecuta algo como:

	db.unicorns.update({}, {$set: {vaccinated: true }});
	db.unicorns.find({vaccinated: true});

Probablemente esperas encontrar todos tus preciosos `unicorns` a ser `vaccinated`. Para poder obtener eso, es necesario asignar un cuarto parametro a `true`:

	db.unicorns.update({}, {$set: {vaccinated: true }}, false, true);
	db.unicorns.find({vaccinated: true});

### En Este Capitulo ###

Este capítulo concluye nuestra introducción a la base de operaciones CRUD disponible para una colección. Vimos `update` en detalle y observaron tres comportamientos interesantes. En primer lugar, a diferencia de un `update` de SQL, el `unicorns` de MongoDB reemplaza el documento actual. Debido a esto el modificador `$ set` es bastante útil. En segundo lugar, `update` admite un intuitivo soporte para `upsert` que es particularmente útil cuando se combina con el modificador `$ inc`. Finalmente, por defecto, `update` solo actualiza el primer documento encontrado. 

Recuerda que estamos viendo MongoDB desde el punto de vista de su terminal. El driver y la librería que utilices puede modificar estos comportamientos predeterminados o exponer una API diferente. Por ejemplo, el driver de Ruby combina los dos últimos parámetros en un hash único: `{:upsert => false, :multi => false}`.

\clearpage

## Capitulo 3 - Find ##
El capitulo 1 pudimos ver superficialmente el comando `find`. Hay mucho mas de `find` que entender los `selectores`. Ya mencionamos que el resultado del comando `find` es un `cursor`. Ahora veremos exactamente que significa esto en detalle.

### Selección de Campos ###
Antes de que saltemos a los `cursors`, debes saber que `find` toma un segundo parámetro opcional. Este parámetro es la lista de los campos que quieres obtener. Por ejemplo, podemos obtener todos los nombres de unicorns ejecutando:

	db.unicorns.find(null, {name: 1});

Por defecto, el campo `_id` siempre es retornado. Podemos excluirlo explicitamente especificando `{name:1, _id: 0}`.

A parte del campo `_id`, no puedes mezclar inclusión y exclusión de campos. Si piensas sobre eso, tiene sentido. Tu deseas seleccionar o excluir uno o más campos explícitamente.

### Ordenamiento ###
He mencionado anteriormente que `find` retorna un cursor cuya ejecución es retardada hasta que se necesite. Sin embargo, lo que has observado sin duda desde la terminal es que `find` se ejecuta inmediatamente. Este es un comportamiento solo de la terminal. Podemos observar el verdadero comportamiento de los `cursors` viendo uno de los métodos que podemos unir a `find`. El primero que veremos es `sort` (ordenar). `sort` se comporta como la selección de campo de la sección anterior. Nosotros especificamos los campos por los cuales queremos ordenar, usando 1 para ascendente y -1 para descendente. Por ejemplo:

	//los unicorns mas pesados primero
	db.unicorns.find().sort({weight: -1})
	
	//por nombre y luego por el numero de vampiros matados
	db.unicorns.find().sort({name: 1, vampires: -1})

Como en una base de datos relacional, MongoDB puede usar un indice para ordenar. Veremos los indices en detalle mas adelante. Sin embargo, debes saber que MongoDB limita el tamaño de tu ordenamiento sin un indice. Esto es, si intentas ordenar un resultset grande que no puede usar un indice, tendrás un error. Algunas personas ven esto como una limitante. Realmente, desearía que mas bases de datos tuvieran la capacidad de negar queries no optimizadas (No voy a convertir cada inconveniente MongoDB en algo positivo, pero he visto bases de datos tan mal optimizadas que deseo sinceramente que había un modo-estricto.)

### Paginacion ###
Paginar los resultados puede ser logrado a través de los métodos de cursores `limit` y `skip`. Para obtener el segundo y tercer unicorn mas pesados, podemos hacer:

	db.unicorns.find().sort({weight: -1}).limit(2).skip(1)

Usando `limit` en conjunto con `sort`, es una buena forma de evitar encontrarnos con problemas cuando hacemos ordenamiento en campo sin indice.

### Cuentas ###
La terminal de Mongo hace posible ejecutar `count` directamente en una colección, así:

	db.unicorns.count({vampires: {$gt: 50}})

En realidad, `count` es un metodo `cursor`, la terminal solo provee un atajo. Los drivers que no proveen ese atajo necesitan ser ejecutado así (que también funcionara en la terminal):

	db.unicorns.find({vampires: {$gt: 50}}).count()

### En este capitulo ###
El uso de `find` y `cursors` es algo sencillo. Hay algunos comandos adicionales que cubriremos en capítulos siguientes los cuales serán casos extremos, pero hasta ahora, debes estar cómodo trabajando con la terminal mongo y entendiendo los fundamentos de MongoDB.

\clearpage

## Chapter 4 - Data Modeling ##
Let's shift gears and have a more abstract conversation about MongoDB. Explaining a few new terms and some new syntax is a trivial task. Having a conversation about modeling with a new paradigm isn't as easy. The truth is that most of us are still finding out what works and what doesn't when it comes to modeling with these new technologies. It's a conversation we can start having, but ultimately you'll have to practice and learn on real code.

Compared to most NoSQL solutions, document-oriented databases are probably the least different, compared to relational databases, when it comes to modeling. The differences which exist are subtle but that doesn't mean they aren't important. 

### No Joins ###
The first and most fundamental difference that you'll need to get comfortable with is MongoDB's lack of joins. I don't know the specific reason why some type of join syntax isn't supported in MongoDB, but I do know that joins are generally seen as non-scalable. That is, once you start to horizontally split your data, you end up performing your joins on the client (the application server) anyways. Regardless of the reasons, the fact remains that data *is* relational, and MongoDB doesn't support joins.

Without knowing anything else, to live in a join-less world, we have to do joins ourselves within our application's code. Essentially we need to issue a second query to `find` the relevant data. Setting our data up isn't any different than declaring a foreign key in a relational database. Let's give a little less focus to our beautiful `unicorns` and a bit more time to our `employees`. The first thing we'll do is create an employee (I'm providing an explicit `_id` so that we can build coherent examples)

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d730"), name: 'Leto'})

Now let's add a couple employees and set their manager as `Leto`:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d731"), name: 'Duncan', manager: ObjectId("4d85c7039ab0fd70a117d730")});
	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d732"), name: 'Moneo', manager: ObjectId("4d85c7039ab0fd70a117d730")});


(It's worth repeating that the `_id` can be any any unique value. Since you'd likely use an `ObjectId` in real life, we'll use them here as well.)

Of course, to find all of Leto's employees, one simply executes:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

There's nothing magical here. In the worst cases, most of the time, the lack of join will merely require an extra query (likely indexed).

#### Arrays and Embedded Documents ####
Just because MongoDB doesn't have joins doesn't mean it doesn't have a few tricks up its sleeve. Remember when we quickly saw that MongoDB supports arrays as first class objects of a document? It turns out that this is incredibly handy when dealing with many-to-one or many-to-many relationships. As a simple example, if an employee could have two managers, we could simply store these in an array:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d733"), name: 'Siona', manager: [ObjectId("4d85c7039ab0fd70a117d730"), ObjectId("4d85c7039ab0fd70a117d732")] })

Of particular interest is that, for some documents, `manager` can be a scalar value, while for others it can be an array. Our original `find` query will work for both:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

You'll quickly find that arrays of values are much more convenient to deal with than many-to-many join-tables.

Besides arrays, MongoDB also supports embedded documents. Go ahead and try inserting a document with a nested document, such as:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d734"), name: 'Ghanima', family: {mother: 'Chani', father: 'Paul', brother: ObjectId("4d85c7039ab0fd70a117d730")}})

In case you are wondering, embedded documents can be queried using a dot-notation:

	db.employees.find({'family.mother': 'Chani'})

We'll briefly talk about where embedded documents fit and how you should use them.

#### DBRef ####
MongoDB supports something known as `DBRef` which is a convention many drivers support. When a driver encounters a `DBRef` it can automatically pull the referenced document. A `DBRef` includes the collection and id of the referenced document. It generally serves a pretty specific purpose: when documents from the same collection might reference documents from a different collection from each other. That is, the `DBRef` for document1 might point to a document in `managers` whereas the `DBRef` for document2 might point to a document in `employees`.


#### Denormalization ####
Yet another alternative to using joins is to denormalize your data. Historically, denormalization was reserved for performance-sensitive code, or when data should be snapshotted (like in an audit log). However, with the ever-growing popularity of NoSQL, many of which don't have joins, denormalization as part of normal modeling is becoming increasingly common. This doesn't mean you should duplicate every piece of information in every document. However, rather than letting fear of duplicate data drive your design decisions, consider modeling your data based on what information belongs to what document.

For example, say you are writing a forum application. The traditional way to associate a specific `user` with a `post` is via a `userid` column within `posts`. With such a model, you can't display `posts` without retrieving (joining to) `users`. A possible alternative is simply to store the `name` as well as the `userid` with each `post`. You could even do so with an embedded document, like `user: {id: ObjectId('Something'), name: 'Leto'}`. Yes, if you let users change their name, you'll have to update each document (which is 1 extra query). 

Adjusting to this kind of approach won't come easy to some. In a lot of cases it won't even make sense to do this. Don't be afraid to experiment with this approach though. It's not only suitable in some circumstances, but it can also be the right way to do it.

#### Which Should You Choose? ####
Arrays of ids are always a useful strategy when dealing with one-to-many or many-to-many scenarios. It's probably safe to say that `DBRef` aren't use very often, though you can certainly experiment and play with them. That generally leaves new developers unsure about using embedded documents versus doing manual referencing.

First, you should know that an individual document is currently limited to 4 megabytes in size. Knowing that documents have a size limit, though quite generous, gives you some idea of how they are intended to be used. At this point, it seems like most developers lean heavily on manual references for most of their relationships. Embedded documents are frequently leveraged, but mostly for small pieces of data which we want to always pull with the parent document. A real world example I've used is to store an `accounts` document with each user, something like:

	db.users.insert({name: 'leto', email: 'leto@dune.gov', account: {allowed_gholas: 5, spice_ration: 10}})

That doesn't mean you should underestimate the power of embedded documents or write them off as something of minor utility. Having your data model map directly to your objects makes things a lot simpler and often does remove the need to join. This is especially true when you consider that MongoDB lets you query and index fields of an embedded document. 

### Few or Many Collections ###
Given that collections don't enforce any schema, it's entirely possible to build a system using a single collection with a mismatch of documents.  From what I've seen, most MongoDB systems are laid out similarly to what you'd find in a relational system. In other words, if it would be a table in a relational database, it'll likely be a collection in MongoDB (many-to-many join tables being an important exception).

The conversation gets even more interesting when you consider embedded documents. The example that frequently comes up is a blog. Should you have a `posts` collection and a `comments` collection, or should each `post` have an array of `comments` embedded within it. Setting aside the 4MB limit for the time being (all of Hamlet is less than 200KB, just how popular is your blog?), most developers still prefer to separate things out. It's simply cleaner and more explicit.

There's no hard rule (well, aside from 4MB). Play with different approaches and you'll get a sense of what does and does not feel right. 

### In This Chapter ###
Our goal in this chapter was to provide some helpful guidelines for modeling your data in MongoDB. A starting point if you will. Modeling in a document-oriented system is different, but not too different than a relational world. You have a bit more flexibility and one constraint, but for a new system, things tend to fit quite nicely. The only way you can go wrong is by not trying.

\clearpage

## Capitulo 5 - Cuando usar MongoDB ##
A estas alturas ya debes tener un conocimiento suficiente de MongoDB para tener una idea de dónde y cómo podría encajar en tu sistema existente. Ya hay tantas tecnologías de almacenamiento nuevas que es fácil sentirse abrumado por todas las opciones.

Para mí, la lección más importante, que no tiene nada que ver con MongoDB, es que ya no tienes que depender de una única solución para hacer frente a tus datos. Sin duda, una solución única tiene ventajas obvias y para un montón de proyectos, tal vez incluso la mayoría, una solución única es el enfoque mas sensato. La idea no es que se deben utilizar diferentes tecnologías, sino que se puede. Sólo tu sabes si los beneficios de la introducción de una nueva solución son superiores a los costos.

Dicho esto, tengo la esperanza de que lo que hemos visto hasta ahora te ha hecho ver MongoDB como una solución general. Se ha mencionado un par de veces que las bases de datos orientada a documentos comparten mucho en común con las bases de datos relacionales. Por lo tanto, en lugar de lanzar puntillas a su alrededor, vamos a dejar en claro que MongoDB debe ser visto como una alternativa directa a las bases de datos relacionales. Cuando uno puede ver Lucene como la mejora de una base de datos relacional con indexación de texto completo, o Redis como un almacén persistente de clave y valor, MongoDB es un repositorio central de datos.

Ten en cuenta que no llame MongoDB un *reemplazo* de bases de datos relacionales, sino más bien una **alternativa**. Es una herramienta que puede hacer lo que un montón de otras herramientas puede hacer. Parte de ellas MongoDB lo hace mejor, algunas de ellas MongoDB lo hace peor. Vamos a analizar las cosas un poco más.

### Sin schema ###
Un beneficio que no hemos discutido de las bases de datos orienadas a documentos es que son sin schema. Esto hace que sean mucho más flexibles que las tablas de bases de datos tradicionales. Estoy de acuerdo en ese Schema-less es una buena característica, pero no la razón principal que la mayoría de la gente menciona.

La gente habla de schema-less como si de pronto comenzara a almacenar datos locos o sin relación. Hay dominios y sets de datos que pueden ser un dolor de cabeza modelar usando bases de datos relacionales, pero esos son casos particulares. Schema-less es cool, pero la mayoria de tus datos estarán estructurados. Es cierto que tener un desfase de vez en cuando puede ser útil, especialmente cuando se introducen nuevas características, pero en realidad no es nada que una columna null no pueda resolver igual de bien.

Para mí, el beneficio real del schema-less es la falta de la configuración y la reducción de la fricción con la OOP. Esto es particularmente cierto cuando se trabaja con un lenguaje estático. He trabajado con MongoDB en C# y Ruby, y la diferencia es notable. El dinamismo de Ruby y su popular implementacion de ActiveRecord ya reduce gran parte de la falta de concordancia objeto-relacional. Eso no quiere decir MongoDB no es un buen partido para Ruby, lo es realmente. Más bien, creo que la mayoría de los desarrolladores de Ruby verían MongoDB como una mejora incremental, mientras que C# o los desarrolladores de Java veran un cambio fundamental en cómo interactúan con sus datos. Piensa en ello desde la perspectiva de un desarrollador de controladores. Desea guardar un objeto? Serializa a JSON (técnicamente BSON, pero lo suficientemente cerca) y envialo a MongoDB. No hay asignación de propiedad o la asignación de tipos. Esta sencillez definitivamente te beneficia a ti, el desarrollador final.

### Escrituras ###
Un area en la que se especializa MongoDB es logging. Las inserciones en MongoDB son, por defecto, asíncronas. Escrituras en MongoDB son bastante rapidas, y hacerlas asíncronas solo las hace mas rápidas. Adicionalmente, log datos es algo que puede tomar ventaja de colecciones sin schema. Finalmente, MongoDB tiene algo llamado [colecciones con tope](http://www.mongodb.org/display/DOCSES/Colecciones+con+tope). Hasta ahora, la simplicidad de las colecciones que hemos creado son colecciones normales. Podemos crear colecciones con tope usando el comando `db.createCollection` e indicando que tendra un tope:

        //limitar nuestra colección a 1 megabyte
	db.createCollection('logs', {capped: true, size: 1048576})

Cuando la colección con tope llegue a su limite de 1MB, los documentos viejos son  borrados automáticamente. Un limite en el numero de documentos, en vez de el tamaño, puede ser habilitado usando `max`. Las colecciones con tope tienen unas propiedades interesantes. Por ejemplo, puedes actualizar un documento pero no puede crecer en tamaño. Ademas, el orden de inserción es preservado, así no tienes que añadir un indice extra para obtener el ordenamiento basado en tiempo.

Este es un buen momento para decir que si no deseas que tus escrituras sean asíncronas simplemente ejecutas el siguiente comando:  `db.getLastError()`. La mayoría de los drivers encapsulan esto como una "escritura segura", especificando `{:safe => true}` como segundo parametro en el `insert`.

### Durabilidad ###
Antes de la versión 1.8, MongoDB no tenia la durabilidad de un solo servidor. Es decir, una caída del servidor podría resultar en la pérdida de datos. La solución ha sido siempre ejecutar MongoDB en una configuración multi-servidor (MongoDB admite la replicación). Una de las principales características se agregaron a la version 1.8 fue `journaling`. Para habilitarla anade una nueva línea con `journal = true` al archivo `mongodb.config` archivo que creamos cuando configuramos MongoDB (y reiniciar el servidor si deseas usarlo inmediato). Probablemente quieras `journaling` habilitado (estara habilitado por defecto en una futura version). Aunque, en algunas circunstancias, el rendimiento extra que se obtiene de deshabilitar el `journaling` podría ser un riesgo que está dispuesto a tomar. (Vale la pena señalar que algunos tipos de aplicaciones pueden darse el lujo de perder datos).

La Durabilidad solo es mencionada aqui porque se ha hecho mucho en MongoDB alrededor de la falta de la durabilidad de un solo servdor. La información que encuentres acerca de esta característica faltante es simplemente por estar desactualizado.

### Búsqueda de texto completo ###
La verdadera capacidad de búsqueda de texto es algo que se espera llegará a MongoDB en una versión futura. Con su apoyo a las matrices, de búsqueda en base a texto completo es bastante fácil de implementar. Para algo más potente, tendrás que confiar en una solución, como Lucene / SOLR. Por supuesto, esto también es cierto de muchas bases de datos relacionales.

### Transacciones ###
MongoDB no tiene transacciones, para eso tiene dos soluciones, una que es grandiosa, pero con un uso limitado, y la otra que es pesada pero flexible.

La primera son sus muchas operaciones atómicas. Esto es bueno, siempre y cuando en resuelvan su problema. Ya hemos visto algunos de los más simples, como `$inc`y `$ set`. También hay comandos como `findAndModify`, que pueden actualizar o eliminar un documento y retornarlo de forma atómica.

La segunda, cuando las operaciones atómicas no son suficientes, es caer de nuevo a una confirmación en dos fases. Una confirmación de dos fases es lo que eliminación de referencias manuales es a los joins. Es una solución de almacenamiento independiente que haces en código. Las confirmaciones de dos pasos son en realidad muy populares en el mundo relacional como una manera de poner en práctica las transacciones a través de múltiples bases de datos. El sitio web MongoDB [tiene un ejemplo] (http://www.mongodb.org/display/DOCS/two-phase+commit) que ilustra el escenario más común (una transferencia de fondos). La idea general es que se guarde el estado de la transacción en el documento actual que se esta actualizando y seguir los pasos init-pending-commit/rollback manualmente.

El soporte MongoDB para documentos anidados y sin schema hacen las confirmación en dos fases un poco menos dolorosas, pero todavía no es un gran proceso, especialmente cuando se esta comenzando con él.

### Procesamiento de Datos ###
MongoDB se basa en MapReduce para la mayoría del trabajo de procesamiento de datos. Tiene capacidades basicas de [agregacion](http://www.mongodb.org/pages/viewpage.action?pageId=8717043), pero para culaquier cosa seria, querrás usar MapReduce. En el proximo capitulo veremos MapReduce en detalle. Por ahora puedes pensar en ello como una forma poderosa y diferente de `group by` (que esta subestimado). Uno de los puntos fuertes de MapReduce es que puede ser paralelizado para trabajar con grandes cantidades de datos. Sin embargo, la implementación de MongoDB se basa en JavaScript que es de un solo hilo. El punto? para procesar grandes cantidades de datos, necesitaras basarte en otra cosa como Hadoop. Afortunadamente como los dos sistemas se complementan hay un [adaptador de MongoDB para Hadoop](https://github.com/mongodb/mongo-hadoop).

Por supuesto, paralelización de procesamiento de datos no es algo en que las bases de datos relacionales sobresalgan. Hay planes para las futuras versiones de MongoDB para mejorar en el manejo de conjuntos muy grandes de datos.

### Herramientas y Madurez ###
Probablemente ya sabes la respuesta a esto, pero MongoDB es obviamente más joven que la mayoría de los sistemas de bases de datos relacionales. Esto es algo que absolutamente deberías considerar. Cuanto peso tiene depende de lo que estas haciendo y como lo estas haciendo. Sin embargo, honestamente no se puede ignorar el hecho de que MongoDB es más joven y las herramientas disponibles no son muy grandes (aunque las herramientas en torno a una gran cantidad de bases de datos relacionales maduras es bastante horrible también!). A modo de ejemplo, la falta de apoyo para la base-10 en números de punto flotante, obviamente, será una preocupación (aunque no necesariamente una traba) para los sistemas de manejo de dinero.

En el lado positivo, los drivers existen para un gran número de idiomas, el protocolo es moderno y simple, y el desarrollo está sucediendo a una velocidad rapida. MongoDB esta en producción en suficientes compañías que, preocupaciones por madurez, aunque validas, están convirtiendo rapidamente en algo del pasado.

### En este Capitulo ###
El mensaje de este capítulo es que MongoDB, en la mayoría de los casos, puede sustituir a una base de datos relacional. Es mucho más simple y directo, es más rápido y por lo general impone menos restricciones a los desarrolladores de aplicaciones. La falta de transacciones puede ser una preocupación legítima y seria. Sin embargo, cuando la gente pregunta * ¿dónde esta MongoDB  con respecto al nuevo paisaje de almacenamiento de datos? * la respuesta es simple: **justo en el centro **.

\clearpage

## Chapter 6 - MapReduce ##
MapReduce is an approach to data processing which has two significant benefits over more traditional solutions. The first, and main, reason it was development is performance. In theory, MapReduce can be parallelized, allowing very large sets of data to be processed across many cores/CPUs/machines. As we just mentioned, this isn't something MongoDB is currently able to take advantage of. The second benefit of MapReduce is that you get to write real code to do your processing. Compared to what you'd be able to do with SQL, MapReduce code is infinitely richer and lets you push the envelope further before you need to use a more specialized solution.

MapReduce is a pattern that has grown in popularity, and you can make use of it almost anywhere; C#, Ruby, Java, Python and so on all have implementations. I want to warn you that at first this'll seem very different and complicated. Don't get frustrated, take your time and play with it yourself. This is worth understanding whether you are using MongoDB or not.

### A Mix of Theory and Practice ###
MapReduce is a two-step process. First you map and then you reduce. The mapping step transforms the inputted documents and emits a key=>value pair (the key and/or value can be complex). The reduce gets a key and the array of values emitted for that key and produces the final result. We'll look at each step, and the output of each step.

The example that we'll be using is to generate a report of the number of hits, per day, we get on a resource (say a webpage). This is the *hello world* of MapReduce. For our purposes, we'll rely on a `hits` collection with two fields: `resource` and `date`. Our desired output is a breakdown by `resource`, `year`, `month`, `day` and `count`. 

Given the following data in `hits`:

	resource     date
	index        Jan 20 2010 4:30
	index        Jan 20 2010 5:30
	about        Jan 20 2010 6:00
	index        Jan 20 2010 7:00
	about        Jan 21 2010 8:00
	about        Jan 21 2010 8:30
	index        Jan 21 2010 8:30
	about        Jan 21 2010 9:00
	index        Jan 21 2010 9:30
	index        Jan 22 2010 5:00

We'd expect the following output:

	resource  year   month   day   count
	index     2010   1       20    3
	about     2010   1       20    1
	about     2010   1       21    3
	index     2010   1       21    2
	index     2010   1       22    1

(The nice thing about this type of approach to analytics is that by storing the output, reports are fast to generate and data growth is controlled (per resource that we track, we'll add at most 1 document per day.)

For the time being, focus on understanding the concept. At the end of this chapter, sample data and code will be given for you to try on your own.

The first thing to do is look at the map function. The goal of map is to make it emit a value which can be reduced. It's possible for map to emit 0 or more times. In our case, it'll always emit once (which is common). Imagine map as looping through each document in hits. For each document we want to emit a key with resource, year, month and day, and a simple value of 1:

	function() {
		var key = {
		    resource: this.resource, 
		    year: this.date.getFullYear(), 
		    month: this.date.getMonth(), 
		    day: this.date.getDate()
		};
		emit(key, {count: 1}); 
	}

`this` refers to the current document being inspected. Hopefully what'll help make this clear for you is to see what the output of the mapping step is. Using our above data, the complete output would be:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'about', year: 2010, month: 0, day: 20} => [{count: 1}]
	{resource: 'about', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'index', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}]
	{resource: 'index', year: 2010, month: 0, day: 22} => [{count: 1}]

Understanding this intermediary step is the key to understanding MapReduce. The values from emit are grouped together, as arrays, by key. .NET and Java developers can think of it as being of type `IDictionary<object, IList<object>>` (.NET) or `HashMap<Object, ArrayList>` (Java).

Let's change our map function in some contrived way:

	function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		if (this.resource == 'index' && this.date.getHours() == 4) {
			emit(key, {count: 5});
		} else {
			emit(key, {count: 1}); 
		}
	}

The first intermediary output would change to:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 5}, {count: 1}, {count:1}]

Notice how each emit generates a new value which is grouped by our key.

The reduce function takes each of these intermediary results and outputs a final result. Here's what ours looks like:

	function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Which would output:

	{resource: 'index', year: 2010, month: 0, day: 20} => {count: 3}
	{resource: 'about', year: 2010, month: 0, day: 20} => {count: 1}
	{resource: 'about', year: 2010, month: 0, day: 21} => {count: 3}
	{resource: 'index', year: 2010, month: 0, day: 21} => {count: 2}
	{resource: 'index', year: 2010, month: 0, day: 22} => {count: 1}

Technically, the output in MongoDB is:

	_id: {resource: 'home', year: 2010, month: 0, day: 20}, value: {count: 3}

Hopefully you've noticed that this is the final result we were after.

If you've really been paying attention, you might be asking yourself *why didn't we simply use `sum = values.length`?* This would seem like an efficient approach when you are essentially summing an array of 1s. The fact is that reduce isn't always called with a full and perfect set of intermediate data. For example, instead of being called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]

Reduce could be called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}]
	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 2}, {count: 1}]

The final output is the same (3), the path taken is simply different. As such, reduce must always be idempotent. That is, calling reduce multiple times should generate the same result as calling it once. 

We aren't going to cover it here but it's common to chain reduce methods when performing more complex analysis. 

### Pure Practical ###
With MongoDB we use the `mapReduce` command on a collection. `mapReduce` takes a map function, a reduce function and an output directive. In our shell we can create and pass a JavaScript function. From most libraries you supply a string of your functions (which is a bit ugly). First though, let's create our simple data set:

	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 4, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 5, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 20, 6, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 7, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 9, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 9, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 22, 5, 0)});

Now we can create our map and reduce functions (the MongoDB shell accepts multi-line statements, you'll see *...* after hitting enter to indicate more text is expected):

	var map = function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		emit(key, {count: 1}); 
	};
	
	var reduce = function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Which we can use the `mapReduce` command against our `hits` collection by doing:

	db.hits.mapReduce(map, reduce, {out: {inline:1}})

If you run the above, you should see the desired output. Setting `out` to `inline` means that the output from `mapReduce` is immediately streamed back to us. This is currently limited for results that are 16 megabytes or less. We could instead specify `{out: 'hit_stats'}` and have the results stored in the `hit_stats` collections:

	db.hits.mapReduce(map, reduce, {out: 'hit_stats'});
	db.hit_stats.find();

When you do this, any existing data in `hit_stats` is lost. If we did `{out: {merge: 'hit_stats'}}` existing keys would be replaced with the new values and new keys would be inserted as new documents. Finally, we can `out` using a `reduce` function to handle more advanced cases (such an doing an upsert). 

The third parameter takes additional options, for example we could filter, sort and limit the documents that we want analyzed. We can also supply a `finalize` method to be applied to the results after the `reduce` step.

### In This Chapter ###
This is the first chapter where we covered something truly different. If it made you uncomfortable, remember that you can always use MongoDB's other [aggregation capabilities](http://www.mongodb.org/display/DOCS/Aggregation) for simpler scenarios. Ultimately though, MapReduce is one of MongoDB's most compelling features. The key to really understanding how to write your map and reduce functions is to visualize and understand the way your intermediary data will look coming out of `map` and heading into `reduce`.

\clearpage

## Chapter 7 - Performance and Tools ##
In this last chapter, we look at a few performance topics as well as some of the tools available to MongoDB developers. We won't dive deeply into either topic, but we will examine the most import aspects of each.

### Indexes ###
At the very beginning we saw the special `system.indexes` collection which contains information on all the indexes in our database. Indexes in MongoDB work a lot like indexes in a relational database: they help improve query and sorting performance. Indexes are created via `ensureIndex`:

	db.unicorns.ensureIndex({name: 1});

And dropped via `dropIndex`:

	db.unicorns.dropIndex({name: 1});

A unique index can be created by supplying a second parameter and setting `unique` to `true`:

	db.unicorns.ensureIndex({name: 1}, {unique: true});

Indexes can be created on embedded fields (again, using the dot-notation) and on array fields. We can also create compound indexes:

	db.unicorns.dropIndex({name: 1, vampires: -1});

The order of your index (1 for ascending, -1 for descending) doesn't matter for a single key index, but it can have an impact for compound indexes when you are sorting or using a range condition.

The [indexes page](http://www.mongodb.org/display/DOCS/Indexes) has additional information on indexes.

### Explain ###
To see whether or not your queries are using an index, you can use the `explain` method on a cursor:

	db.unicorns.find().explain()

The output tells us that a `BasicCursor` was used (which means non-indexed), 12 objects were scanned, how long it took, what index, if any was used as well as a few other pieces of useful information.

If we change our query to use an index, we'll see that a `BtreeCursor` was used, as well as the index used to fulfill the request:

	db.unicorns.find({name: 'Pilot'}).explain()

### Asynchronous Writes ###
We previously mentioned that, by default, writes in MongoDB are asynchronous. This can result in some nice performance gains at the risk of losing data during a crash. An interesting side effect of asynchronous writes is that an error is not returned when an insert/update violates a unique constraint. In order to be notified about a failed write, one must call `db.getLastError()` after an insert. Many drivers abstract this detail away and provide a way to do a *safe* write - often via an extra parameter.

Unfortunately, the shell automatically does safe inserts, so we can't easily see this behavior in action.

### Sharding ###
MongoDB supports auto-sharding. Sharding is an approach to scalability which separates your data across multiple servers. A naive implementation might put all of the data for users with a name that starts with A-M on server 1 and the rest on server 2. Thankfully, MongoDB's sharding capabilities far exceed such a simple algorithm. Sharding is a topic well beyond the scope of this book, but you should know that it exists and that you should consider it should your needs grow beyond a single server.

### Replication ###
MongoDB replication works similarly to how relational database replication works. Writes are sent to a single server, the master, which then synchronizes itself to one or more other servers, the slaves. You can control whether reads can happen on slaves or not, which can help distribute your load at the risk of reading slightly stale data. If the master goes down, a slave can be promoted to act as the new master. Again, MongoDB replication is outside the scope of this book.

 While replication can improve performance (by distributing reads), its main purpose is to increase reliability. Combining replication with sharding is a common approach. For example, each shard could be made up of a master and a slave. (Technically you'll also need an arbiter to help break a tie should two slaves try to become masters. But an arbiter requires very few resources and can be used for multiple shards.)

### Stats ###
You can obtain statistics on a database by typing `db.stats()`. Most of the information deals with the size of your database. You can also get statistics on a collection, say `unicorns`, by typing `db.unicorns.stats()`. Again, most of this information relates to the size of your collection.

### Web Interface ###
Included in the information displayed on MongoDB's startup was a link to a web-based administrative tool (you might still be able to see if if you scroll your command/terminal window up to the point where you started `mongod`). You can access this by pointing your browser to <http://localhost:28017/>. To get the most out of it, you'll want to add `rest=true` to your config and restart the `mongod` process. The web interface gives you a lot of insight into the current state of your server.

### Profiler ###
You can enable the MongoDB profiler by executing:

	db.setProfilingLevel(2);

With it enabled, we can run a command:

	db.unicorns.find({weight: {$gt: 600}});

And then examine the profiler:

	db.system.profile.find()

The output tells us what was run and when, how many documents were scanned, and how much data was returned.

You can disable the profiler by calling `setProfileLevel` again but changing the argument to `0`. Another option is to specify `1` which will only profile queries that take more than 100 milliseconds. Or, you can specify the minimum time, in milliseconds, with a second parameter:

	//profile anything that takes more than 1 second
	db.setProfilingLevel(1, 1000);

### Backups and Restore ###
Within the MongoDB `bin` folder is a `mongodump` executable. Simply executing `mongodbump` will connect to localhost and backup all of your databases to a `dump` subfolder. You can type `mongodump --help` to see additional options. Common options are `--db DBNAME` to back up a specific database and `--collection COLLECTIONAME` to back up a specific collection. You can then use the `mongorestore` executable, located in the same `bin` folder, to restore a previously made backup. Again, the `--db` and `--collection` can be specified to restore a specific database and/or collection. 

For example, to back up our `learn` collection to a `backup` folder, we'd execute (this is its own executable which you run in a command/terminal window, not within the mongo shell itself):

	mongodump --db learn --out backup

To restore only the `unicorns` collection, we could then do:

	mongorestore --collection unicorns backup/learn/unicorns.bson

It's worth pointing out that `mongoexport` and `mongoimport` are two other executables which can be used to export and import data from JSON or CSV. For example, we can get a JSON output by doing:

	mongoexport --db learn -collection unicorns

And a CSV output by doing:

	mongoexport --db learn -collection unicorns --csv -fields name,weight,vampires

Note that `mongoexport` and `mongoimport` cannot always represent your data. Only `mongodump` and `mongorestore` should ever be used for actual backups.

### In This Chapter ###
In this chapter we looked a various commands, tools and performance details of using MongoDB. We haven't touched on everything, but we've looked at the most common ones. Indexing in MongoDB is similar to indexing with relational databases, as are many of the tools. However, with MongoDB, many of these are to the point and simple to use.

\clearpage

## Conclusion ##
You should have enough information to start using MongoDB in a real project. There's more to MongoDB than what we've covered, but your next priority should be putting together what we've learned, and getting familiar with the driver you'll be using. The [MongoDB website](http://www.mongodb.com/) has a lot of useful information. The official [MongoDB user group](http://groups.google.com/group/mongodb-user) is a great place to ask questions.

NoSQL was born not only out of necessity, but also out of an interest to try new approaches. It is an acknowledgement that our field is ever advancing and that if we don't try, and sometimes fail, we can never succeed. This, I think, is a good way to lead our professional lives.
