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
    //determines "force" vector
    PVector m = new PVector(mouseX-pos.x,mouseY-pos.y);
    m.mult(0.001);
    //bouncing off screen edge
    if(pos.x<=d/2||pos.x>=width-d/2)
    {
      vel.x*=-.5;
    }
    if(pos.y<=d/2||pos.y>=width-d/2)
    {
      vel.y*=-.5;
    }
    //adds "force" vector to velocity
    vel.add(m);
    //ads velocity to position
    pos.add(vel);

  }
  void display()
  {
    //stores current style
    pushStyle();
    strokeWeight(2);
    //determines "elastic" color based on distance between mouse and catcher 
    float col = dist(pos.x,pos.y,mouseX,mouseY);
    col*=.5;
    if (col>255)
    {
      col = 255;
    }
    stroke(col,255-col,0);
    //draws "elastic"
    line(pos.x,pos.y,mouseX,mouseY);
    //restores stored style
    popStyle();
    //draws catcher
    fill(255,127.5,0);
    ellipse(pos.x,pos.y,d,d);
  }
}
