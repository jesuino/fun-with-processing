float[] a = {0.0, PI / 4, PI / 2, 3 * PI / 4, PI, 5 *PI / 4,  3 * PI / 2, 7 * PI/  4 };
color[] colors;
float minSizeNucleo = 20;
float maxSizeNucleo = 50;
float sizeNucleo = maxSizeNucleo;
float posX, posY;
float d = 0.5, dx = 1, dy = 1; 
float r = 60;
float op = 5, opValue = 200;

void setup() {
  size(600, 400);
  posX = width / 2;
  posY = height / 2; 
  colors = new color[a.length]; 
  for (int i = 0; i < colors.length; i++) {    
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(255);
  fill(100, 0, 0, opValue);
  noStroke();
  ellipse(posX , posY, sizeNucleo, sizeNucleo);  
  for(int i = 0; i < a.length; i++) {    
      float x = (r * cos(a[i])) + posX;
      float y = (r * sin(a[i])) + posY;
      fill(colors[i], opValue);  
      ellipse(x , y , 10, 10);
     if(mousePressed)     
        a[i]+=0.03;
      else 
        a[i] -= 0.03;  
  } 
  if(mousePressed) {
    if(posX < mouseX) {
      posX += abs(dx);      
    } else if (posX > mouseX) {
      posX -= abs(dx);
    }    
    if(posY < mouseY) {
      posY += abs(dy);
    } 
    if(posY > mouseY){
      posY -= abs(dy);
    }
    if(sizeNucleo > maxSizeNucleo || sizeNucleo < minSizeNucleo) d *= -1;  
    sizeNucleo += d;   
    if (opValue >= 255 || opValue <= 20) op*=-1;
    opValue += op;
    stroke(200, opValue);    
    line(posX, posY, mouseX, mouseY);
  } else {
    if(posX > width || posX < 0) dx *= -1;
    if(posY > height || posY < 0) dy *= -1;
    posX+=dx; posY+=dy;    
    sizeNucleo = maxSizeNucleo;
    opValue = 254;  
  } 
}
