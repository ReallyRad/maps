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
  int rotations = 13; //number of repetitions along rotation
  int radius = 73;  //number of repetitions radially 
  float circleDiameter = 0.10; //circles size
  int betweenCircles = -1; //distance between circles

  offset+=1.24;
  if (offset>77.8) offset=0.3;

  noStroke();
  
  pushMatrix();
  translate(400, 400);
  rotate(offset*0.02);
  for (int k=0; k<3; k++) {
  for (int i=0; i < radius; i++) {    
    for (int j=0; j<rotations; j++) {
      fill(fancyColor[j%fancyColor.length]);
      float rad = gauss(i, offset+60*k)*circleDiameter;
      float x = cos(TWO_PI/rotations*j)*i*betweenCircles;
      float y = sin(TWO_PI/rotations*j)*i*betweenCircles;
      float dist = dist( width/2, height/2, x, y );
      float scale = map( dist, 0, width/2, 8, 4 );
      pushMatrix();
      translate( x, y );
      scale( scale );
      ellipse(0, 0, rad, rad);
      popMatrix();
    }
  }
}
  popMatrix();
}

int gauss (float i, float offset) {//sample bell curve at i, given center of bell curve at offset
  float x = -0.6 * (i - offset + 20) - 5.2;
  return (int)(230 * pow(3, -pow(x * 0.1, 2)));
}

void setColor() {
  fancyColor[0] = color(143, 143, 143, 174);
  fancyColor[1] = color(253, 214, 0, 198);
  fancyColor[2] = color(183, 182, 179, 230);
  fancyColor[3] = color(0, 2, 2, 133);
  fancyColor[4] = color(72, 228, 72, 191);
  fancyColor[5] = color(37, 35, 35, 5);
  fancyColor[6] = color(121, 121, 121, 89);
}
