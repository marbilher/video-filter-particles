import processing.video.*;

//variable for capture device
Capture video;
color trackColor;
Burst[] bursts = new Burst[1];



void setup() {
  size(1280, 960);
  video = new Capture(this, width, height);
  video.start();
  //start off tracking for red
  trackColor = color(255, 0, 0);
  bursts[0] = new Burst (mouseX, mouseY, random(0,0), random(-5, 5), int(random(0,3)));

}


void captureEvent(Capture video) {
  //read image from the camera
  video.read();
}

void draw() {
  video.loadPixels();
  image(video, 0, 0);
  
  float worldRecord = 500;
  // (x, y) coord of close color
  int closestX = 0;
  int closestY = 0;
  //begin loop to walk through every pixel
  for (int x = 0; x < video.width; x++) {
    for (int y = 0; y < video.height; y++) {
      int loc = x + y * video.width;
      //what is our current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      //use euclidean distance to compare
      float d = dist(r1, g1, b1, r2, g2, b2);
      
      //if current color is more similar to tracked color than closest
      //color, save that location and difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  if (worldRecord < 10) {
    
      //new burst object
  Burst b = new Burst (closestX, closestY, random(2, 8), random(0, 0), int(random(0,3)));
  //append to array
  bursts = (Burst[]) append(bursts, b);
  }
  
  for (int i = 0; i < bursts.length; i++) {

  bursts[i].move();
  bursts[i].display();  
}
}
void mousePressed() {
  //save color where the mouse is clickedin trackColor variable
  int loc = mouseX+mouseY*video.width;  
  trackColor = video.pixels[loc];

}


        
      
  
  

  