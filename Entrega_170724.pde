Table table;
int nSamples;

float[] appUsagetime;
float[] screenOntime;

void setup() {
  size(500, 500);

  table = loadTable("synthetic_asthma.csv", "header");
  nSamples = table.getRowCount();

  appUsagetime = new float[nSamples];
  screenOntime = new float[nSamples];

  for (int i = 0; i < nSamples; i = i + 1) {
    appUsagetime[i] = table.getFloat(i, "App Usage Time (min/day)");
    screenOntime[i] = table.getFloat(i, "Screen On Time (hours/day)");
  }

  noLoop(); // Solo dibuja una vez
}

void draw() {
  background(255);

  for (int i = 0; i < nSamples; i = i + 1) {
    float x = map(appUsagetime[i], 0, max(appUsagetime), 0, width);
    float y = map(screenOntime[i], 0, max(screenOntime), height, 0);

    // Paleta más variada
    fill(random(100, 255), random(50, 200), random(50, 255), 200);
    noStroke();
    float s = 10;

    // Alternar entre triángulo y cuadrado
    if (i % 2 == 0) {
      // Triángulo
      triangle(x, y - s, x - s, y + s, x + s, y + s);
    } else {
      // Cuadrado
      rectMode(CENTER);
      rect(x, y, s, s);
    }
  }
}
