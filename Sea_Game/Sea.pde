class Sea {
  float x;
  float y;
  float z;
  float w;
  float h;
  
  Sea() {
    x = width/4;
    y = height/2;
    z = 0;
    w = width/2;
    h = height;
  }
  
  void show() {
    noStroke();
    fill(200, 255, 255);
    rectMode(CENTER);
    rect(x, y, w+z, h+z);
  }
}