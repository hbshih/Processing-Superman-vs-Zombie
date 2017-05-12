class Superman {

  //-- General Variables
  PImage img; // Image
  int w, h; // the width and height of the image
  float x, y; // position
  int position; // moving up and down (-1:down , 0:stop, 1:up)
  float speed; // speed
  float interval; //A time between two frame
  float pt;

  //-- Constructor

  Superman(String img, float x, float y, int dlru, float speed, float interval) {

    this.img = loadImage(img);
    this.x = x; // Position
    this.y = y; // Position
    this.position = position; // Updated position
    this.speed = speed; // The moving speed
    this.interval = 1000/interval; // The time of switching the previous image
    this.pt= millis();
  }

 // set direction
  void setPosition(int position) {
    this.position = position;
  }


  float posX() {
    return this.x;
  }
  float posY() {
    return this.y;
  }
    // Display object
  void display() {
    // If not reach the time of switching frame
    if (abs(pt-millis())<interval) {
      _Superman.showImage();
      return;
    }

    pt = millis();

    //  Determine direction
    
    //move up
    if (position == -1) {
      y = y - speed;
    }
    //move down
    if (position == 1) {
      y = y + speed;
    }
    showImage();
  }
  void showImage() {
    image(img, x, y);
  }
}

