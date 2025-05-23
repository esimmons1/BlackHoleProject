// Star-only black hole background simulation, also looks like an opposite of the 
// Warp effect from star wars

int numStars = 300;
ArrayList<Star> stars = new ArrayList<Star>();

PVector blackHole;

float eventHorizonRadius = 70;

void setup() {
  size(1000, 600);
  frameRate(120);
  blackHole = new PVector(width/2, height/2);

  for (int i = 0; i < numStars; i++) {
    stars.add(new Star());
  }
}

void draw() {
  background(0);

  for (Star s : stars) {
    if (s.alive) {
      s.update();
      s.display();
    } else {
      if (random(1) < 0.05) s.respawn();
    }
  }
}

class Star {
  PVector pos, vel;
  ArrayList<PVector> trail = new ArrayList<PVector>();
  boolean alive = true;
  color c;

  Star() {
    respawn();
  }

  void respawn() {
    float angle = random(TWO_PI);
    float dist = random(eventHorizonRadius + 100, width);
    pos = PVector.fromAngle(angle).mult(dist).add(blackHole);
    vel = new PVector(0, 0);
    trail.clear();
    alive = true;

    color[] colors = {
      color(255),
      color(200, 160, 255),
      color(160, 220, 255),
      color(160, 255, 200)
    };
    c = colors[int(random(colors.length))];
  }

  void update() {
    PVector r = PVector.sub(blackHole, pos);
    float d = r.mag();

    if (d < eventHorizonRadius) {
      alive = false;
      return;
    }

    float d2 = constrain(d * d, 100, 300000);
    vel.add(r.normalize().mult(1000 / d2));
    pos.add(vel);
    vel.mult(0.999);

    trail.add(pos.copy());
    if (trail.size() > 8) {
      trail.remove(0);
    }
  }

  void display() {
    color mainColor = color(red(c), green(c), blue(c), 100);
    stroke(mainColor);
    strokeWeight(3);
    point(pos.x, pos.y);

    noFill();
    beginShape();
    for (int i = 0; i < trail.size(); i++) {
      float alphaVal = map(i, 0, trail.size() - 1, 20, 80);
      color cWithAlpha = color(red(c), green(c), blue(c), alphaVal);
      stroke(cWithAlpha);
      strokeWeight(2);
      vertex(trail.get(i).x, trail.get(i).y);
    }
    endShape();
  }
}
