class Person {
  float x;
  float y;
  float z;
  float vx = -1;
  float vy = 0;
  float vz = 0;
  float r;
  boolean intersecting;
  
  Person() {
    x = width-50;
    y = height/2;
    z = 0;
    r = 20;
  }
  
  void jump(float power) {
    vz += power;
  }
  
  void move(float steps) {
    vy = steps;
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
    if ((x > w.x - w.w/2 && x < w.x + w.w/2) &&
        (y > w.y - w.h/2 && y < w.y + w.h/2) &&
        (z > w.z - 2 && z < w.z + 2)) {
      return true;
    }
    return false;
  }
  
  boolean intersects(Wave w) {
    if (x > w.x - w.w/2 && x < w.x + w.w/2) {
      return true;
    }
    return false;
  }
  
  void show() {
    stroke(0);
    //if (intersecting) {
    //  fill(128, 128, 255);
    //} else {
      fill(255, 200, 200);
    //}
    ellipse(x, y, r*2+z, r*2+z);
  }
}