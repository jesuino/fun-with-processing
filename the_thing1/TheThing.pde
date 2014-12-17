class TheThing {
  PVector location, velocity, acceleration;
  float[] ANGLES = { 
    0.0, PI / 4, PI / 2, 3 * PI / 4, PI, 5 *PI / 4, 3 * PI / 2, 7 * PI/  4
  };
  color[] colors;
  color coreColor;
  float angleRate;
  float opValue, opRate = 20;
  float minSizeNucleo = 10, maxSizeNucleo = 30, sizeNucleo = maxSizeNucleo, nRate = 1;
  float moveDir = 1;
  float r = 40;

  TheThing() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(1, 1);
    acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    colors = new color[ANGLES.length];
    for (int i = 0; i < colors.length; i++) {    
      colors[i] = color(random(255), random(255), random(255));
    }
    coreColor = color(random(255), random(255), random(255));
    opValue = random(0, 255);
    angleRate = random(0.0, 0.2);
  }

  void update() {
    if (mousePressed) {
      PVector m = new PVector(mouseX, mouseY);
      PVector mDir = PVector.sub(location, m);
      mDir.normalize();      
      acceleration = mDir;  
      stroke(200, opValue);
      if (opValue >= 255 || opValue <= 20) opRate*=-1;  
      opValue+=opRate;    
      line(location.x, location.y, mouseX, mouseY);
    } else {      
      opValue += abs(opRate);
    }    
    if (location.x > width) location.x = 0;
    if (location.x < 0) location.x = width;
    if (location.y > height) location.y = 0;
    if (location.y < 0) location.y = height;   
  
    if (sizeNucleo > maxSizeNucleo || sizeNucleo < minSizeNucleo) nRate *= -1;  
    sizeNucleo += nRate;   
    velocity.limit(2);
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    fill(coreColor, opValue);
    noStroke();
    ellipse(location.x, location.y, sizeNucleo, sizeNucleo);  
    for (int i = 0; i < ANGLES.length; i++) {    
      float x = (r * cos(ANGLES[i])) + location.x;
      float y = (r * sin(ANGLES[i])) + location.y;
      fill(colors[i], opValue);  
      ellipse(x, y, 10, 10);
      ANGLES[i]+=angleRate;
    }
  }
}

