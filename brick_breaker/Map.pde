class Map {
  Player p;
  Ball ba;
  Brick[][] bricks;
  int score = 0;
  int winningscore = 100;
  //int num = 0; 
  public Map(int size) {
    p = new Player();
    ba = new Ball();
    bricks = new Brick[size][size];
    int posx = (width/2)-(size/2*100);
    int posy = 0;
    for (int i = 0; i<size; i++) {
      for (int j = 0; j<size; j++) {
        bricks[i][j]=(new Brick((int)(Math.random()*10)+1, posx, posy));
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
  public void show() {
    //rect(num, num, num, num);
    //num+=10;
    boolean collide = false; 
    background(255);

    p.show();
    ba.show();
    ba.move();
    collide = p.On(ba.posX, ba.posY, 15);
    for (int i = 0; i<bricks.length; i++) {
      for (int j = 0; j<bricks.length; j++) {
        bricks[i][j].show();
        if (bricks[i][j].On(ba.posX, ba.posY, 15)!=0) {
          bricks[i][j].hp--;
          score+=2;
          if (bricks[i][j].On(ba.posX, ba.posY, 15)==1) {
            ba.speedx = -ba.speedx;
          } else {
            ba.speedy = -ba.speedy;
          }

          //while (Math.abs(ba.speedx+ba.speedy)>10) {
          //  if (ba.speedx<0) {
          //    ba.speedx++;
          //  } else {
          //    ba.speedx--;
          //  }
          //  if (ba.speedy<0) {
          //    ba.speedy++;
          //  } else {
          //    ba.speedy--;
          //  }
          //}

          //while (Math.abs(ba.speedx+ba.speedy)<10) {
          //  if (ba.speedx<0) {
          //    ba.speedx--;
          //  } else {
          //    ba.speedx++;
          //  }
          //  if (ba.speedy<0) {
          //    ba.speedy--;
          //  } else {
          //    ba.speedy++;
          //  }
          //}
        }

        //System.out.println("hi");
      }
    }
    if (left == true && p.posX>=0) {
      p.moveLeft();
    } else if (right == true && p.posX+100<=width) {
      p.moveRight();
    }
    if (ba.posX < 0 || ba.posX > width) {
      ba.speedx = -ba.speedx; //bounce off the left and right walls
    }
    if (ba.posY < 0) {
      ba.speedy = -ba.speedy; //bounce off the top and bottom walls
    }
    if (ba.posY > height) {
      ba.speedy = -ba.speedy;
      p.lives--;
    }
    if (collide) {
      ba.speedx = (int)map((float)ba.posX-p.posX, 0, (float)p.size, 0, 5);
      ba.speedy = -ba.speedy;
      //while (Math.abs(ba.speedx+ba.speedy)>10) {
      //  if (ba.speedx<0) {
      //    ba.speedx++;
      //  } else {
      //    ba.speedx--;
      //  }
      //  if (ba.speedy<0) {
      //    ba.speedy++;
      //  } else {
      //    ba.speedy--;
      //  }
      //}

      //while (Math.abs(ba.speedx+ba.speedy)<10) {
      //  if (ba.speedx<0) {
      //    ba.speedx--;
      //  } else {
      //    ba.speedx++;
      //  }
      //  if (ba.speedy<0) {
      //    ba.speedy--;
      //  } else {
      //    ba.speedy++;
      //  }
      //}
      
    }
    fill(0);
      textSize(20);
      text("lives: "+p.lives, 0, 20);
      text("winning score: "+winningscore, 0, 50);
      text("your score: "+score, 0, 80);
      text("press enter to restart", 0, 110);
  }
}
