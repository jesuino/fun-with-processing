class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  color c;
  
  Ball() {
    mass = random(0.5, 6);
    location = new PVector(random(0, width), 10);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);  
  }
  
  void update() {    
    velocity.add(acceleration);
    location.add(velocity);    
    acceleration.mult(0);
    checkEdge();
  }
  
  void checkEdge() {
    if(location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } 
    if(location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
    }
    
    if(location.y > height) {
      location.y = height;
      velocity.y *= -1;
    }   
  }
  
  void display() {
    fill(c);
    ellipse(location.x, location.y, mass*10, mass*10);
  }

}
