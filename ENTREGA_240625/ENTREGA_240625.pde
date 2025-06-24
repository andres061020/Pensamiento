// Variables para los elementos
float solY;
float tamañoSol;
float rayLuz;

void setup() {
  size(500, 500);    //Tamaño lienzo
  solY = 330;        // El sol inicia detrás de las montañas
  tamañoSol = 50;    // Tamaño inicial del sol
  rayLuz = 0;        // Largo inicial de los rayos
}

void draw() {
  // CIELO que cambia con el sol 
  // De azul oscuro a azul claro
  float Color_1 = map(solY, 330, 130, 30, 135);
  float Color_2 = map(solY, 330, 130, 30, 206);
  float Color_3 = map(solY, 330, 130, 80, 255);
  background(Color_1, Color_2, Color_3);

  // PASTO 
  stroke(91, 254, 18);
  fill(91, 254, 18);
  rect(0, 300, 500, 300);

  // MONTAÑAS 
  triangle(300, 300, 0, 300, 100, 200);
  triangle(400, 200, 500, 300, 300, 300);

  // CASA -----
  stroke(154, 87, 18);
  fill(192, 133, 43);
  rect(290, 380, 80, 80);
  fill(204, 133, 83);
  triangle(370, 380, 290, 380, 330, 300);

  // POSICION DEL SOL
  float solColor = map(solY, 330, 130, 50, 255);
  fill(255, solColor, 0);
  noStroke();
  ellipse(width/2, solY, tamañoSol, tamañoSol); // El sol centrado

  // RAYOS DE SOL 
  stroke(255, solColor, 0);
  for (int i = -2; i <= 2; i++) {
    line(width/2, solY, width/2 + i*20, solY + rayLuz);
  }

  // Movimiento del sol hacia arriba hasta cierto punto 
  //(como si saliera del fondo de la montaña)
  if (solY > 130) {
    solY -= 0.5;
  }

  // Aumento del largo de los rayos hasta cierto valor
  if (rayLuz < 80) {
    rayLuz += 0.3;
  }
}
