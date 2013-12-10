class Timer
{
  int lt;
  int delay;
  Timer(int d)
  {
    //sets delay
    delay = d;
  }
  boolean checktime()
  {
    //checks if delay has passed
    boolean t = (millis()-lt >=delay);
    if(t)
    {
      //resets lt
      lt = millis();
    }
    //returns if delay has passed
    return t;
  }
}
