class Explosion {

  PImage img; // The image of the explosion
  int w, h; // The width & height of the image
  float x, y; // The position of the explosion
  int speed = 0; // The current spped
  boolean finished;
  int interval; //the time between two switching frame
  int pt;
  
  Explosion(PImage img, float x, float y, int interval) {

    this.img = img;
    this.x = x; // Default position
    w = img.width/4; // the  width of the pic
    h = img.height/4; // the height of the pic
    this.y = y;
    this.finished=false;
    this.interval=1000/interval;
    pt=millis();
  }
  // If the explosion is finish
  boolean isFinished() {
    return finished;
  }
  // Display the explosion
  void display() {
    if (abs(pt-millis())<interval) {
      showImage();
      return;
    }
    pt = millis();
    speed++;
    if (speed>15) {
      finished = true;
    }
    // display
    showImage();
  }

  void showImage() {
    if (!finished) {
      int k = speed/4;
      int r = speed%4;
      //draw the explosion frame
      image(img, x, y, w, h, w*r, k*h, w*r+w, k*h+h);
      x = x - random(2);
      // Made the explosion image move backward, this will make it looks like the explosion is moving forward 
    }
  }
}




















