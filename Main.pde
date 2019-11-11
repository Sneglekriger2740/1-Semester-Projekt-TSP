int n = 30; // Størrelsen af grafen, n = antallet af byer
PVector[] knuder = new PVector[n]; // Start værdien for vektorene med en x og y værdi s
double a = 0;
double bestever = 0;
boolean b = true;

void setup() {
  size(1000, 600);
  background(255);

  // --##Generate a random structure of vertice's of n'th size.##--
  for (int i = 0; i<n; i++) {
    knuder[i] = new PVector(random(width), random(height));
  }
} 
// ----####----####----####----

void draw() {
  background(30);
  // Tegner linjer imellem punkterne
  for (int i = 0; i<(knuder.length); i++) {
    if (i == (knuder.length)-1) {
      stroke(200);
      fill(100, 100, 100, 10);
      line(knuder[i].x, knuder[i].y, knuder[0].x, knuder[0].y);
    } else {
      stroke(200);
      fill(100, 100, 100, 10);
      line(knuder[i].x, knuder[i].y, knuder[i+1].x, knuder[i+1].y);
    }

    // Udregner distancen mellem punkterne
  }
  if (b == true) {
    for (int i = 0; i <(knuder.length); i++) {
      if (i == (knuder.length)-1) {
        a = knuder[i].dist(knuder[0]);
      } else {
        a = knuder[i].dist(knuder[i+1]);
      }
      bestever = bestever+a;
      if (i == (knuder.length-1))
        b = false;
    }
  }

  //Tegner cirkler ved hvert af punkterne 
  for (int i = 0; i<n; i++) {

    if (i == 0) {
      fill(0, 255, 0);
      ellipse(knuder[0].x, knuder[0].y, 20, 20);
    } else {
      fill(255, 155, 0);
      ellipse(knuder[i].x, knuder[i].y, 20, 20);
    }
    //Laver numrer i hver af punkterne
    if (i>9) {
      fill(0);
      text(""+i, knuder[i].x-7, knuder[i].y+5);
    } else {
      fill(0);
      text(""+i, knuder[i].x-3, knuder[i].y+5);
    }
  }

  //Viser den bedste distance på skærmen 
  fill(200);
  text("distance = "+bestever, 50, 50);
}
