class Timer
{
  int lt;
  int delay;
  Timer(int d)
  {
    delay = d;
  }
  boolean checktime()
  {
    boolean t = (millis()-lt >=delay);
    if(t)
    {
      lt = millis();
    }
    return t;
  }
}
