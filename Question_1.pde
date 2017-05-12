Superman _Superman; // The class of superman
PImage start_menu; // Start menu
PImage instructions; // Clicking "How to play"
PImage expImg; // Image of the explosion
PImage backgroundImg; // Image of the game background
PFont font; // the font of the game
PFont font2; // the font of the creator
ArrayList<Bullet>bullets = new ArrayList<Bullet>(); // The bullets
ArrayList<Explosion> exps = new ArrayList<Explosion>(); // Explode
ArrayList<Enemy> enemys = new ArrayList<Enemy>(); // Enemy
int score = 0; // The starting score
int life = 3; // The numbers of life
int stage = 1 ; // controlling the startmenu and game
int pt; // the time of the previous bullet
void setup() {
  _Superman = new Superman("fighter_1.png", 650, 250, 1, 7, 40);//The image of the superman, the x coordinate, the y coor.,the direction, the moving speed, the interval time. 

  start_menu = loadImage("Start_menu.jpg"); // Load the game menu
  font = loadFont("Superclarendon-Bold-64.vlw"); // Load the font of the game
  font2 = loadFont("BanglaSangamMN-64.vlw"); // Load the font of the creator
  instructions = loadImage("how_to_play.png"); // Load the instructions
  expImg = loadImage("explosion.png"); // load the explode image
  backgroundImg = loadImage("background.jpg"); // load the background
  size(800, 600); // The size of the window
  smooth();
  pt = millis(); // Controlling the speed of the production of the bullet
}

void draw() {
  //------------- Displaying the Start Menu
  if (stage == 1) {
    background(start_menu);
    textAlign(CENTER);
    textFont(font, 40); // The font and the size
    text("Play", 200, 300 ); // Texting
    //    rect(250,300,25,25);
    text("How to play", 200, 400); // Texting
    textFont(font2, 12); // The font and the size
    text("Created by Hau-Ben Shih, Foundation of Programming \n Goldsmiths, Uni. of London 2015", 600, 580); // Creator's detail
    if ( mouseX >= 150 && mouseX <= 250 && mouseY >= 270 && mouseY <= 300) {
      // If the mouse is pointing in the word "play", the word will change to color yellow.
      fill(255, 255, 0);
      textFont(font, 40);
      text("Play", 200, 300);
      fill(255);
      // If pressed it, it will load the game.
      if (mousePressed) {
        stage = 3;
      }
    }
    if (mouseX >= 50 && mouseX <= 350 && mouseY >= 370 && mouseY  <= 400) {
      // If the mouse is pointing in the word "How to play", the word will change to color yellow.
      fill(255, 255, 0);
      textFont(font, 40);
      text("How to play", 200, 400);
      fill(255);
      // If pressed it, it will load the instructions menu.
      if (mousePressed) {    
        stage = 2;
      }
    }
  }

  if (stage == 2) {
    // -------------  Displaying the instructions menu
    background(instructions);
    textFont(font, 20);
    text("Back to menu", 420, 150);
    // if clicked "Back to menu", stage will equals 1, which is the start menu.
    if (mouseX >= 335 && mouseX <= 506 && mouseY >= 130 && mouseY <= 150) {
      fill(255, 255, 0); 
      textFont(font, 20);
      text("Back to menu", 420, 150);
      fill(255);
      if (mousePressed) {
        stage = 1;
      }
    }
  }

  if (stage == 3) {
    // ---------------- THIS IS THE GAME
    background(backgroundImg);
    _Superman.setPosition(0);
    if (keyPressed) { // if pressed the key
      if (keyCode == UP) _Superman.setPosition(-1); //Move up
      else if (keyCode == DOWN) _Superman.setPosition(1); // Move down
      else if (key == ' ' && abs(pt-millis())>200) { // Shoot the bullet, the interval between the the two bullet will not be less than 0.2 second
        Bullet _Bullet = new Bullet(_Superman.posX(), _Superman.posY()+80, 5, 50);// adding the bullet to the array
        bullets.add(_Bullet);  //add the bullet into the bullet array
        pt=millis();
      }
    }
    // ------ displaying the superman
    _Superman.display(); 
    // ------ displaying the enemy
    for (int i = 0; i <enemys.size (); i++) {
      Enemy e = enemys.get(i);
      e.display(); //displaying
      if (e.getX()>width+1) enemys.remove(i); // Remove the enemy if it goes out of the screen, avoid the array to be unlimited
      if (e.getX()>width) life = life - 1; // If the enemy reaches out of the window, life will minus 1
    }


    //Randomly produce enemy
    if (random(200)<1) {
      enemys.add(new Enemy("Zombie.png", -10, random(30, 500), 15+random(100), 4, random(5))); 
      // Image, coordinate x , coordinate y, the interval time
    }

    //Drawing bullets
    for (int i=0; i<bullets.size (); i++) {
      Bullet _Bullet = bullets.get(i);   //get an amount of i bullets   
      _Bullet.display();   //display the bullet
      if (_Bullet.posX() < 0) { 
        bullets.remove(i);
        // remove the bullet when it goes out of the screen, avoid unlimited array
      }
    }

    //------ Did the bullet hits the enemy
    for (int i = 0; i <bullets.size (); i++) {
      Bullet _Bullet = bullets.get(i); // get an amount of i bullets
      for (int j=0; j<enemys.size (); j++) {
        Enemy e = enemys.get(j); // get an amount of j bullets
        // calculate the distance between the bullet and enemy
        float d = sqrt(pow((_Bullet.posX()-(e.getX()+e.getW()/2)), 2)+ pow((_Bullet.posY()-(e.getY()+e.getH()/2)), 2));
        // if the distance is close, make the explosion
        if (d<30) {
          bullets.remove(i); // remove bullet
          enemys.remove(j); //remove enemy
          score = score + 1;
          // Make explosion
          exps.add(new Explosion(expImg, _Bullet.posX()-32, _Bullet.posY()-32, 20)); // add explosion, because the image of the explosion is 64*64, -32 is to let the explosion becomes the middle point
        }
      }
    }
    //display the explosion
    for (int i=0; i<exps.size (); i++) {
      Explosion e = exps.get(i);   //Get an amount of i explosions   
      e.display();   //display it
      // if finish display, remove it, avoid unlimited array
      if (e.isFinished()) exps.remove(i);
    }
    //-------------- Back to start menu
    fill(255);
    textSize(20);
    text("Back To Menu", width /2 + 275, 50);
    if (mouseX > 590 && mouseX < 750 && mouseY > 30 && mouseY < 60) {
      fill(255, 255, 0);
      text("Back To Menu", width /2 + 275, 50);
      fill(255);
      if (mousePressed) {
        stage = 1;
      }
    }
    //-------------- Displaying scores and lifes
    textSize(30);
    text("Your Score is : " + score, width/2 + 200, 580);
    text("Life left : " + life, width/2 - 250, 580);
    if ( life == 0 ) {  // If no more life is left, make the background to 0 and display player's score
      background(0);
      text("Your Score is : " + score, width/2, height/2);
      delay(1000);
      for (int i = 0; i < enemys.size (); i++) {
        enemys.remove(i);
      }
    }
  }
}

