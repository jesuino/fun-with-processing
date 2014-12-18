class Ball {
  PVector location;
  PVector velocity;
  float S = 80, size, op = 255;
  boolean dying = false;

  Ball() {
    velocity = new PVector(random(-3, 3), random(-3, 3));
    location = new PVector(width / 2, height / 2);
    size = S;
  }

  void update() {
    if (mousePressed && isMouseOver() && !dying) selected = this;
    if(dying && size > 0) {
       size--;
       op = map(size, 0, S, 0, 255);
    }
    
    location.add(velocity);
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;
  }
  void display() {
    if(this == selected) {
      fill(255, 0, 0, op);
    } else {
      if (isMouseOver() && !dying) fill (255, 200, 200);
      else fill(255, op);
    }
    
    ellipse(location.x, location.y, size, size);
  }
  
  boolean isMouseOver() {
    return (dist(pmouseX, pmouseY, location.x, location.y) < size / 2);
  }
  
  void kill() {
     dying = true;
  }
  
  boolean isDead() {
      return size <= 0;
  }
}
