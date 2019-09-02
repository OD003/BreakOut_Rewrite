class Bullet {
  
  int dir;
  int xLoc, yLoc, xVel, yVel;
  boolean isDead;
  
  //Constructor
  Bullet(int d) {
    dir = d;
    isDead = false;
    if(d == 1) {
      xLoc = 600;
      yLoc = 300;
      xVel = -10;
      yVel = 0;
    } else if(d == 2) {
      xLoc = 300;
      yLoc = 0;
      xVel = 0;
      yVel = 10;
    } else if(d == 3) {
      xLoc = 0;
      yLoc = 300;
      xVel = 10;
      yVel = 0;
    } else if(d == 4) {
      xLoc = 300;
      yLoc = 600;
      xVel = 0;
      yVel = -10;
    } else {
    isDead = true;
    }
  }
  
  //Drawing Bullet
  void display() {
    stroke(255);
    strokeWeight(3);
    line(xLoc, yLoc, xLoc + xVel, yLoc + yVel);
    noStroke();
  }
  
  //Update Bullet
  void update() {
    xLoc += xVel;
    yLoc += yVel;
    if (yLoc > height || yLoc < 0 || xLoc > width || xLoc < 0)
      isDead = true;
    if(hit == dir && life > 0 && ((345 > xLoc - 10 && xLoc > 340) || (255 > yLoc && yLoc + 10 > 250) || (255 > xLoc && xLoc + 10 > 250) || (345 > yLoc - 10 && yLoc > 340))) {
      isDead = true;
      score += 100;
    }
    if (xLoc + 10 > 275 && xLoc - 10 < 325 && yLoc + 10 > 275 && yLoc - 10 < 325 && life > 0) {
        isDead = true;
        life --;
    }
    
  }
}
