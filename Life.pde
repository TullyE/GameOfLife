public class Life {
  private int myRow, myCol;
  private float x, y, width_, height_;
  private boolean alive;

  public Life (int row, int col) {
     width_ = width/NUM_COLS;
     height_ = height/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width_;
    y = myRow*height_;
    alive = Math.random() < .5; // 50/50 chance cell will be alive
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () {
    alive = !alive; //turn cell on and off with mouse press
  }
  public void show() {    
    fill(alive ? 200 : 100);
    rect(x, y, width_, height_);
  }
  public boolean getLife() {
    return this.alive;
  }
  public void setLife(boolean living) {
    this.alive = living;
  }
}
