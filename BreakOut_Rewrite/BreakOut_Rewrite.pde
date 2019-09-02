ArrayList<Bullet> Bullets;
int xBar, yBar, wBar, hBar;
int time, score, life, hit;
int t, r;
boolean title;

// Initialize
void setup() {
  size(600, 600);
  frameRate(30);
  Bullets = new ArrayList<Bullet>();
  xBar = 275;
  yBar = 340;
  wBar = 50;
  hBar = 5;
  hit = 3;
  time = 60;
  score = 0;
  life = 10;
  title = true;
  frameCount = 0;
}

void draw() {
  // Reload
  background(0);
  fill(25 * life);
  rect(275, 275, 50, 50);
  fill(255);
    
  // Title
  if(title) {
    textSize(40);
    text("Press any key", 170, 230);
    if(keyPressed && frameCount > 10) {
      t = frameCount;
      title = false;
    }
    
  } else {
    // Play
    if(life > 0 && time > 0) {
      if((frameCount - t) % 30 == 0)
        time--;
      
      //Drawing bar
      if (keyCode == RIGHT) {
        xBar = 340;
        yBar = 275;
        wBar = 5;
        hBar = 50;
        hit = 1;
      } else if (keyCode == UP) {
        xBar = 275;
        yBar = 255;
        wBar = 50;
        hBar = 5;
        hit = 2;
      } else if (keyCode == LEFT) {
        xBar = 255;
        yBar = 275;
        wBar = 5;
        hBar = 50;
        hit = 3;
      } else if (keyCode == DOWN) {
        xBar = 275;
        yBar = 340;
        wBar = 50;
        hBar = 5;
        hit = 4;
      }
      rect(xBar, yBar, wBar, hBar);
      
      // Draw Data
      textSize(20);
      text(time, 10, 30);
      text(score, 10, 50);
      
      if (time > 50) {
        r = int(random(1, 200));
      } else if (time > 15) {
        r = int(random(1, 100));
      } else if (time > 3) {
        r = int(random(1, 65));
      } else {
        r = int(random(1, 15));
      }
    
      //Drawing and Update Bullets
      Bullets.add(new Bullet(r));
      ArrayList<Bullet> nextBullets = new ArrayList<Bullet>();
      for(Bullet bullet : Bullets) {
        bullet.display();
        bullet.update();
        if(!bullet.isDead)
          nextBullets.add(bullet);
      }
      Bullets = nextBullets;
      
    } else if(life <= 0) {
      //GameOver
      ArrayList<Bullet> nextBullets = new ArrayList<Bullet>();
      for(Bullet bullet : Bullets) {
        bullet.display();
        bullet.update();
        if(!bullet.isDead)
          nextBullets.add(bullet);
      }
      Bullets = nextBullets;
      fill(200, 30, 0);
      textSize(55);
      text("GAME OVER", 120, 230);
      textSize(40);
      text("SCORE:  " + score, 150, 410);
      text("Press SPACE to Back Title", 60, 460);
      if(keyPressed && key == ' ')
        setup();
      
    } else {
      //Game Clear
      textSize(55);
      text("GAME CLEAR!", 120, 230);
      textSize(40);
      text("SCORE:  " + score, 150, 410);
      text("Press SPACE to Back Title", 60, 460);
      if(keyPressed && key == ' ')
        setup();
    }
    
  }
}
