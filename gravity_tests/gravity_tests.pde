Ball[] balls;
PVector wind;

void setup() {
  size(600, 400);
  balls = new Ball[200];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  } 
  wind = new PVector(0.01, 0);
}

void draw() { 
  background(100);
  for (Ball b : balls) {
    PVector gravity = new PVector(0, 0.1);
    gravity.mult(b.mass);
    PVector friction = b.velocity.get();
    friction.normalize();
    friction.mult(-0.01);
    b.update();
    b.display();
    b.applyForce(gravity);
   b.applyForce(wind);
    b.applyForce(friction);
  }
}
