float offset;
color [] fancyColor = new color[7];

void setup() {
  size(800, 800);
  offset = -1.5;
  setColor();
}

void draw() {
  setColor();
  background(220);
  int rotations = 28; //number of repetitions along rotation
  int radius = 77;  //number of repetitions radially 
  float circleDiameter = 0.05; //circles size
  int betweenCircles = 3; //distance between circles

  offset+=0.19;
  if (offset>120.6) offset=19.8;

  noStroke();
  
  pushMatrix();
  translate(400, 400);
  rotate(offset*0.01);
  for (int i=0; i < radius; i++) {    
    for (int j=0; j<rotations; j++) {
      fill(fancyColor[j%fancyColor.length]);
      float rad = gauss(i, offset)*circleDiameter;
      float x = cos(TWO_PI/rotations*j)*i*betweenCircles;
      float y = sin(TWO_PI/rotations*j)*i*betweenCircles;
      float dist = dist( width/2, height/2, x, y );
      float scale = map( dist, 0, width/2, 1, 3 );
      pushMatrix();
      translate( x, y );
      scale( scale );
      ellipse(0, 0, rad, rad);
      popMatrix();
    }
  }
  popMatrix();
}

int gauss (float i, float offset) {//sample bell curve at i, given center of bell curve at offset
  float x = -0.3 * (i - offset + 3) - 2.5;
  return (int)(255.f * pow(5, -pow(x * 0.3, 2)));
}

void setColor() {
  fancyColor[0] = color(175, 175, 175);
  fancyColor[1] = color(226, 0, 0);
  fancyColor[2] = color(254, 250, 250);
  fancyColor[3] = color(0, 2, 2);
  fancyColor[4] = color(72, 228, 72);
  fancyColor[5] = color(37, 35, 35);
  fancyColor[6] = color(121, 121, 121);
}
