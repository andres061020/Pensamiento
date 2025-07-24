import processing.sound.*;// IMPORTACIÓN DE LIBRERIA SONIDO

//VARIABLES
PImage img;
int index = 0;

// ARREGLO DE SONIDOS POR PLANETA (1-8)
SoundFile[] sonidos = new SoundFile[10];

// ARREGLO NOMBRE DE LOS PLANETAS (1-8)
String[] nombresPlanetas = {
  "", // índice 0 sin nombre
  "Mercurio", "Venus", "Tierra", "Marte",
  "Júpiter", "Saturno", "Urano", "Neptuno"
};
// CONFIGURACIÓN INICIAL
void setup() {
  size(500, 500);
  
  // CARGAR SONIDOS
  sonidos[1] = new SoundFile(this, "mercurio.mp3");
  sonidos[2] = new SoundFile(this, "venus.mp3");
  sonidos[3] = new SoundFile(this, "tierra.mp3");
  sonidos[4] = new SoundFile(this, "marte.mp3");
  sonidos[5] = new SoundFile(this, "jupiter.mp3");
  sonidos[6] = new SoundFile(this, "saturno.mp3");
  sonidos[7] = new SoundFile(this, "urano.mp3");
  sonidos[8] = new SoundFile(this, "neptuno.mp3");

  loadImageEvent(index);
}

void draw() {
  background(255);
  image(img, 0, 0, width, height);
  
  // MOSTRAR MENSAJE INICIAL
  if (index == 0) {
    textSize(30);
    fill(255);
    stroke(0);
    strokeWeight(4);
    textAlign(CENTER, CENTER); 
    text("Presiona la flecha → para comenzar", width / 2, height * 0.8);
  }

  //  MOSTRAR NOMBRE DEL PLANETAS SI ESTA EN 1-8
  if (index >= 1 && index <= 8) {
    textSize(40);
    fill(255);
    stroke(0);
    strokeWeight(5);
    textAlign(CENTER, BOTTOM);
    text(nombresPlanetas[index], width / 2, height - 20);
  }

  // MOSTRAR MENSAJE FINAL
  if (index == 9) {
    textSize(30);
    fill(0);
    noStroke();
    textAlign(CENTER, BOTTOM);
    text("¡Fin del recorrido!", width / 2, height / 2);
  }
}
// PRESIONAR TECLA PARA AVANZAR
void keyPressed() {
  if (keyCode == RIGHT) {
    if (index >= 1 && index <= 8 && sonidos[index].isPlaying()) {// índice actual corresponde a un planeta
      sonidos[index].stop();// detener el sonido anterior
    }

    index++;
    if (index > 9) index = 0; // si index se pasa de 9, lo reinicia a 0.

    loadImageEvent(index);//carga la imagen correspondiente 

    if (index >= 1 && index <= 8) {
      sonidos[index].play(); // Para ubicar el sonido de eese planeta para reproducir
    }
  }
}
//CARGAR IMAGENES
void loadImageEvent(int i) {
  switch(i) {
    case 0:
      println("Inicio: Galaxia con todos los planetas");
      img = loadImage("inicio.jpg");
      break;
    case 1:
      println("Mercurio");
      img = loadImage("mercurio.jpg");
      break;
    case 2:
      println("Venus");
      img = loadImage("venus.jpg");
      break;
    case 3:
      println("Tierra");
      img = loadImage("tierra.jpg");
      break;
    case 4:
      println("Marte");
      img = loadImage("marte.jpg");
      break;
    case 5:
      println("Júpiter");
      img = loadImage("jupiter.jpg");
      break;
    case 6:
      println("Saturno");
      img = loadImage("saturno.jpg");
      break;
    case 7:
      println("Urano");
      img = loadImage("urano.jpg");
      break;
    case 8:
      println("Neptuno");
      img = loadImage("neptuno.jpg");
      break;
    case 9:
      println("Fin del recorrido: Pandilla de gatitos");
      img = loadImage("fin.jpg");
      break;
    default:
      println("Reinicio");
      index = 0;
      img = loadImage("inicio.jpg");
      break;
  }
}
