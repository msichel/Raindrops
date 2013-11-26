raindrop[] rain = new raindrop[500];
int score = 0;
catcher player;
void setup()
{
  size(500,500);
  noStroke();
  noCursor();
  for(int i = 0;i<rain.length;i++)
  {
    rain[i] = new raindrop(random(width-10)+5,random(-2*height,-5));
  }
  player = new catcher(new PVector(mouseX,height-100));
}
void draw()
{
  background(0);
  fill(255,255,127.5);
  text(score,10,20);
  for(int i = 0;i<rain.length;i++)
  {
    rain[i].move();
    rain[i].display();
    if(rain[i].checkCatcher(player))
    {
      score++;
    }
  }
  player.move();
  player.display();
}
