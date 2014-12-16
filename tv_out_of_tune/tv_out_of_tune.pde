int t = 0;
int s = 2;

void setup() {
  frameRate(5);
  size(300, 200);
}
void draw() {
  for(int i = 0 ; i < width; i+=s){
    for(int j = 0 ; j < height; j+=s){              
      noStroke();
      fill(map(noise(t++), 0, 1, 80, 255));
      rect(i, j, i+s, j+s);
    }
  } 

}


