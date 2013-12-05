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
    vel.add(m);
    pos.add(vel);
//    pos.x = mouseX;
  }
  void display()
  {
    fill(255,127.5,0);
    ellipse(pos.x,pos.y,d,d);
  }
}
