public void keyPressed() {
  //System.out.println("hello");
  if (keyCode == LEFT) {
    left = true;
  } else if (keyCode == RIGHT) {
    right = true;
  }
}
public void keyReleased() {
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if(keyCode == ENTER){
    mode = 2; 
    m = new map(s2, s);
  }
}
