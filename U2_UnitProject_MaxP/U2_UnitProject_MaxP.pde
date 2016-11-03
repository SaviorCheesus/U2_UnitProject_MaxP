float x = width/2;
float y = height/2;
float wallWidth = 20;
int level = 1;
int R;
int G;
int B;
int C = 255;
boolean isSafe;
boolean locked = true;

void setup()
{
  fullScreen();
}

void draw()
{
  background (R, G, B);
  levels();
  gameOver();
  walls();
  wallEffects();
  controls();
  fill (255);
  noStroke();
  ellipse (x, y, 50, 50);
}

void wallEffects()
{
  if (wallWidth <= 15)
  {
    wallWidth += 2;
  }
  else if (wallWidth >= 25)
  {
    wallWidth -= 2;
  }
  else
  {
    wallWidth = wallWidth + (random(-1,+1)); 
  }
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
  fill (C);
  //top wall
  rect (0,0, width, wallWidth);
  //left wall
  rect (0,0, wallWidth, height);
  //bottom wall
  rect (0,height -wallWidth, width, wallWidth);
  //right wall
  rect (width -wallWidth, 0, wallWidth, height);
  
  //top wall
  if (y -25 <= wallWidth)
  {
    y = y + 10;
  }
  
  //left wall  
  if (x -25 <= wallWidth)
  {
    x = x + 10;
  } 
  
  //bottom wall
  if (y + 25 >= height - wallWidth)
  {
    y = y - 10;
  }
  
  //right wall
  if (x +25 >= width - wallWidth) 
  {
    x = x - 10;
  }
}


void levels()
{
  if (level == 1)
  {
    R = 183;
    G = 54;
    B = 54;
    C = 0;
    
    isSafe = true;
    
    float goalX = width - 100;
    float goalY = height - 100;
    ellipse (goalX, goalY, 140, 140);
    
    if (x >= goalX -160 && y >= goalY -160 && mousePressed == true)
    {
      level = 2;
    }
  }  
  
  
  if (level == 2)
  {
    R = 200;
    G = 90;
    B = 0;
    C = 0;
    
    fill (225);
    rect (width -200, 400, 200 - wallWidth, 500 -wallWidth);
    rect (0, 400, width, 100);
    rect (0, 0, 190, 420);
    
    if (x >= width - 200 && y >= 400)
    {
      isSafe = true;
    }
    else if(y >= 400 && y <= 500)
    {
      isSafe = true;
    }
    else if (x <= 190 && y <= 500)
    {
      isSafe = true;
    }
    else
    {
      isSafe = false;
    }
     
     
    fill (C);
    float goalX = 100;
    float goalY = 100;
    ellipse (goalX, goalY, 140, 140);
    
    if (x <= goalX +140 && y <= goalY + 140 && mousePressed == true)
    {
      level = 3;
    }
  }
  
  
  if (level == 3)
  {
    R = 142;
    G = 44;
    B = 255;
    C = 245;
    
    
    fill (0);
    rect (0, 0, 190, 190);
    rect (0,0, width, 80);
    rect (width - 80, 0, 80, height);
    rect (400, 600, 180, 180);
    
    if (locked == true)
      {
        fill (random (0,255), random (0,255), random (0,255));
        ellipse (width - 50, height - 50, 30, 30);
        if (dist( x, y, width - 50, height - 50)<= 45)
      {
        locked = false;
      }
    }
    
    if (x <= 190 && y <= 190)
    {
      isSafe = true;
    }   
    else if (y <= 80)
    {
      isSafe = true;
    }
    else if (x >= width-80)
    {
      isSafe = true;
    }
    else
    {
      isSafe = false;
    }
    if (locked == false)
    {
      rect (400, 80, 60, height- 200);
      if (x >= 400 & x <= 480 && y <= height - 200)
      {
        isSafe = true;
      }
    }

     
     
    fill (C);
    float goalX = 490;
    float goalY = 690;
    ellipse (goalX, goalY, 140, 140);
    
    if (dist (x, y, goalX, goalY) <= 95 && mousePressed == true)
    {
      level = 4;
    }
  }
}

void gameOver()
{
  if (isSafe == false)
  {
    level = 0;
  }
  
  if (level == 0)
  {
    R = 0;
    G = 0;
    B = 0;
    C = 255; 
    
    text ("press space to restart", width/2, height/2);
    
    if (keyCode == ' ')
    {
      level = 1;
    }
  }
}