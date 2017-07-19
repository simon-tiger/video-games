class Person {
  float x;
  float y;
  float z;
  float vx = -1;
  float vy = 0;
  float vz = 0;
  float r;
  
  Person() {
    x = width-50;
    y = height/2;
    z = 0;
    r = 20;
  }
  
  void jump(float power) {
    vz += power;
  }
  
  void fall() {
    jump(-0.1);
  }
  
  void update() {
    x += vx;
    y += vy;
    z += vz;
    if (z < 0) {
      z = 0;
      vz = 0;
    }
  }
  
  boolean jumpedInto(Wave w) {
    if (x > w.x - w.w/2 && x < w.x + w.w/2 && z > w.z - vz && z < w.z + 2) {
      return true;
    }
    return false;
  }
  
  void show() {
    stroke(0);
    fill(255, 200, 200);
    ellipse(x, y, r*2+z, r*2+z);
  }
}