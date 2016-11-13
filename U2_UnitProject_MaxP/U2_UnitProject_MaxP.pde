float x = width/2;
float y = height/2;
float wallWidth = 40;
int level = 4;
int gravityMode;
// gravity 0 : no gravity
// gravity 1 : downwards gravity
// gravity 2 : upwards gravity
// gravity 3 : rightwards gravity
// gravity 4 : leftwards gravity
float gravY;
float gravX;
float R;
float G;
float B;
float C = 255;
boolean isSafe;
boolean locked1 = true;
boolean locked2 = true;


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
  gravity();
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
  {
    if (keyPressed == true)
    {
      if (keyCode == RIGHT)
      {
        x = x +10 + gravX;
      }      
      if (keyCode == LEFT)
      {
        x = x -10 - gravX;
      }    
      if (keyCode == UP)
      {
        y = y -10 - gravY;
      }  
      if (keyCode == DOWN)
      {
        y = y +10 + gravX;
      }  
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
    y = wallWidth +25;
  }
  
  //left wall  
  if (x -25 <= wallWidth)
  {
    x = wallWidth +25;
  } 
  
  //bottom wall
  if (y + 25 >= height - wallWidth)
  {
    y = height - wallWidth -25;
  }
  
  //right wall
  if (x +25 >= width - wallWidth) 
  {
    x = width - wallWidth -25;
  }
}

