CAMBIOS REALIZADOS:

El diagrama Er utilizado para guiar el desarrollo de la base de datos sufrió unas cuantas modificaciones en consideración del ofrecido en el enunciado.

Primeramente, se removió la clase "Vendedor", puesto que nuestra implementación de "Empleado" contaba con un atributo llamado "Cargo", resultando así en una implementación redundante.

La relación errónea entre "Empleado" → "Prod-Venta" fue removida, puesto que esa tabla intermedia no le corresponde al Empleado. Por esta razón, y para mantener un seguimiento de los involucrados en la "Venta", 
se estableció una relación directa entre "Empleado" → "Venta".
