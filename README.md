# Manejo de estados en Flutter

Diferentes formas para manejo de estados en flutter.

![Manejo de estados en Flutter](https://user-images.githubusercontent.com/2531939/92287705-259ee500-eed0-11ea-8c3a-0d027aec1a6f.gif)

**La aplicación cuenta con tres vistas:**

- **User**: En esta vista al cambiar los valores del campo de texto también se actualizará el título del AppBar, además se actualizará en nombre de usuario en la vista cart.

- **Catalog**: En esta vista se muestra un listado de Items y al interactuar con cada uno de ellos se puede ver que el ícono para agregar/eliminar cambia, también se actualiza el contador de items del AppBar y el listado de items de la vista cart.

- **Cart**: En esta vista se muestra un listado de los productos que se han seleccionado en la vista de catalog también se muestra el precio total y el nombre de usuario junto con las iniciales del mismo en un CircleAvatar.

**La rama *master* solo tiene el código base de la aplicación.**

------------

## [BLoC Pattern sin librerías](https://github.com/marcedroid/Flutter-State-Management-Demos/tree/bloc-no-libraries "BLoC Pattern sin librerías")

Implementación del patrón BLoC sin utilizar librerías de terceros.

**El código se puede encontrar en la rama *bloc-no-libraries*.**

**La guía de implementación se puede encontrar en dev.to**

[Manejo de estados en flutter, BLoC Pattern sin librerías](https://dev.to/marcelo/manejo-de-estados-en-flutter-bloc-pattern-sin-librerias-558c "Manejo de estados en flutter, BLoC Pattern sin librerías")

------------

## [Manejo de estados usando la librería Provider](https://github.com/marcedroid/Flutter-State-Management-Demos/tree/provider "Manejo de estados usando la librería Provider")

Uso de la librería Provider para el manejo de estados en Flutter.

**El código se puede encontrar en la rama *provider*.**

**La guía de implementación se puede encontrar en dev.to**

[Manejo de estados usando la librería Provider](https://dev.to/marcelo/manejo-de-estados-en-flutter-provider-5dkd "Manejo de estados usando la librería Provider")
