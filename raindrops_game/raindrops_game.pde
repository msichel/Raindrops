//raindrop[] rain = new raindrop[500];
ArrayList<raindrop> rain = new ArrayList<raindrop>();
int score = 0;
catcher player;
void setup()
{
  size(500,500);
  noStroke();
  noCursor();
  player = new catcher(new PVector(mouseX,mouseY));
}
void draw()
{
//  background(0);
  fill(0,90);
  rect(0,0,width,height);
  fill(255,255,127.5);
  text(score,10,20);
  for(int i = rain.size()-1;i>=0;i--)
  {
    raindrop r = rain.get(i);
    r.move();
    r.display();
    if(r.checkCatcher(player))
    {
      score++;
    }
  }
  player.move();
  player.display();
}
