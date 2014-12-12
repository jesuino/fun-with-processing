class Particle {
  PVector location;
  PVector velocity; 
  float life;
  float lifeRate;
  color c;
  
  Particle(){
    location = new PVector(mouseX, mouseY, height/2);
    velocity = new PVector(random(-2, 2), random(1, 3));
    life = 255;
    lifeRate = random(1, 10); 
    c = color(0);
  }
  
  void update() {
    location.add(velocity);
    life-=lifeRate;    
  }
  
  void display() {
    if(mousePressed) {
      c = color(random(255), random(255), random(255));
    }
    noStroke();
    fill(c, life);
    ellipse(location.x, location.y, 10.0, 10.0);
  }
  
  boolean isDead() {
    return life < 0;
  }
  
}
