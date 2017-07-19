Person person;
Sea sea;
ArrayList<Wave> waves;
ArrayList<Wave> savedwaves;

void setup() {
  size(640, 360);
  person = new Person();
  sea = new Sea();
  waves = new ArrayList<Wave>();
  waves.add(new Wave());
  savedwaves = (ArrayList<Wave>) waves.clone();
}

void draw() {
  background(255, 255, 200);
  sea.show();
  for (int i = savedwaves.size()-1; i >= 0; i--) {
    Wave wave = savedwaves.get(i);
    wave.update();
    wave.show();
  }
  boolean ok = true;
  for (int i = waves.size()-1; i >= 0; i--) {
    Wave wave = waves.get(i);
    if (waves.size() < 2) {
      if (wave.check(sea)) {
        Wave w = new Wave();
        waves.add(w);
        savedwaves.add(w);
        waves.remove(0);
      }
    }
    println(person.jumpedInto(wave));
    if (person.jumpedInto(wave)) {
      ok = false;
    }
    if (person.intersects(wave)) {
      person.intersecting = true;
    } else {
      person.intersecting = false;
    }
  }
  if (!ok) {
    noLoop();
  }
  person.fall();
  person.update();
  person.show();
}

void mousePressed() {
  person.jump(2.5);
}

void keyReleased() {
  person.move(0);
}

void keyPressed() {
  if (key == 'u') {
    person.move(-1);
  } else if (key == 'd') {
    person.move(1);
  } else if (key == 'j') {
    person.jump(2.5);
  }
}