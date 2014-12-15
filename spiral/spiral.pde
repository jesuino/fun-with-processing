float r = 1;
float a = 0.0;

void setup() {
  size(800, 600);
} 

void draw() {
  translate(width / 2, height / 2);
  float x = r * cos(a);
  float y = r * sin(a);
  ellipse(x, y, 1, 1);
  r += 0.1;
  a += 0.1;
}
