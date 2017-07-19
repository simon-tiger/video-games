class Wave {
  float x;
  float y;
  float z;
  float w;
  float h;
  float vx = 2;
  float vy = 0;
  float vz = 0;
  
  Wave() {
    x = width/16;
    y = height/8*5.5;
    z = 0;
    w = width/8;
    h = height/4*3;
  }
  
  void update() {
    x += vx;
    y += vy;
    z += vz;
  }
  
  boolean check(Sea s) {
    if (x > s.x+s.w/2+w/2-1) {
      vx = 0;
      return true;
    }
    return false;
  }
  
  void show() {
    stroke(0);
    fill(200, 235, 255);
    rectMode(CENTER);
    rect(x, y-1, w+z, h+z+1);
  }
}