class TheThing {
  PVector location, velocity, acceleration;
  float[] ANGLES = { 
    0.0, PI / 4, PI / 2, 3 * PI / 4, PI, 5 *PI / 4, 3 * PI / 2, 7 * PI/  4
  };
  color[] colors;
  float opValue = 200, opRate = 0.5;
  float minSizeNucleo = 10, maxSizeNucleo = 30, sizeNucleo = maxSizeNucleo, nRate = 1;
  float moveDir = 1;
  float r = 40;

  TheThing() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(1, 1);
    acceleration = new PVector(random(-1, 1), random(-1, 1));
    colors = new color[ANGLES.length];
    for (int i = 0; i < colors.length; i++) {    
      colors[i] = color(random(255), random(255), random(255));
    }
  }

  void update() {
    if (mousePressed) {
      PVector m = new PVector(mouseX, mouseY);
      PVector mDir = PVector.sub(location, m);
      mDir.normalize();      
      acceleration = mDir;  
      if (opValue >= 255 || opValue <= 20) opRate*=-1;
      opValue += opRate;
      stroke(200, opValue);    
      line(location.x, location.y, mouseX, mouseY);
    } else {
      if (location.x > width) location.x = 0;
      if (location.x < 0) location.x = width;
      if (location.y > height) location.y = 0;
      if (location.y < 0) location.y = height;          
      opValue = 254;
    }
    if (sizeNucleo > maxSizeNucleo || sizeNucleo < minSizeNucleo) nRate *= -1;  
    sizeNucleo += nRate;   
    velocity.limit(5);
    velocity.add(acceleration);
    location.add(velocity);
  }

  void display() {
    fill(random(255), random(255), random(255), opValue);
    noStroke();
    ellipse(location.x, location.y, sizeNucleo, sizeNucleo);  
    for (int i = 0; i < ANGLES.length; i++) {    
      float x = (r * cos(ANGLES[i])) + location.x;
      float y = (r * sin(ANGLES[i])) + location.y;
      fill(colors[i], opValue);  
      ellipse(x, y, 10, 10);
      if (mousePressed)     
        ANGLES[i]+=0.03;
      else 
        ANGLES[i] -= 0.03;
    }
  }
}

