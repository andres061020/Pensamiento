Escena infierno, purgatorio, paraiso;
int estado = 0;

PImage imgInfierno, imgPurgatorio, imgParaiso;

String mensajeExtra = "";
int tiempoMensaje = 0; // Control para que desaparezca el mensaje
//COnfiuracion de canva y presentacion de texto
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  textSize(20);

  imgInfierno = loadImage("entradaalinfierno.jpg");//cargar Imagenes escena 1
  imgPurgatorio = loadImage("entradaalpurgatorio.jpg");//cargar Imagenes escena 2
  imgParaiso = loadImage("entradaalcielo.jpg");//cargar Imagenes escena 3

  // Crear escenas
  infierno = new Escena(
    "Infierno",
    imgInfierno,
    "Dante se encuentra perdido en una selva oscura, símbolo de su crisis espiritual.\n" +
    "Guiado por Virgilio, desciende a través de los nueve círculos del Infierno,\n" +
    "donde las almas son castigadas eternamente según la gravedad de sus pecados."// textos con mas informacion de mi historia 
  );

  purgatorio = new Escena(
    "Purgatorio",
    imgPurgatorio,
    "Dante y Virgilio ascienden por el Monte del Purgatorio, dividido en siete terrazas.\n" +
    "Las almas aquí sufren para purificarse, pero tienen esperanza de llegar al Paraíso.\n" +
    "Beatriz, símbolo del amor divino, lo espera en la cima para guiarlo hacia la luz."
  );

  paraiso = new Escena(
    "Paraíso",
    imgParaiso,
    "Guiado por Beatriz, Dante atraviesa los nueve cielos, donde habitan santos y sabios.\n" +
    "Allí comprende la estructura del universo, la justicia divina y el amor eterno.\n" +
    "Finalmente contempla a Dios en el Empíreo, alcanzando la visión suprema."
  );
}

void draw() {
  background(0);

  if (estado == 0) {
    background(30);
    fill(255);
    textSize(22);
    text("Presiona ↓ para comenzar el viaje de Dante", width/2, height/2 - 30);//hacer la interaccion mas intuitu
    textSize(16);
    text("Usa las flechas ↑ ↓ ← → para avanzar y retroceder entre escenas", width/2, height/2 + 10);
  } else if (estado == 1) {
    infierno.mostrar();
  } else if (estado == 2) {
    purgatorio.mostrar();
  } else if (estado == 3) {
    paraiso.mostrar();
  }

  // Mostrar mensaje extra con el mousse
  if (mensajeExtra != "" && millis() - tiempoMensaje < 4000) {
    fill(0, 200);
    rect(100, 100, width - 200, 100);
    fill(255);
    textSize(16);
    text(mensajeExtra, width/2, 150);
  }
}
//codigos para cambiar entre escenas segun las teclas 
void keyPressed() { 
  if (keyCode == DOWN && estado == 0) {
    estado = 1;
  } else if (keyCode == RIGHT && estado == 1) {
    estado = 2;
  } else if (keyCode == UP && estado == 2) {
    estado = 3;
  } else if (keyCode == LEFT && estado > 1) {
    estado--; // Permitir retroceso con flecha izquierda
  }
}

void mousePressed() { // Mensajes extras
  if (estado == 1) {
    mensajeExtra = "El Infierno es eterno: no hay retorno para los condenados.";
  } else if (estado == 2) {
    mensajeExtra = " El Purgatorio ofrece esperanza: cada alma avanza hacia la luz.";
  } else if (estado == 3) {
    mensajeExtra = " En el Paraíso, todo es armonía y amor divino sin fin.";
  }
  tiempoMensaje = millis();
}

// Clase Escena con imagen de fondo
class Escena {
  String nombre;
  PImage fondo;
  String descripcion;

  Escena(String n, PImage img, String d) {
    nombre = n;
    fondo = img;
    descripcion = d;
  }

  void mostrar() {
    image(fondo, 0, 0, width, height);
    fill(0, 180);
    rect(50, 400, width - 100, 160);
    fill(255);
    textSize(22);
    text(nombre, width/2, 420);
    textSize(16);
    text(descripcion, width/2, 470);
  }
}
