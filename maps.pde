 
float offset;

void setup(){
  size(800, 800);
  offset = -1.5;
}

void draw(){
  background(7);
  int rotations = 12; //number of repetitions along rotation
  int radius = 10;  //number of repetitions radially 
  float circleDiameter = 0.01; //circles size
  int betweenCircles = 21; //distance between circles
  
  offset+=0.05;
  if (offset>3.2) offset=-1.2;
  
  
  pushMatrix();
  translate(400, 400);
  for (int i=0; i < radius; i++){    
    for (int j=0; j<rotations; j++){
      ellipse(cos(TWO_PI/rotations*j)*i*betweenCircles,
              sin(TWO_PI/rotations*j)*i*betweenCircles, gauss(i, offset)*circleDiameter, gauss(i, offset)*circleDiameter);      
    }
  }
  popMatrix();   
}

int gauss (float i, float offset) {//sample bell curve at i, given center of bell curve at offset
  float x = 0.5 * (i - offset + 3) - 1.5;
  return (int)(255.f * pow(5, -pow(x * 1.5, 2)));
}
