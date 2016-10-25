float x = width/2;
float y = height/2;
float wallWidth = 20;
int level = 0;
int R;
int G;
int B;


void setup()
{
  fullScreen();
}

void draw()
{
  controls();
  background (R, G, B);
  fill (100, 54, 183);
  noStroke();
  ellipse (x, y, 50, 50);
  
  walls();
  level1();
}

void controls()
{
  if (keyPressed == true)
  {
    if (keyCode == RIGHT)
    {
      x = x +10;
    }
    
    if (keyCode == LEFT)
    {
      x = x -10;
    }    
    if (keyCode == UP)
    {
      y = y -10;
    }  
    if (keyCode == DOWN)
    {
      y = y +10;
    }  
  }
}

void walls()
{  
  fill (0);
  //top wall
  rect (0,0, width, wallWidth);
  //left wall
  rect (0,0, wallWidth, height);
  //bottom wall
  rect (0,height -wallWidth, width, wallWidth);
  //right wall
  rect (width -wallWidth, 0, wallWidth, height);
  
  
  if (x -25 <= wallWidth)
  {
    x = 45;
  }
  
  
  
  
}


void level1()
 {
  if (level == 0);
  {
    R = 183;
    G = 54;
    B = 54;
  }
}