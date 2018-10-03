
class Lights extends Burst {
  
  
  Lights(float tempX, float tempY, float tempR, float tempAcceleration, int tempHue) {
    super(tempX, tempY, tempR, tempAcceleration, tempHue);
    
  }
  
  void display() {
    fill(255);
    ellipse(0, 0, 50, 50);
    
  }
}