//raindrop[] rain = new raindrop[500];
ArrayList<raindrop> rain = new ArrayList<raindrop>();
int score = 0;
catcher player;
boolean p = false;
int losenum = 10;
boolean fplay = true;
Timer t;
void setup()
{
  size(500, 500);
  background(0);
  noStroke();
  textSize(50);
  textAlign(CENTER);
}
void draw()
{
  if (focused)
  {
    //checks if a ctacher exists
    if (p)
    {
      //background
      fill(0, 90);
      rect(0, 0, width, height);
      //score
      fill(255, 0, 0);
      rect(0, height-20, 20, 20);
      //checks if mouse is over "Quit" button
      if (mouseX<=20 && mouseY>=height-20)
      {
        cursor();
      }
      else
      {
        noCursor();
      }
      fill(255, 255, 127.5);
      textSize(10);
      text("Score: "+score, 10, 20);
      //raindrop bar
      fill(10, 10, 255);
      rect(width-61, 9, 52, 12);
      fill(255, 0, 0);
      rect(width-60, 10, 5*rain.size(), 10);
      //update raindrops
      for (int i = rain.size()-1;i>=0;i--)
      {
        //gets raindrop
        raindrop r = rain.get(i);
        //move and show
        r.move();
        r.display();
        //check collision
        if (r.checkCatcher(player))
        {
          score++;
          rain.remove(i);
        }
      }
      //move and show player
      player.move();
      player.display();
      //spaen new raindrop
      if (t.checktime())
      {
        rain.add(new raindrop(random(5, width-5), -5));
      }
      //check if we lost
      if (rain.size()>=losenum)
      {
        lose();
      }
    }
    //title screen
    else
    {
      fill(0, 255, 0);
      ellipse(width/2, height/2, 50, 50);
      fill(255);
      //checks if score = 0
      if (fplay)
      {
        text("Rain", width/2, height/2-100);
      }
      else
      {
        text("Score: "+score, width/2, height/2-100);
      }
    }
  }
  else
  {
    cursor();
  }
}
void startgame()
{
  //reset
  noCursor();
  background(0);
  player = new catcher(new PVector(mouseX, mouseY));
  p = true;
  textAlign(CORNER);
  t=new Timer(2500);
  score = 0;
  fplay = false;
}
void lose()
{
  cursor();
  background(0);
  p = false;
  textSize(50);
  textAlign(CENTER);
  rain.clear();
}
void mousePressed()
{
  //checks if the button is pressed
  if (!p&&dist(mouseX, mouseY, width/2, height/2)<=25)
  {
    startgame();
  }
  //checks if "Quit" is pressed
  else if (p && mouseX<=20 && mouseY>=height-20)
  {
    lose();
  }
}

