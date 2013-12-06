//raindrop[] rain = new raindrop[500];
ArrayList<raindrop> rain = new ArrayList<raindrop>();
int score = 0;
catcher player;
boolean p = false;
int losenum = 10;
Timer t;
void setup()
{
  size(500,500);
  background(0);
  noStroke();
  textSize(50);
  textAlign(CENTER);
}
void draw()
{
  if (p)
  {
    //  background(0);
    fill(0,90);
    rect(0,0,width,height);
    fill(255,255,127.5);
    textSize(10);
    text("Score: "+score,10,20);
    fill(10,10,255);
    rect(width-61,9,52,12);
    fill(255,0,0);
    rect(width-60,10,5*rain.size(),10);
//    text(rain.size(),10,40);
    for(int i = rain.size()-1;i>=0;i--)
    {
      raindrop r = rain.get(i);
      r.move();
      r.display();
      if(r.checkCatcher(player))
      {
        score++;
        rain.remove(i);
      }
    }
    player.move();
    player.display();
    if(t.checktime())
    {
      rain.add(new raindrop(random(5,width-5),-5));
    }
    if(rain.size()>=losenum)
    {
      lose();
    }
  }
  else
  {
    fill(0,255,0);
    ellipse(width/2,height/2,50,50);
    fill(255);
    if(score == 0)
    {
      text("Rain",width/2,height/2-100);
    }
    else
    {
      text("Score: "+score,width/2,height/2-100);
    }
  }
}
void startgame()
{
  background(0);
  player = new catcher(new PVector(mouseX,mouseY));
  p = true;
  textAlign(CORNER);
  t=new Timer(2500);
}
void lose()
{
  background(0);
  p = false;
  textSize(50);
  textAlign(CENTER);
  rain.clear();
  score = 0;
}
void mousePressed()
{
  if(!p&&dist(mouseX,mouseY,width/2,height/2)<=25)
  {
    startgame();
  }
}
