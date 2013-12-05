class raindrop
{
  int d = 10;
  PVector pos;
  PVector vel = new PVector(0,4);
  PVector acc = new PVector(0,.1);
  raindrop(float x,float y)
  {
    pos = new PVector(x,y);
  }
  void move()
  {
    pos.add(vel);
    if (pos.y>=0)
    {
      vel.add(acc);
    }
    if(pos.y-5>height)
    {
      reset();
    }
  }
  void display()
  {
    fill(10,10,255);
    ellipse(pos.x,pos.y,d,d);
  }
  void reset()
  {
    pos = new PVector(random(width-10)+5,random(-2*height,-5));
    vel.set(0,4);
  }
  boolean checkCatcher(catcher c)
  {
    boolean t = false;
    if (dist(pos.x,pos.y,c.pos.x,c.pos.y)<=(d+c.d)/2)
    {
      reset();
      t = true;
    }
    return t;
  }
}
