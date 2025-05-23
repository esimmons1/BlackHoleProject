// Particle only black hole simulation

int numParticles = 20;
Particle[] particles;

float eventHorizonRadius = 70;
PVector blackHole;

void setup() {
  size(1000, 600);
  frameRate(120);
  blackHole = new PVector(width/2, height/2);

  particles = new Particle[numParticles];
  for (int i = 0; i < numParticles; i++) {
    float angle = random(TWO_PI);
    float dist = random(eventHorizonRadius + 50, width/2);
    PVector pos = PVector.fromAngle(angle).mult(dist).add(blackHole);
    PVector vel = PVector.random2D().mult(random(0.7, 3.7));
    particles[i] = new Particle(pos, vel);
  }
}

void draw() {
  background(0);

  // No black hole rings or circle drawn here

  for (Particle p : particles) {
    if (p.alive) {
      p.update();
      p.display();
    } else {
      if (random(1) < 0.10) {
        p.respawn();
      }
    }
  }
}

class Particle {
  PVector pos, vel;
  boolean alive = true;
  ArrayList<PVector> trail = new ArrayList<PVector>();
  int trailLength = 10;

  Particle(PVector pos, PVector vel) {
    this.pos = pos.copy();
    this.vel = vel.copy();
  }

  void respawn() {
    float angle = random(TWO_PI);
    float dist = random(eventHorizonRadius + 50, width/2);
    pos = PVector.fromAngle(angle).mult(dist).add(blackHole);

    // Set tangential velocity for orbit effect
    PVector radial = PVector.sub(pos, blackHole);
    PVector tangential = new PVector(-radial.y, radial.x).normalize();
    vel = tangential.mult(random(1.5, 3.5));

    trail.clear();
    alive = true;
  }

  void update() {
    PVector r = PVector.sub(blackHole, pos);
    float d = r.mag();

    if (d < eventHorizonRadius) {
      alive = false;
      return;
    }

    float d2 = constrain(d * d, 100, 250000);
    vel.add(r.normalize().mult(2000 / d2)); // Gravity pull
    pos.add(vel);
    vel.mult(0.999); // Damping

    trail.add(pos.copy());
    if (trail.size() > trailLength) {
      trail.remove(0);
    }
  }

  void display() {
    float dist = PVector.dist(pos, blackHole);
    float lerpVal = constrain(map(dist, eventHorizonRadius, width/3, 1, 0), 0, 1);
    color c = lerpColor(color(255, 165, 0), color(255, 0, 0), lerpVal);
    stroke(c);

    strokeWeight(6);
    point(pos.x, pos.y);

    noFill();
    beginShape();
    for (int i = 0; i < trail.size(); i++) {
      float alpha = map(i, 0, trail.size() - 1, 10, 50);
      stroke(c, alpha);
      vertex(trail.get(i).x, trail.get(i).y);
    }
    endShape();
  }
}
