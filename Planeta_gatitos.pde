import processing.sound.*;

PImage img;
int index = 0;

// Arreglo de sonidos por planeta (del 1 al 8)
SoundFile[] sonidos = new SoundFile[10];

void setup() {
  size(500,500);

  // Cargar sonidos
  sonidos[1] = new SoundFile(this, "mercurio.wav");
  sonidos[2] = new SoundFile(this, "venus.wav");
  sonidos[3] = new SoundFile(this, "tierra.wav");
  sonidos[4] = new SoundFile(this, "marte.wav");
  sonidos[5] = new SoundFile(this, "jupiter.wav");
  sonidos[6] = new SoundFile(this, "saturno.wav");
  sonidos[7] = new SoundFile(this, "urano.wav");
  sonidos[8] = new SoundFile(this, "neptuno.wav");

  loadImageEvent(index);
}
// configuración lienzo
void draw() {
  background(255);
  image(img, 0, 0, width, height);
}
/// tecla -> para cambiar de imagen
void keyPressed() {
  if (keyCode == RIGHT) {
    // Detener sonido anterior si está sonando
    if (index >= 1 && index <= 8 && sonidos[index].isPlaying()) {
      sonidos[index].stop();
    }

    // Avanzar de imagen
    index++;
    if (index > 9) index = 0;

    // Mostrar imagen actual
    loadImageEvent(index);

    // Reproducir sonido solo si es un planeta (1 a 8)
    if (index >= 1 && index <= 8) {
      sonidos[index].play();
    }
  }
}

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
