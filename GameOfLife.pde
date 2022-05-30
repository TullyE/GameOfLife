import de.bezier.guido.*;


//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public int NUM_ROWS = 20;
public int NUM_COLS = 20;
private Life[][] buttons; //2d array of Life buttons each representing one cell
private boolean[][] buffer; //2d array of booleans to store state of buttons array
private boolean running = true; //used to start and stop program

public void setup () {
  size(400, 400);
  //frameRate(6);
  // make the manager
  Interactive.make( this );
  init();
  //your code to initialize buffer goes here
}

public void draw () {
  //background( 0 );
  //if (running == false) //pause the program
  //  return;
  //copyFromButtonsToBuffer();
  for (int row = 0; row < NUM_ROWS; row ++)
  {
    for (int col = 0; col < NUM_COLS; col ++)
    {
      buttons[row][col].show();
      if (running)
      {
        int neighbors = countNeighbors(row, col);
        if (neighbors == 3)
        {
          buffer[row][col] = true;
        } else if (neighbors == 2 && buttons[row][col].getLife())
        {
          buffer[row][col] = true;
        } else
        {
          buffer[row][col] = false;
        }
      }
    }
  }
  if (running)
  {
    copyFromBufferToButtons();
  }
}

public void keyPressed() {
  if (keyCode == 69)
  {
    for (int row = 0; row < NUM_ROWS; row ++)
    {
      for (int col = 0; col < NUM_COLS; col ++)
      {
        buttons[row][col].setLife(false);
      }
    }
  } else if (keyCode == 82)
  {
    init();
  } else
  {
    running = !running;
  }
}

public void copyFromBufferToButtons() {
  for (int row = 0; row < NUM_ROWS; row ++)
  {
    for (int col = 0; col < NUM_COLS; col ++)
    {
      buttons[row][col].setLife(buffer[row][col]);
    }
  }
}

public void copyFromButtonsToBuffer() {
  for (int row = 0; row < NUM_ROWS; row ++)
  {
    for (int col = 0; col < NUM_COLS; col ++)
    {
      buffer[row][col] = buttons[row][col].getLife();
    }
  }
}

public boolean isValid(int row, int col) {
  if ((row >= 0 && row < NUM_ROWS) && (col >= 0 && col < NUM_COLS))
  {
    return true;
  }
  return false;
}

public int countNeighbors(int row, int col) {
  int neighbors = 0;
  if (isValid(row-1, col -1) && buttons[row-1][col-1].getLife())
  {
    neighbors ++;
  }
  if (isValid(row-1, col) && buttons[row-1][col].getLife())
  {
    neighbors ++;
  }
  if (isValid(row-1, col + 1) && buttons[row-1][col + 1].getLife())
  {
    neighbors ++;
  }
  if (isValid(row, col-1) && buttons[row][col-1].getLife())
  {
    neighbors ++;
  }
  if (isValid(row, col + 1) && buttons[row][col + 1].getLife())
  {
    neighbors ++;
  }
  if (isValid(row + 1, col - 1) && buttons[row + 1][col - 1].getLife())
  {
    neighbors ++;
  }
  if (isValid(row + 1, col) && buttons[row + 1][col].getLife())
  {
    neighbors ++;
  }
  if (isValid(row + 1, col + 1) && buttons[row + 1][col + 1].getLife())
  {
    neighbors ++;
  }
  return neighbors;
}

public void init()
{

  buttons = new Life[NUM_ROWS][NUM_COLS];
  for (int row = 0; row < NUM_ROWS; row ++)
  {
    for (int col = 0; col < NUM_COLS; col ++)
    {
      buttons[row][col] = new Life(row, col);
    }
  }

  buffer = new boolean[NUM_ROWS][NUM_COLS];
  for (int row = 0; row < NUM_ROWS; row ++)
  {
    for (int col = 0; col < NUM_COLS; col ++)
    {
      buttons[row][col].getLife();
    }
  }
}
