class Bullet {  
  // ------ Global Variables
 
  float x, y;   // The coordinate of bullet
  float speed;   // The moving speed of bullet
  float interval;  //The changing time of the bullet display (millisecond)
  float pt;  //The time of the previous display

  //---------Constructor
  Bullet(float x, float y, float speed, float interval) { 
    this.x = x;
    this.y = y;
    this.speed = speed;
    this. interval = 1000/interval;
    this.pt=millis();
  }


  //Get the current position
  float posX() {
    return x;
  }
  float posY() {
    return y;
  }

  //Set the current position
  void setX(float x) {
    this.x=x;
  }
  void setY(float y) {
    this.y=y;
  }  


  //Display objects
  void display() {
      // If not reach the time of switching
    if (abs(pt-millis())<interval) {
      showImage();
      return;
    }
    pt=millis();
    // moving left
    x = x - speed;
    //displaying bullet image
    showImage();
  }  
 // Draw bullet
  void showImage() {    
    noStroke();  // no stroke
         // The
     fill(255, 0, 0);     
     ellipse(x, y, 15, 10); 
    fill(255, 255, 0);     
    ellipse(x, y, 8, 5); 

    //     if(x<-100) shoot(true);
  }
}    



