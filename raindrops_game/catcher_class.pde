class catcher
{
  int d = 50;
  PVector pos;
  PVector vel;
  catcher(PVector p)
  {
    pos = p;
    vel = new PVector(0,0);
  }
  void move()
  {
    PVector m = new PVector(mouseX-pos.x,mouseY-pos.y);
    m.mult(0.001);
    if(pos.x<=d/2||pos.x>=width-d/2)
    {
      vel.x*=-.5;
    }
    if(pos.y<=d/2||pos.y>=width-d/2)
    {
      vel.y*=-.5;
    }
    vel.add(m);
    pos.add(vel);
//    pos.x = mouseX;
  }
  void display()
  {
    pushStyle();
    strokeWeight(2);
    stroke(0,255,0);
    line(pos.x,pos.y,mouseX,mouseY);
    popStyle();
    fill(255,127.5,0);
    ellipse(pos.x,pos.y,d,d);
  }
}
