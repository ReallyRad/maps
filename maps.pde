float offset;
color [] fancyColor = new color[7];

void setup() {
  size(800, 800);
  offset = -1.5;
  setColor();
}

void draw() {
  background(0);
  int rotations = 20; //number of repetitions along rotation
  int radius = 45;  //number of repetitions radially 
  float circleDiameter = 0.1; //circles size
  int betweenCircles = 26; //distance between circles

  offset+=0.02;
  if (offset>9.3) offset=-1.5;

  noStroke();
  
  pushMatrix();
  translate(400, 400);
  for (int i=0; i < radius; i++) {    
    for (int j=0; j<rotations; j++) {
      fill(fancyColor[j%fancyColor.length]);
      float rad = gauss(i, offset)*circleDiameter;
      float x = cos(TWO_PI/rotations*j)*i*betweenCircles;
      float y = sin(TWO_PI/rotations*j)*i*betweenCircles;
      float dist = dist( width/2, height/2, x, y );
      float scale = map( dist, 0, width/2, 1, 7 );
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
  float x = 0.5 * (i - offset + 3) - 1.5;
  return (int)(255.f * pow(5, -pow(x * 1.5, 2)));
}

void setColor() {
  fancyColor[0] = color(255, 0, 0);
  fancyColor[1] = color(255, 165, 0);
  fancyColor[2] = color(255, 255, 0);
  fancyColor[3] = color(0, 255, 0);
  fancyColor[4] = color(0, 0, 255);
  fancyColor[5] = color(75, 0, 130);
  fancyColor[6] = color(128, 0, 128);
}
