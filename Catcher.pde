class Catcher {
  private float catcherX; // x coordinate of the catcher
  private float catcherY; // y coordinate of the catcher
  private float catcherWidth; // width of the catcher
  private float catcherSpeed; // speed of the catcher
  private float catcherHeight; // height of the catcher
  private char catcherControl; // key pressed to control the catcher
  private int catcherScore;  // the number of balls caught

  // Catcher constructor
  public Catcher(float cSpeed, float cWidth, float cHeight) {
    catcherSpeed = cSpeed;
    catcherWidth = cWidth;
    catcherHeight = cHeight;
    catcherX = width/2;
    catcherY = height - 100;
    catcherScore = 0;
  }

  // display catcher
  public void display() {
    fill(255, 0, 0);
    rect(catcherX, catcherY, catcherWidth, catcherHeight);
  }

  // move catcher
  public void move() {
    if (catcherControl == 'x') { // x moves right
      catcherX = catcherX + catcherSpeed;
    } else if (catcherControl == 'z') { // z moves left
      catcherX = catcherX - catcherSpeed;
    }
  }
  // check if Catacher caught ball
  public void checkCaught(Ball ball) {
    if (ball.getX() > (catcherX - catcherWidth/2) &&
      ball.getX() < (catcherX + catcherWidth/2) &&
      ball.getY() + ball.getBWidth()/2 >= catcherY - catcherHeight/2 &&
      ball.getY() - ball.getBWidth()/2 <= catcherY + catcherHeight/2) {
      increaseScore();
      ball.resetBall();
    }
  }
  // increase score
  public void increaseScore() {
    catcherScore ++;
  }
  // return catcher score
  public int getScore() {
    return catcherScore;
  }
  
  // Controling catacher using keyboard inputs
  // Z = left
  // X = right
  // S = stop
  void setCatcherControl(char k) {
    catcherControl = k;
  }
}
