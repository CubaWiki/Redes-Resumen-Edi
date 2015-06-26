# Unidad 3: Nivel físico

## Conceptos básicos


Clasificación de medios de transmisión:

   * Guiados: la señal electromagnética es guiada a través de un canal físico (cable coaxil, fibra óptica, etc.).
   * No guiados: son medios inalámbricos (como por ejemplo, el vacío, el aire, agua)

Modos de operación:

   * Simplex: siempre en el mismo sentido, hay un extremo emisor y uno receptor
   * Half duplex: puede ser en ambos sentidos, pero no al mismo tiempo
   * Full duplex: ambos lados pueden transmitir simultaneamente

La información viaja en el medio en forma de onda electromagnética. Estas ondas pueden entenderse como funciones del tiempo, pero también como funciones de la frencuencia. Pensar la frecuencia como dominio será más útil para entender la transmisión de datos.

### Señales como funciones del tiempo

Pensadas como función del tiempo, las señales pueden ser analógicas o digitales.

   * Analógicas: la señal tiene variaciones suaves
   * Digitales: la señal se mantiene estable durante un tiempo hasta que cambia de valor y vuelve a mantenerse

Las señales más sencillas son las **señales periódicas**. Una señal es periódica si tiene un patrón que se repite a lo largo del tiempo. Es decir, existe un *T* mínimo que satisface para todo *t*:

$$s(t) = s(t + T)$$

La forma fundamental de señal periódica es la **onda sinusoidal**, que puede representarse por:

   * amplitud: valor máximo de la señal
   * frecuencia: cantidad de veces por segundo que la señal se repite
   * fase: desplazamiento
   
De la frecuencia se deriva el período (T = 1/f), que es cuánto tarda la onda en llegar al mismo lugar.

También se puede interpretar esta onda en función de la distancia espacial de la fuente, y la relación entre ambas interpretaciones (tiempo y espacio) está dada por la longitud de onda.

### Señales como funciones de la frecuencia

Una onda electromagnética puede estar compuesta de varias frecuencias. Por ejemplo:

$$s_{ej}(t) = (4/\pi) \times [\sin(2 \pi f t) + (1/3)\sin(2 \pi 3 f t)]$$

puede ser descompuesta en dos señales más simples, una con frecuencia $$$f$$$ y otra con frecuencia $$$3f$$$.

Utilizando análisis de Fourier, puede mostrarse que ***cualquier onda*** puede expresarse como una suma de sinusoides de distintas frecuencias (cada una con su amplitud, frecuencia y fase).

Así como definimos la señal como una función del tiempo, se puede derivar una función $$$S(f)$$$, que indica para cada frecuencia que compone la señal cuál es el pico de amplitud.

   * El **espectro** de una señal es el rango de frecuencias que contiene. Por ejemplo, el espectro de $$$s_{ej}$$$ se extiende de $$$f$$$ a $$$3f$$$.
   * El **ancho de banda absoluto** es el ancho del espectro. En el ejemplo, $$$2f$$$.
   * Algunas señales tienen ancho de banda absoluto infinito pero la mayoría de la energía de la señal está contenida en un conjunto acotado de señales. Esta banda es el **ancho de banda efectivo** (o simplemente **ancho de banda**).

#### Frecuencia fundamental

   * Cuando en una señal existe una frecuencia $$$f$$$ tal que todas las otras señales son múltiplos enteros de la misma, llamamos a $$$f$$$ la **frecuencia fundamental**. 
   * El período de la onda será igual al período de la componente de frecuencia $$$f$$$: $$$T = 1/f$$$
   * Esto se explica viendo que  dentro de cada repetición de frecuencia $$$f$$$ habrá una cantidad entera de repeticiones de las mayores frecuencias. La onda total, entonces, se repetirá con cada período de la frecuencia menor.
   
### Relación entre capacidad y ancho de banda

Hay tres factores que entran en juego para entender la velocida de transmisión de un medio:

   * Bitrate (cuántos bits por segundo se desean enviar)
   * Ancho de banda utilizado
   * Capacidad del receptor de distinguir impulsos positivos y negativos

Para ver cómo juegan entre sí, supongamos que queremos utilizar la onda cuadrada para codificar un flujo de unos y ceros alternados:

<img src="http://i.imgur.com/yWlm1KW.png" style="width: 300px">

Un análisis arrojará que esta señal consiste de infinitas frecuencias:

$$s(t) = A \times {4\over\pi} \times \sum_{k\ impar,\ k=1}^{\inf} {{\sin(2\pi k f t)}\over{k}}$$

Sin embargo, si incorporamos uno a uno los componentes (es decir, aumentamos el $$$k$$$) vemos que tras agregar algunas pocas frecuencias la señal se comienza a parecer mucho a la que queremos obtener. A medida que se aumenta el ancho de banda disminuye la distorción, y será más fácil reconocer pulsos positivos de los negativos. Depende del receptor de la señal qué grado de distorción es tolerable para distinguir los impulsos.

<img src="http://i.imgur.com/7lD0Dra.png" alt="Drawing" style="width: 300px;"/>

Supongamos, en el caso de la imagen anterior, que al receptor le alcanza un ancho de banda de 900 Hz para distinguir los impulsos. ¿Qué sucede si se quiere duplicar el bitrate? Suponiendo fija la capacidad del receptor, hará falta aumentar también el ancho de banda poder transmitir mayor cantidad de bits por segundo.

