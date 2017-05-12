class Enemy {
  // ------ Global variables
  PImage img; // Image
  int w, h; // The width and height for the image
  float x, y; // the position
 float interval; // A time between two frame
  float mx, my; // the update position
  float pt; // the time of the privious displaying picture

  // ------- Constructor
  Enemy(String img, float x, float y, float interval, float mx, float my) {
    this.img = loadImage(img);
    w = this.img.width;
    h = this.img.height;
    this.x= x;
    this.y = y;
    this.mx=mx;
    this.my=my;
    this.interval = 1000/interval;
    this.pt=millis();
  }
  // Get current position
  float getX() {
    return this.x;
  }
  float getY() {
    return this.y;
  }

  // Get the width & height of the image
  float getH() {
    return this.h;
  }
  float getW() {
    return this.w;
  } 

  //Get the diffrence of the current position and the update position
  float getMX() {
    return this.mx;
  }
  float getMY() {
    return this.my;
  }
  // Display the object
  void display() {
    //if not reach the time of changing
    if (abs(pt-millis())<interval) {
      showImage();
      return;
    }
      x+=mx;
    //Display image
    showImage();
  }
  // Display the image of the enemy
  void showImage() {
    tint(255, 255); 
    image(img, x, y);
  }
}














