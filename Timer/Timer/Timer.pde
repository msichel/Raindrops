color c;
TimerMillis timer;
void setup()
{
  size(500,500);
  c = color(random(255),random(255),random(255));
  textSize(50);
  textAlign(CENTER);
  timer = new TimerMillis(2000);
}
void draw()
{
  if(timer.calct())
  {
    c = color(random(255),random(255),random(255));
  }
  background(c);
  fill(0);
  text(millis()/1000,width/2,height/2);
}
class TimerMillis
{
  int lt;
  int delay;
  TimerMillis(int del)
  {
    lt = millis();
    delay = del;
  }
   boolean calct()
   {
     int g = millis();
     boolean t =(g-lt >=delay);
     if(t)
     {
       lt = g;
     }
     return t;
   }
}
