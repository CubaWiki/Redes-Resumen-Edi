# Unidad 1: Introducción


## Requerimientos de las Redes

### Contectividad


   * El servicio básico que se espera de una red es que conecte dos o más **nodos** a través de un medio denominado **enlace**.
   * Los enlaces pueden ser de punto a punto o compartidos.
   * No hace falta que haya un enlace concreto entre cada nodo.
   * Puede soportar comunicación unicast (uno a uno), multicast (uno a algunos) o broadcast (uno a todos).
   * Si es unicast, la comunicación se establece utilizando una **dirección** que se utiliza en la infraestructura interna de la red para hacer llegar los datos al nodo destino (**routing**)

Podemos definir a las redes recursivamente:

   * Uno o más nodos conectados por un enlace físico
   * Una o más redes conectadas por un nodo
   
   
#### Redes switcheadas

   * Son redes en las que hay equipos especiales que se encargan de redirigir datos al nodo de destino.
   * Pueden ser **circuit switched** o **packet switched**.
   * Las de circuitos primero establecen un canal de comunicación y luego mantienen un flujo de bits entre ambos extremos.
   * Las de paquetes transfieren paquetes/mensajes discretos que se recomponen en los extremos. Cada nodo intermedio hace **store and forward**: almacena los datos de un paquete hasta tenerlo entero y luego lo transfiere al siguiente.

### Eficiencia de recursos compartidos

   * Para soportar la comunicación concurrente entre cualquier subconjunto de nodos en la red será necesario compartir parde de los recursos, puntualmente enlaces.
   * Para eso se multiplexan los datos en el canal: los paquetes se mezclan y hay switches en los extremos de la comunicación que separan los paquetes y los envían al nodo que corresponde.
   
   * A su vez, cada switch pued estar recibiendo datos de varios enlaces e insertándolos en un sólo enlace de salida.
   * Para esto hace falta una estrategia otra de multiplexación, que puede o no garantizar tiempo máximo
   * El nodo puede tener que almacenar paquetes si los recibe más rápido de lo que los puede enviar
   
#### Multiplexado estadístico

   * Tanto el multiplexado *TDM* como *FDM* desperdician recursos cuando un flujo no hace uso de espacio asignado
   * Ambos requieren conocer la cantidad total de flujos.

   * El multiplexado estadístico es simlar a *TDM* en tanto asigna el canal de forma exclusiva por cuotas de tiempo acotadas
   * A diferencia de *TDM*, lo hace por demanda: si sólo un nodo quiere enviar datos, éste dispondrá del canal de forma exclusiva
   * Para evitar inanición de flujos, se define un tamaño máximo en que se puede usar el canal de forma ininterrumpida y así se determinan los **paquetes**
   * Si nadie más necesita el enlace, un nodo puede enviar varios paquetes de forma consecutiva
   * Puede hacer falta partir un mensaje en varios paquetes y que sean ensamblados en los extremos

### Soporte de servicios comunes

   * El objetivo final de la red será proveer comunicación útil entre aplicaciones de los extremos.
   * No tiene sentido que cada aplicación implemente completamente el mecanismo de comunicación
   * Hay servicios de red comunes sobre los cuáles se construyen los usos específicos.
   * Estos servicios se organizan en distintas capas de abtracción para permitir utilizarlos sin limitar la flexibilidad del usuario.
   * Cada aplicación puede requerir distintas garantías sobe el canal de comunicación (tiempos, privacidad, orden, etc.)
   
#### Confiabilidad

   * La confiabilidad (garantía de que llegarán los mensajes bajo ciertas condiciones) es uno de los requisitos fundamentales que se suele pedir
   * Hay muchos tipos de errores distintos que pueden ocurrir en distintos niveles
   * La red se debe encargar de esconderlos
   
Clases de errores principales:

   * Bits corruptos: suelen poder detectarse y no son muy frecuentes
   * Paquetes corruptos/desaparecidos: complejo, es difícil determinar cuándo se perdió y cuándo está tardando
   * Nodos o enlaces caídos: pueden sobrellevarse routeando alrededor del problema

## Caracterización

Si se quieren caracterizar las redes con respecto a su tamaño, se suele hablar de las siguientes categorías:

   * LAN (local área network)
   * WAN (wide area network)
   * MAN (metropolitan area network)
   * SAN (system area network)
   
Conocer el tamaño que tendrá una red es importante para evaluar las tecnologías sobre las cuales construir el soporte de la misma.
   
## Arquitectura

### Capas de abstracción y protocolos

   * Para atacar la complejidad se suelen encapsular en objetos (**protocolos**) las detalles de implementación
   * Estos objetos se ubican en capas de distintos niveles de abstracción
   * Se busca que cada protocolo sea fácilmente implementable pero útil en varios escensarios para las capas superiores

   
   * Los protocolos definen una interfaz de servicio a las capas superiores
   * También una interfaz de comunicación a su contraparte del mismo nivel de abstracción en el otro nodo
   * Excepto en el nivel de hardware, la comunicación en todas las capas es indirecta (pasando por el protocolo de menor nivel
   * Decimos que una **arquitectura** es un conjunto de reglas que rigen un grafo de protocolos
     
#### Encapsulamiento

   * Los protocolos se abstraen del uso que se les da: no son capaces de interpretar los datos suministrados por las capas superiores.
   * Para comunicarse con su par, los protocolos suelen adjuntar al principio del mensaje cierta información de control que llamamos *header* (o *trailer* en caso de que vaya al final).
   * En cada nivel, los protocolos encapsulan el mensaje superior adjuntando sus *headers*, que luego son removidos por su par.
   
#### Multiplexación y demultiplexación

   * Dado que puede haber muchos usuarios de un protocolo, ¿cómo se sabe (al recibir datos) a qué usuario se debe entregar un paquete?
   * En cada paso se introduce en el header una *clave de demultiplexación*, que será utilizada en el otro extremo para ubicar el destinatario del mensaje.
   * El formato de la clave de demultiplexación depende de la especificación del protocolo.
   
### Arquitectura OSI

Es un modelo de referencia para grafos de protocolos propuesto por ISO, que separa en siete capas la funcionalidad que debe ofrecer la red, en donde cada capa puede ser ocupada por distintos protocolos. Las capas son:

   1. Física: transmisión de bits sobre los canales de comunicación
   1. Enlace: manipulación de frames (interfaz de drivers típicamente)
   1. Red: routeo de paquetes en red switcheada
   1. Transporte: comunicación interp-roceso (mensajes), presente en nodos extremos
   1. Sesión (?)
   1. Presentación (?)
   1. Aplicación: donde se da significado a los datos que se envian
   
### Arquitectura de Internet

Es el grafo de protocolos utilizado para Internet y su predecesor, ARPANET, e influyó fuertemente al modelo OSI. Define los siguientes niveles:

   1. Nivel básico de servicios de red del cuál no se asume nada
   1. IP: soporta la interconección de redes de distintos tipos de forma unificada en una red lógica unificada
   1. TCP/UDP: protocolos de transporte orientados a conexión o datagramas, respectivamente
   1. Aplicaciones (FTP, Telnet, SMTP, etc.)
   
El foco del diseño está en la capa de *IP*. Este protocolo puede utilizarse sobre distintos soportes y sobre éste se pueden implementar protcolos de transporte y aplicaciones arbitrarias. Esta característica es una de las razones fundamentales de que Internet se haya podido adaptar a los cambios tecnológicos.
