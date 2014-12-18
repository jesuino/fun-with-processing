class Destroyer {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float size;

  Destroyer() {
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(0, 0);
    location = new PVector(0, 0);
    size = 10;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    velocity.limit(15);
  }

  void display() {
    fill(0, 255, 255);
    ellipse(location.x, location.y, size, size);
  }
  
  boolean collides(Ball b) {
    return (dist(b.location.x, b.location.y, location.x, location.y) < (b.size / 2) + (size / 2));
  }
}

