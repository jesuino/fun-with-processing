ArrayList<Particle> particles;
void setup() {
  size(600, 400);
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);  
  particles.add(new Particle());
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i); 
    p.update();
    p.display();
  
    if(p.isDead()) {
      particles.remove(i);
    }
  }
}
