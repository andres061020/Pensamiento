int incrementos = 50;

void setup() {     //Queria ver si era posible para que no se moviera el diseño
  size(400, 400);
  background(255); 

  for (int x = 0; x <= width; x += incrementos) {
    for (int y = 0; y <= height; y += incrementos) {
      fill(random(150,230), random(20,55), random(20,50));// colores 
      noStroke();
      rect(x, y , incrementos,incrementos);//formas
      ellipse(x, y, 30, 30);  // Dibuja un círculo
      
    }
  }
}
