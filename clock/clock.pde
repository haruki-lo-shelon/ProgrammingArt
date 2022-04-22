int clock_width = 300;
int clock_height = 300;

float x1;
float x2;
float y1;
float y2;

PFont text;

void setup() {
  size(600,600);
  stroke(255);
  smooth();
  frameRate(60);
  
  text = loadFont("Vivaldii-48.vlw");
}
 
void draw() {
  background(0);
  float s = second();
  float m = minute();
  float h = hour() % 12;
 
  translate(width/2, height/2);
  
  // 時計の周りの丸を描画
  around_circle();
  
  // 時計の周りの8角形の部分の描画
  octagon();
  
  noFill();
  stroke(0);
 
  //秒針の描画
  second_hand(s);
 
  //分針の描画
  minute_hand(m, s);
 
  //時針の描画
  hour_hand(h, m);
  
  // 数字の描画
  for(int i = 1; i <= 12; i++){
    fill(0);
    pushMatrix();
    rotate(radians(i*30));
    textFont(text, 32);
    text(i, -16, -(clock_width/5*2));
    popMatrix();
  }
  
  //println((int)h + ":" + (int)m + ":"  + (int)s);
}

// 時計の周りの丸を描画する関数
void around_circle(){
  fill(255);
  ellipse(0,0,clock_width,clock_height);
  strokeWeight(3);
  noFill();
  stroke(255);
  ellipse(0,0,clock_width+10,clock_height+10);
  strokeWeight(1);
  ellipse(0,0,clock_width+18,clock_height+18);
}

// 時計の周りの8角形の部分の描画する関数
void  octagon(){
  x1 = clock_width/2 * 1.4 * cos(radians(45/2));
  x2 = clock_height/2 * 1.4 * cos(radians(45/2 *3));
  y1 = -(clock_width/2 * 1.4 * sin(radians(45/2)));
  y2 = -(clock_height/2 * 1.4 * sin(radians(45/2 *3)));
  
  for(int i = 1; i <= 8; i++){
    pushMatrix();
    rotate(radians(i*(360/8)));
    strokeWeight(1);
    line(x1, y1, x2, y2);
    popMatrix();
  }
  
  x1 = clock_width/2 * 1.3 * cos(radians(45/2));
  x2 = clock_height/2 * 1.3 * cos(radians(45/2 *3));
  y1 = -(clock_width/2 * 1.3 * sin(radians(45/2)));
  y2 = -(clock_height/2 * 1.3 * sin(radians(45/2 *3)));
  
  for(int i = 1; i <= 8; i++){
    pushMatrix();
    rotate(radians(i*(360/8)));
    strokeWeight(3);
    line(x1, y1, x2, y2);
    popMatrix();
  }
  
  x1 = (clock_width/2 * 1.3 - 5) * cos(radians(45/2));
  x2 = (clock_height/2 * 1.3 - 5) * cos(radians(45/2 *3));
  y1 = -((clock_width/2 * 1.3 - 5) * sin(radians(45/2)));
  y2 = -((clock_height/2 * 1.3 - 5) * sin(radians(45/2 *3)));
  
  for(int i = 1; i <= 8; i++){
    pushMatrix();
    rotate(radians(i*(360/8)));
    strokeWeight(1);
    line(x1, y1, x2, y2);
    popMatrix();
  }
}

// 秒針の描画関数
void second_hand(float s){
  pushMatrix();
  rotate(radians(s*(360/60)));
  strokeWeight(2);
  line(0,0,0,-clock_height/2);
  ellipse(0, -30, 10, 10);
  popMatrix();
}

// 分針の描画関数
void minute_hand(float m, float s){
  pushMatrix();
  rotate(radians(m*360/60 + s*360/3600));
  strokeWeight(2);
  
  line(0,-80,0,-clock_height/2);
  
  bezier(0, 0, 0, -10, -20, -20, 0, -40);
  bezier(0, -40, 20, -60, 0, -70, 0, -80);
  
  bezier(0, 0, 8, -10, 0, -20, 0, -30);
  bezier(0, -30, 8, -37, 8, -44, 8, -50);
  
  popMatrix();
}

// 時針の描画関数
void hour_hand(float h, float m){
  pushMatrix();
  rotate(radians((h*360/12) + m*360/720));
  strokeWeight(2);
  
  line(0,-clock_height/3 + 10,0,-clock_height/3 - 20);
  
  ellipse(-10, -50, 20, 20);
  ellipse(10, -50, 20, 20);
  
  bezier(0, -50, 0, -55, 10, -65, 10, -70);
  bezier(10, -70, 10, -75, 0, -85, 0, -90);
  
  bezier(0, -50, 0, -55, -10, -65, -10, -70);
  bezier(-10, -70, -10, -75, 0, -85, 0, -90);
  
  bezier(0, 0, 10, -10, 0, -15, 0, -20);
  bezier(0, -20, 0, -27, 3, -33, 10, -40);
  
  bezier(0, 0, -10, -10, 0, -15, 0, -20);
  bezier(0, -20, 0, -27, -3, -33, -10, -40);
  
  popMatrix();
}
