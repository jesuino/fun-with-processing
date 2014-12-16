float r = 1;
float a = 0.0;

float lastX = 0;
float lastY = 0;

void setup() {
  size(800, 600);
} 

void draw() {
  translate(width / 2, height / 2);
  float x = r * cos(a);
  float y = r * sin(a);  
  stroke(random(255), random(255), random(255));  
  line(lastX, lastY, x, y);
  r += 0.1;
  a += 0.1;
  lastX = x;
  lastY = y;
}
