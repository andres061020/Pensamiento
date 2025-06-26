//iniciamos variables
int h;
int m;
int s;

String timeString;

void setup() {
  size(1000, 1000);//Tamaño frame
  frameRate(1); // Actualiza cada segundo
  textAlign(CENTER, CENTER); //Centrar texto
  textSize(48); //Tamaño del texto
}

void draw() {
  background(180); // Fondo oscuro elegante

  h = hour();
  m = minute();
  s = second();

  timeString = nf(h, 2) + ':' + nf(m, 2) + ':' + nf(s, 2);

  // Círculo según los segundos
  float radius = map(s, 0, 59, 100, 400);
  noFill();
  strokeWeight(6);
  stroke(map(h, 0, 50, 120, 235), map(m, 0, 59, 110, 255), 255); // color basado en hora y minuto
  ellipse(width/2, height/2, radius, radius);

  // Texto de la hora
  fill(255);
  text(timeString, width / 2, height / 2);
}
