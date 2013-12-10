class raindrop
{
  int d = 10;
  PVector pos;
  PVector vel = new PVector(0,4);
  PVector acc = new PVector(0,.1);
  raindrop(float x,float y)
  {
    //sets position
    pos = new PVector(x,y);
  }
  void move()
  {
    //adds velocity to position
    pos.add(vel);
    //checks if drop is onscreen 
    if (pos.y>=0)
    {
      //adds acceleration to velocity
      vel.add(acc);
    }
    //checks if drop is below the screen
    if(pos.y-5>height)
    {
      //resets drop
      reset();
    }
  }
  void display()
  {
    //displays drop
    fill(10,10,255);
    ellipse(pos.x,pos.y,d,d);
  }
  void reset()
  {
    //sets drop to random position above screen and velocity 4 downward
    pos = new PVector(random(width-10)+5,random(-2*height,-5));
    vel.set(0,4);
  }
  boolean checkCatcher(catcher c)
  {
    boolean t = false;
    //checks if raindrop intersects catcher
    if (dist(pos.x,pos.y,c.pos.x,c.pos.y)<=(d+c.d)/2)
    {
      t = true;
    }
    return t;
  }
}
