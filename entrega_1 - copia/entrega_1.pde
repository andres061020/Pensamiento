size(500,500);
background(32,203,255);

//rectangulo de mitad para abajo
stroke(91, 254, 18);//color de linea
fill(91, 254, 18);//color de relleno 
rect(0,300 , 500,300);//posicion y tamaño

//primer montaña
stroke(91, 254, 18);//color de linea
fill(91, 254, 18);//color de relleno
triangle(300,300, 0,300,  100,200);//posicion y tamaño

//segundo triangulo
triangle(400,200, 500, 300, 300, 300);

//sol y lineas del sol
fill(246,222,18);
circle(400,100, 50);//sol
line(400,130,400,180);//linea sol
line(430,130,470,160);
line(430,100,480,100);
line(310,100,370,100);
line(400,20,400,65);//
line(365,130,320,160);
line(365,70,320,50);
line(430,70,465,40);

//casa
stroke(154, 87,18);
fill(192, 133,43);
rect(290,380,80,80);
fill(204, 133,83);
triangle(370,380,290,380,330,300);
