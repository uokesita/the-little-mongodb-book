## Acerca ##
El pequeño libro MongoDB es un libro gratuito introductorio a MongoDB.

El libro fue creado poco después de la creación del [tutorial interactivo de MongoDB](http://mongly.com). De esta forma los dos pueden ser vistos como complementos.

El libro fue escrito por [Karl Seguin](http://openmymind.net), con la asistencia de [Perry Neal](http://twitter.com/perryneal).

## Licencia ##
El libro es distribuido gratuitamente bajo la licencia [Reconocimiento-NoComercial 3.0 Unported (CC BY-NC 3.0)](<http://creativecommons.org/licenses/by-nc/3.0/deed.es_ES>).

## Formatos ##
El libro esta escrito en [markdown](http://daringfireball.net/projects/markdown/) y convertido a PDF usando [PanDoc](http://johnmacfarlane.net/pandoc/). Algunos comandos específicos de LaTex fueron usados en el archivo markdown para ayudar a la generación del pdf (para la pagina pequeña y los saltos de pagina entre capítulos).

Las plantillas LaTex usan el [Resaltado javscript de Lena Herrmann](http://lenaherrmann.net/2010/05/20/javascript-syntax-highlighting-in-the-latex-listings-package).

Formatos Kindle y ePub creados usando [PanDoc](http://johnmacfarlane.net/pandoc/). Corre make en/mongodb.mobi para generarlo.

## Generando el PDF ##
He usado una variacion de <https://github.com/claes/pandoc-templates> para generar el pdf:

	#!/bin/sh
	paper=a4paper
	hmargin=3cm
	vmargin=3cm
	fontsize=11pt

	mainfont=Verdana
	sansfont=Tahoma
	monofont="Courier New"
	language=english
	nohyphenation=false
	columns=onecolumn
	geometry=portrait
	nohyphenation=true


	markdown2pdf --xetex --template=template/xetex.template \
	-V paper=$paper -V hmargin=$hmargin -V vmargin=$vmargin \
	-V mainfont="$mainfont" -V sansfont="$sansfont" -V monofont="$monofont" \
	-V geometry=$geometry -V alignment=$alignment -V columns=$columns \
	-V fontsize=$fontsize -V nohyphenation=$nohyphenation \
	-V toc=$toc --listings es/mongodb.markdown -o mongodb.pdf 

## Imagen de Titulo ##
Se ha incluido un PSD de la imagen. La fuente usada es [Comfortaa](http://www.dafont.com/comfortaa.font).
