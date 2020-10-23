class Star{

int myX;
int myY;
color myColor;
  
Star(int x, int y, int r, int g, int b) {
  myX = x;
  myY = y;
  myColor = color(r,g,b);
  }
  


void move() {
  frameRate(speed);
  for(int i = 0; i < 500; i++) {
    int direction = (int)(Math.random() * 4);
    
    if(direction == 0) {
        starX[i] -= 1;
    }
    if(direction == 1) {
        starX[i] += 1;
    }
    if(direction == 2) {
        starY[i] += 1;
    }
    if(direction == 3) {
        starY[i] -= 1;
    }
   
  }
 }



void show(float x, float y, float radius1, float radius2, int npoints) {
  int i = 0;
  fill(red[i],green[i],blue[i]);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
    i++;
  }
  endShape(CLOSE);
}// Took from Processing Documentation


}

Star[] stars = new Star[500];
int[] starX = new int[500];
int[] starY = new int[500];
int[] red = new int[500];
int[] green = new int[500];
int[] blue = new int[500];

int speed = 10;

void setup() {
 size(1200,1000);
 background(0,0,0);
   for(int i = 0; i < 500; i++) {
    int x = (int)(Math.random() * 1200);
    int y = (int)(Math.random() * 1000);
    int r = (int)(Math.random() * 65) + 190;
    int g = (int)(Math.random() * 65) + 190;
    int b = (int)(Math.random() * 50);
    stars[i] = new Star(x,y,r,g,b);
    starX[i] = x;
    starY[i] = y;
    red[i] = r;
    green[i] = g;
    blue[i] = b;
 } 
}

void draw() {
 background(0,0,0);
 frameRate(60);
 for(int i = 0; i < 500; i++) {
     stars[i].move();
     stars[i].show(starX[i],starY[i],10,5,5);
  }
}

void mousePressed() {
 speed += 1; 
  
}
