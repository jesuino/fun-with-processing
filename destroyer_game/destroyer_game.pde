Ball selected;
ArrayList<Ball> balls;
Destroyer d;
int totalBalls = 20;
int score;
boolean gameOver;
boolean opening;

void setup() {
  size(600, 400);
  opening = true;
}

void draw() {
  background(100);
  if (gameOver) {
    showGameOver();
  } else if (opening) {
    showOpening();
  } else {
    showRunning();
  }
}

void initialize() { 
  score = 0;
  d = new Destroyer();
  balls = new ArrayList<Ball>();
  for (int i = 0; i < totalBalls; i++) {
    balls.add(new Ball());
  }
  gameOver = false;
  opening = false;
}

void showRunning() {
  for (int i = 0; i < balls.size (); i++) {
    Ball b = balls.get(i);
    if (d.collides(b)) {
      if (b == selected) {
        score++;
        selected = null;
        background(255);
      }
      b.kill();
      d.velocity = new PVector(random(-1, 1), random(-1, 1));
    }
    b.update();
    b.display();
    if (b.isDead()) {
      balls.remove(b);
    }
  }
  d.update();
  d.display();
  if (balls.size() == 1) {
    Ball last = balls.get(0);
    if (!last.dying) last.size++;
  }
  if (balls.size() == 0 ) {
    gameOver = true;
  }
}

void showOpening() {
  textSize(40);
  fill(10, 10, 200);
  text("Guess which ball is the next victim of the \"Destroyer\"", 10, 40, width - 20, height /2 + 20); 
  textSize(15);
  fill(255, 10, 255);
  text("Click to start!", 10, (height / 2) + 60);
  if (mousePressed) initialize();
}

void showGameOver() {
  textSize(60);
  fill(200, 0, 0);
  text("Game Over", 10, height / 2); 
  textSize(30);
  fill(0, 0, 255);
  text("Total/Score: " + totalBalls + " / " + score, 10, (height / 2) + 40);
  textSize(15);
  text("Click to start again", 10, (height / 2) + 60);
  if (mousePressed) initialize();
}

