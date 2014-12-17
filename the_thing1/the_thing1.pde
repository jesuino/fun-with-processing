TheThing t[];
void setup() {
  size(800, 600);
  t = new TheThing[50];
  for (int i = 0; i< t.length; i++) {
    t[i] = new TheThing();
  }
}

void draw() {
  background(255);
  for (int i = 0; i< t.length; i++) {
    t[i].update();
    t[i].display();
  }
}

