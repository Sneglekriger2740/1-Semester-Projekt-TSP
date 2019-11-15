int n = 20; // Størrelsen af grafen, n = antallet af byer

PVector[] knuder = new PVector[n]; // Init - for vektorvariabel som array af n's størrelse.
PVector[] knuderbest = new PVector[n];
double a = 0;
double bestEver = 10000000000000000000000000000000000000.1;
boolean b = true;
int displayBest = 0;

void setup() {
  size(1000, 600);
  frameRate(4);

  // --##Generate a random structure of vertice's of n'th size.##--
  for (int i = 0; i<n; i++) {
    knuder[i] = new PVector(random(width), random(height));
  }
  arrayCopy(knuder, 0, knuderbest, 0, knuder.length);
} 
// ----####----####----####----

void draw() {
  background(30);

  //Tegner cirkler ved hvert af punkterne 


  // Tegner linjer imellem punkterne
  for (int i = 0; i<(knuderbest.length); i++) {
    if (i == (knuderbest.length)-1) {
      stroke(200);
      strokeWeight(5);
      fill(100, 100, 100, 10);
      line(knuderbest[i].x, knuderbest[i].y, knuderbest[0].x, knuderbest[0].y);
    } else {
      stroke(200);
      strokeWeight(5);
      fill(100, 100, 100, 10);
      line(knuderbest[i].x, knuderbest[i].y, knuderbest[i+1].x, knuderbest[i+1].y);
    }
    if (i == (knuder.length)-1) {
      stroke(100);
      strokeWeight(1);
      fill(100, 100, 100, 10);
      line(knuder[i].x, knuder[i].y, knuder[0].x, knuder[0].y);
    } else {
      stroke(100);
      strokeWeight(1);
      fill(100, 100, 100, 10);
      line(knuder[i].x, knuder[i].y, knuder[i+1].x, knuder[i+1].y);
    }

    // Udregner distancen mellem punkterne
  }
  for (int i = 0; i<n; i++) {

    if (i == 0) {
      fill(0, 255, 0);
      stroke(0, 215, 0);
      strokeWeight(3);
      ellipse(knuderbest[0].x, knuderbest[0].y, 20, 20);
    } else {
      fill(255, 155, 0);
      stroke(245, 135, 0);
      strokeWeight(3);
      ellipse(knuderbest[i].x, knuderbest[i].y, 20, 20);
    }
    //Laver numrer i hver af punkterne
    if (i>9) {
      fill(0);
      text(""+i, knuderbest[i].x-7, knuderbest[i].y+5);
    } else {
      fill(0);
      text(""+i, knuderbest[i].x-3, knuderbest[i].y+5);
    }
  }
  if (b == true) {
    double dist = 0;
    double sum = 0;
    for (int i = 0; i <knuder.length; i++) {
      if (i == knuder.length - 1) {
        a = knuder[i].dist(knuder[0]);
        sum = sum + a;
      } else {
        a = knuder[i].dist(knuder[i+1]);
        sum = sum + a;
      }
      if (i == (knuder.length - 1)) {
        b = false;
        dist = dist+sum;
        if (dist<bestEver) {
          bestEver = dist;
          displayBest = (int) bestEver;
          arrayCopy(knuder, 0, knuderbest, 0, knuder.length);
        }
      }
    }


    fill(200);
    text("korteste distance = "+displayBest, 15, 15);
    //Viser den bedste distance på skærmen
  }


  int i = floor(random(knuder.length));
  int j = floor(random(knuder.length));
  swap(knuder, i, j);
}

void swap(PVector[] a, int i, int j) {
  PVector temp = a[i];
  a[i] = a[j];
  a[j] = temp;
  b = true;
}
