class map {
  public player p;
  public ball b;
  public int size;
  public brick[][] bricks;
  public ArrayList<powerup> powerups = new ArrayList<powerup>();
  public int score; 
  public int winningscore = (int)random(50, 200); 
  public boolean empty = true; 
  public map(int playersize, int ballsize) {
    p = new player(playersize);
    b = new ball(width/2-30, height-(height/10)-30, ballsize, 0, 5);
    size = (int)random(2, 10);
    bricks = new brick[size][size];
    fillBricks();
  }
  public void setPlayerSize(int i) {
    p.size = i;
  }
  public void setBallSize(int i) {
    b.size = i;
  }
  public void show() {
    empty = true;
    background(255);
    fill(0);
    textSize(20);
    text("lives: "+p.lives, 0, 20);
    text("winning score: "+winningscore, 0, 50);
    text("your score: "+score, 0, 80);
    text("press enter to restart", 0, 110);
    //boolean collide = false; 
    p.show();
    b.show();
    b.move();
    if (left == true && p.posX>=0) {
      p.moveLeft();
    } else if (right == true && p.posX+p.size<=width) {
      p.moveRight();
    }
    //checks for player and ball collision then moves ball accordingly
    if (p.on(b.posX, b.posY, b.size/2)) {
      b.changeSpeedX((int)map((float)b.posX-p.posX, 0, (float)p.size, -5, 5));
      b.changeSpeedY(-b.speedy);
    }
    //checks for wall and ball collision then moves ball accordingly
    if (b.posX-b.size/2 < 0 || b.posX+b.size/2 > width) {
      //b.speedx = -b.speedx; //bounce off the left and right walls
      b.changeSpeedX(-b.speedx);
    }
    if (b.posY-b.size/2 < 0) {
      //b.speedy = -b.speedy; //bounce off the top and bottom walls
      b.changeSpeedY(-b.speedy);
    }
    if (b.posY+b.size/2 > height) {
      //b.speedy = -b.speedy;
      b.changeSpeedY(-b.speedy);
      p.lives--;
    }
    //draws and checks for collision of bricks
    for (int i = 0; i<bricks.length; i++) {
      for (int j = 0; j<bricks.length; j++) {
        bricks[i][j].show();
        if (bricks[i][j].hp>0) {
          empty = false;
        }
        if (bricks[i][j].on(b.posX, b.posY, b.size/2)!=0) {
          bricks[i][j].hp--;
          score+=2;
          if (bricks[i][j].on(b.posX, b.posY, b.size/2)==1) {
            b.speedx = -b.speedx;
          } else {
            b.speedy = -b.speedy;
          }
        }
      }
    }
    if (empty) {
      fillBricks();
    }
  }
  public void fillBricks() {
    int posx = (width/2)-(size/2*100);
    int posy = 0;
    for (int i = 0; i<size; i++) {
      for (int j = 0; j<size; j++) {
        int chance = (int)random(1, 10);
        if (chance == 1) {
          brick temp;
          int which = (int)random(1, 4);
          switch(which) {
          case 1:
            temp = new brick(posx, posy, (int)random(1, 5), "biggerBall");
            break;
          case 2:
            temp = new brick(posx, posy, (int)random(1, 5), "fasterSpeed");
            break;
          default:
            temp = new brick(posx, posy, (int)random(1, 5), "moreBalls");
            break;
          }
          bricks[i][j] = temp;
        } else {
          brick temp = new brick(posx, posy, (int)random(1, 5), "none");
          bricks[i][j] = temp;
        }
        posx+=100;
        if (posx+100>width) {
          posy+=50;
          posx = (width/2)-(size/2*100);
        }
      }
      posy+=50;
      posx = (width/2)-(size/2*100);
    }
  }
}
