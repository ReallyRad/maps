float offset;
color [] fancyColor = new color[7];
boolean goUp;

void setup() {
  size(400, 400);
  offset = 27;
  setColor();
  goUp=true;
}

void draw() {
  setColor();
  //background(220,143);
  int rotations = 9; //number of repetitions along rotation
  int radius = 36;  //number of repetitions radially 
  float circleDiameter = 0.12; //circles size
  float betweenCircles = 28.03; //distance between circles
  float step = 0.25;
  if (goUp) offset+=step;
  if (!goUp) offset-=step;
  if (offset>41.6) goUp = false;
  if (offset<7) goUp = true;
  
  noStroke();
  //strokeWeight(0.0);
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(offset*0.08);
  for (int k=0; k<1; k++) {
  for (int i=0; i < radius; i++) {    
    for (int j=0; j<rotations; j++) {
      fill(fancyColor[j%fancyColor.length]);
      float rad = gauss(i, offset+18*k)*circleDiameter;
      float x = cos(TWO_PI/rotations*j)*i*betweenCircles;
      float y = sin(TWO_PI/rotations*j)*i*betweenCircles;
      float dist = dist( width/2, height/2, x, y );
      float scale = map( dist, 4, width/2, 8, 6 );
      pushMatrix();
      translate( x, y );
      scale( scale );
      ellipse(0+noise(6.4), 0+noise(7.4), rad+noise(6.7), rad+noise(2.1));
      popMatrix();
    }
  }
}
  popMatrix();
}

int gauss (float i, float offset) {//sample bell curve at i, given center of bell curve at offset
  float x = -0.6 * (i - offset + 20) - 5.2;
  return (int)(230 * pow(3, -pow(x * 0.3, 2)));
}

void setColor() {
  fancyColor[0] = color(253, 93, 93, 251);
  fancyColor[1] = color(166, 150, 150, 288);
  fancyColor[2] = color(5, 5, 5, 337);
  fancyColor[3] = color(0, 249, 70, 380);
  fancyColor[4] = color(235, 235, 235, 294);
  fancyColor[5] = color(37, 35, 35, 278);
  fancyColor[6] = color(163, 159, 159, 250);
}