Conclusiones:

   * Por motivos prácticos se limita el ancho de banda
   * Limitar el ancho de banda crea distorciones, que dificultan interpretar los datos
   * A mayor bitrate, hará falta mayor ancho de banda efectivo para poder transmitir

   
## Medios de transmisión

### Medios guiados

#### Par trenzado:

   * Es el medio más barato y muy utilizado.
   * Consiste de dos alambres de cobre aislados trenzados que funcionan como un único canal.
   * A veces se juntan varios pares en un cable.
   * Sirve para transmisión analógica y digital.
   * Limitado en distancia, ancho de banda y capacidad.
   
#### Cable coaxil

   * Consiste de dos conductores, un cilindro exterior que contiene a otro.
   * Soporta un mayor rango de frecuencias (y por ende multiplexación FDM).
   * Menos suceptible a distorciones.
   * Sirve para transmisión analógica y digital.

#### Fibra óptica

   * Consiste de un cable muy fino compuesto de fibras por el que se guia un rayo óptico
   * La luz se propaga por el núcleo y se va reflejando en el revestimiento
   * Mucha mayor capacidad que los otros medios
   * Más resistente a distorciones

### Medios no guiados

Los tipos de comunicación inalámbrica se dividen según el rango de frecuencia que utilicen las ondas

   
#### Radio

   * Entre 30 MHz y 1 GHz
   * Transmisión omnidireccional
   * Se transmite y recibe con antenas

#### Microondas

   * Entre 1 GHz y 40GHz.
   * Útil para transmisiones punto a punto direccionales.
   * Utilizado en transmisiones de satélite

#### Infrarojo

   * Entre $$$3 \times 10^{11}$$$ y $$$2 \times 10^{14}$$$ Hz.
   * Transmisión local punto a punto y multipunto en espacios reducidos.
   
## Formatos de transmisión

Tanto información digital como analógica puede ser codificada por medios digitales o analógicos:

Información | Señal | Características / Usos
------------ | ------------- | ------------
Digital | Digital  | Equipamiento sencillos
Digital | Analógico | Internet sobre medios que sólo soportan señales analógicas (teléfono)
Analógico | Digital  | Enviar audio o video que se samplean para enviarse por un medio digital
Analógico | Analógico  | Modular una señal para enviarla en una banda de frecuencia distinta. 

   * Un **modem** se utiliza para convertir datos digitales y enviarlos en una señal analógica, y hacer la conversión inversa en el lado del receptor.
   * Un **codec** se utiliza para convertir datos analógicos y enviarlos en una señal digital, y hacer la conversión inversa en el lado del receptor.
   * Si bien ambos dispositivos saben revertir la conversión, no se puede reemplazar un modem con un codec (o viceversa). El codec reconstruya una señal analógica a partir de las muestras que otro codec generó, pero no puede convertir a analógico cualquier dato digital.

### Datos analógico en señales digitales

Proceso llevado a cabo por el codec:

   * Se "separa" la señal por frecuencias (series de Fourier)
   * Se muestrea al doble de frecuencia para no perder datos (Teorema de Muestreo, Nyquist)
   * Se cuantifica cada muestra con un número entero de $$$n$$$ bits
   

### Datos digitales en señales analógicas

Para este tipo de conversión se modula alguno de los tres parámetros de la señal (amplitud, frecuencia, fase) para poder encodear los valores de la señal digital.

<img src="http://i.imgur.com/JUMBCKy.png" style="width: 300px">

#### ASK (amplitud)
Se codifica usando dos valores de amplitud (típicamente uno es cero).

#### FSK (frecuencia)
Se codifica usando distintos valores de frecuencia cercanos a la frecuencia del carrier. El caso más sencillo es BFSK (*binary frecuency shift keying*), donde un valor de frecuencia representa un 1 y el otro un 0. Hay codificaciones que utilizan más valores.

#### PSK (fase)
Se codifica usando distintos valores de fase. El caso más sencillo es BPSK (*binary phase shift keying*), donde un valor de fase representa un 1 y el otro un 0. Por ejemplo, usando un desplazamiento igual a $$$\pi$$$ resultará en que para un 1 se tendrá una sinusoide espejada 180º con respecto a la del 0. Hay codificaciones más complejas.

#### Datos digitales en señales digitales

Se utilizan distintos tipos de encodings para representar los bits de información en la señal digital.

#### NRZ
   * *Non Return to Zero*.
   * 0 se codifica con alta tensión.
   * 1 se codifica con baja tensión.
   * No provee sincronización.

#### NRZI
   * *Non Return to Zero, Inverted*.
   * 0 se codifica con ausencia de transiciones al inicio del intervalo de cada bit.
   * 1 se codifica con transición al inicio del intervalo de cada bit.
   * Idea: Puede ser más fácil detectar cambios que el valor en sí.
   * No provee sincronización, aunque previene de secuencias largas de unos.

   
#### Códigos de alta densidad
   * Atacan los problemas de sincronización reemplazando cadenas de tensión constante por otra que introduzca transiciones
   * Ejemplos: B8ZS y HDB3
   
#### Manchester
   * Transiciones a mitad del intervalo de cada bit.
   * 0 se codifica con transición de alto a bajo.
   * 1 se codifica con transición de bajo a alto.
   * Previene los problemas de los otros, pero el receptor debe poder leer las señales el doble de rápido.
   
   
#### Manchester diferencial
   * Siempre hay transición a mitad del intervalo
   * 0 se codifica si con transición al inicio del intervalo
   * 1 se codifica con ausencia de transición al inicio del intervalo