void gravity()
{
 if (gravityMode == 0)
 {
   gravX = 0;
   gravY = 0;
 }
 else if (gravityMode == 1)
 {
   gravY = 8;
   gravX = 0; 
 }
 else if (gravityMode == 2)
 {
   gravY = -8;
   gravX = 0; 
 }
 else if (gravityMode == 3)
 {
   gravY = 0;
   gravX = 8;
 }
 else if (gravityMode == 4)
 {
   gravY = 0;
   gravX = -8;
 }
 
 y = y + gravY;
 x = x + gravX;
  
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
    
    if (dist (x, y, goalX, goalY) <= 95 && mousePressed == true)
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
    
    if (dist (x, y, goalX, goalY) <= 95 && mousePressed == true)
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
    
    if (locked1 == true)
      {
        fill (random (0,255), random (0,255), random (0,255));
        ellipse (width - 50, height - 50, 30, 30);
        if (dist( x, y, width - 50, height - 50)<= 45)
      {
        locked1 = false;
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
    else if (x <= 580 && x >= 400 && y >= 600 & y <= 780)
    {
      isSafe = true;
    }
    else
    {
      isSafe = false;
    }
    if (locked1 == false)
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
  
  
  if (level == 4)
  {    
    R = 255;
    G = 104;
    B = 77;
    C = 25;
    
    gravityMode = 1;
    
    fill (225);
    rect (400, 500, 180, 380 + wallWidth);
    rect (580, 500, 80, 180);
    rect (640, 500, 60, 380 + wallWidth);
    rect (680, 680, 100, 200 + wallWidth);
    rect (760, 500, 180, 380 + wallWidth);
    rect (940, 500, 500, 320);
    rect (1000, 820, 60, 60 + wallWidth);
    rect (1120, 820, 60, 60 + wallWidth);
    rect (1240, 820, 60, 60 + wallWidth);
    rect (1360, 320, 60 + wallWidth, 560 + wallWidth);
    rect (400, 320, 960 + wallWidth, 180);
    rect (400, wallWidth, 760, 320);
    rect (0, 280, 400, 600 + wallWidth);
    rect (300, 0, 50, 300);
    
    if (locked2 == true)
      {
        fill (random (0,255), random (0,255), random (0,255));
        ellipse (325, 50, 30, 30);
        if (dist( x, y, 325, 50)<= 45)
      {
        locked2 = false;
      }
    }
    
    if (locked2 == false)
    {
      rect (1160, wallWidth, 300, 300);
      if (x >= 1160 && y <= height - 200)
      {
        isSafe = true;
      }
    }
    
    if (x <= 580 && x >= 400 && y >= 520)
    {
      isSafe = true;
    }
    else if (x <= 640 && x >= 580 && y >= 520 && y <= 580)
    {
      isSafe = true;
    }
    else if (x <= 700 && x >= 640 && y >= 520)
    {
      isSafe = true;
    }
    else if (x <= 740 && x >= 680 && y >= 500)
    {
      isSafe = true;
    }
    else if (x <= 940 && x >= 760 && y >= 500)
    {
      isSafe = true;
    }
    else if (x >= 940 && y >= 500 && y <= 820)
    {
      isSafe = true;
    }
    else if (x <= 1060 && x >= 1000 && y >= 820)
    {
      isSafe = true;
    }
    else if (x <= 1120 && x >= 1060 && y >= 820)
    {
      isSafe = true;
    }
    else if (x <= 1240 && x >= 1180 && y >= 820)
    {
      isSafe = true;
    }
    else if (x <= 1360 && x >= 1240 && y >= 820)
    {
      isSafe = true;
    }
    else if (x <= 400 && y >= 280)
    {
      isSafe = true;
    }
    else if (x <= 350 && x >= 300 && y <= 300)
    {
      isSafe = true;
    }
    else
    {
      isSafe = false;
    }
    
    fill (C);
    
    rect (400, 450, 960, 50);
    
    if (x <= 1360 && x >= 390 && y >= 480 && y <= 500)
    {
      y = 500;
    }
    if (x <= 1360 && x >= 1340 && y >= 450 && y <= 500)
    {
      x = 1360;
    }
    if (x <= 1360 && x >= 390 && y <= 470 && y >= 450)
    {
      y = 450;
    }
    
    rect (450, 270, 960 + wallWidth, 50);
    
    if (x >= 450 && y >= 300 && y <= 320)
    {
      y = 320;
    }
    if (x >= 450 && y <= 290 && y >= 270)
    {
      y = 270;
    }
    if (x >= 450 && x <= 470 && y >= 270 && y <= 320)
    {
      x = 450;
    }
    
    rect (350, 0, 50, 760);
    
    if (x >= 350 && x <= 370 && y <= 760)
    {
      x = 350;
    }
    if (x >= 380 && x <= 400 && y <= 760)
    {
      x = 400;
    }
    if (x >= 350 && x <= 400 && y <= 760 && y >= 740)
    {
      y = 760;
    }
    
    rect (0, 680, 100, 50);
    if (x <= 100 && y >= 680 && y <= 700)
    {
      y = 680;
    }
    if (x <= 100 && y >= 710 && y <= 730)
    {
      x = 100;
    }
    if (x <= 100 && y <= 730 && y >= 710)
    {
      y = 730;
    }
    
    rect (150, 480, 100, 50);
    if (x <= 250 && x >= 150 && y >= 480 && y <= 500)
    {
      y = 480;
    }
    if (x <= 170 && x >= 150 && y >= 480 && y <= 500)
    {
      x = 150;
    }
    if (x <= 250 && y <= 150 && y >= 510 && y <= 530)
    {
      y = 530;
    }
    
    rect (300, 380, 100, 50);
    if (x <= 400 && x >= 300 && y >= 380 && y <= 400)
    {
      y = 380;
    }
    if (x <= 320 && x >= 300 && y >= 380 && y <= 400)
    {
      x = 300;
    }
    if (x <= 400 && x >= 300 && y >= 410 && y <= 430)
    {
      y = 430;
    }
    
    
    
    float goalX = 1290;
    float goalY = 140;
    ellipse (goalX, goalY, 140, 140);
    
    if (dist (x, y, goalX, goalY) <= 95 && mousePressed == true)
    {
      level = 5;
    }
  }
  
  
  if (level == 5)
  {
    R = 165;
    G = 58;
    B = 121;
    C = 0;
    
    if (x <= 580 && x >= 400 && y >= 600)
    {
      isSafe = true;
    }
    else
    {
      isSafe = true;
    }
  }
  
  
  if (level == 6)
  {
    R = 127 + (random(-2,2));
    G = 127 + (random(-2,2));
    B = 127 + (random(-2,2));
    C = 127 + (random(-2,2));
    
    if (x <= 580 && x >= 400 && y >= 600)
    {
      isSafe = true;
    }
    else
    {
      isSafe = true;
    }
  }
}



void gameOver()
{
  if (isSafe == false)
  {
   // level = 0;
  }
  println (isSafe);
  
  if (level == 0)
  {
    R = 0;
    G = 0;
    B = 0;
    C = 255; 
    
    gravityMode = 0;
    
    text ("press space to restart", width/2, height/2);
    
    if (keyCode == ' ')
    {
      level = 1;
    }
  }
}