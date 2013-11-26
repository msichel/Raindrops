class catcher
{
  int d = 50;
  PVector pos;
  catcher(PVector p)
  {
    pos = p;
  }
  void move()
  {
    pos.x = mouseX;
  }
  void display()
  {
    fill(255,255,127.5);
    ellipse(pos.x,pos.y,d,d);
  }
}
