
class Burst {
  
  float x = .0;
  float y = .0;
  float ySpeed = random(-4, 4);
  float xSpeed = random(-4, 4);
  float acceleration = 0;
  float gravity = .2; 
  float r;
  int hue = int(random(0, 3));
  float size;
  int lifespan;
  
  
  
  
  Burst(float tempX, float tempY, float tempR, float tempAcceleration, int tempHue) {
    
    x = tempX;
    y = tempY;
    acceleration = tempAcceleration;
    r = tempR;
    hue = tempHue;
    lifespan = 255;
    
  }
  
  void move() {
    
    y += ySpeed;
    ySpeed += acceleration + gravity;
    x += xSpeed;
    xSpeed += acceleration;
    
      if ((x > width) || (x < 0)) {
    xSpeed = (xSpeed*-.96);
  }
    if ((y > height) || (y < 0)) {
    //ySpeed = (ySpeed*-.96);
  }
  
  }
  
  void display() {
    
    
    
    if (hue == 0 ) {
      fill(255, 200, 255, lifespan);
    } else if (hue == 1) {
      fill(200, 255, 255, lifespan);
    } else if (hue == 2) {
      fill(255, 255, 200, lifespan);
    }
    

  noStroke();
  pushMatrix();
  translate(x, y);
  scale(size);
  rotate(r);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();
 


    size = random(.3, .8);
    r += .03;
    lifespan -= 3;

  }
  
  
  
}
    
    
    