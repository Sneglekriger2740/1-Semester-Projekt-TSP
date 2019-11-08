int n = 10; // Size of graph, n = amount of vertices'
PVector[] knuder = new PVector[n]; // initializing 2-dimensional array for storage of x,y coordinates of vertices'
double a = 0;
double bestever = 0;

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
  }
  for (int i = 0; i <(knuder.length); i++) {
    if (i == (knuder.length)-1) {
      double a = sqrt((knuder[i].y-knuder[0].y)*(knuder[i].y-knuder[0].y)+(knuder[i].x-knuder[0].x)*knuder[i].x-knuder[0].x);
      bestever = 0+a;
    } else {
      double a = sqrt((knuder[i].y-knuder[i+1].y)*(knuder[i].y-knuder[i+1].y)+(knuder[i].x-knuder[i+1].x)*knuder[i].x-knuder[i+1].x);
      int b = 0;
      bestever = b+a;
    }
  }




  for (int i = 0; i<n; i++) {
    
    if (i == 0) {
      fill(0,255,0);
      ellipse(knuder[0].x,knuder[0].y, 14, 14);
    }else{
    fill(255, 155, 0);
    ellipse(knuder[i].x, knuder[i].y, 14, 14);
    }
    fill(0);
    text(""+i,knuder[i].x-3,knuder[i].y+5);
  }
  fill(200);
  text("distance = "+bestever, 50, 50);
}
