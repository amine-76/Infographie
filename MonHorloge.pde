PShape clockFace, hourHand, minuteHand, secondHand;
int diameter = 400;
float cx, cy;
TimeMillis tmp ; 

void setup() {
  size(600, 600);
  cx = width / 2;
  cy = height / 2;
  tmp = new TimeMillis();

  // Create the clock face
  clockFace = createShape(ELLIPSE, cx-100, cy-100, diameter, diameter);
  clockFace.setFill(color(220));

  // Create the hour hand
  hourHand = createShape();
  hourHand.beginShape();
  hourHand.fill(color(255, 204, 0));  // Yellow
  hourHand.vertex(-10, 0);
  hourHand.vertex(-5, -120);
  hourHand.vertex(5, -120);
  hourHand.vertex(10, 0);
  hourHand.endShape(CLOSE);

  // Create the minute hand
  minuteHand = createShape();
  minuteHand.beginShape();
  minuteHand.fill(color(255, 204, 0));  // Yellow
  minuteHand.vertex(-7, 0);
  minuteHand.vertex(-3, -180);
  minuteHand.vertex(3, -180);
  minuteHand.vertex(7, 0);
  minuteHand.endShape(CLOSE);

  // Create the second hand
  secondHand = createShape();
  secondHand.beginShape();
  secondHand.fill(color(255, 0, 0));  // Rouge
  secondHand.vertex(-3, 0);
  secondHand.vertex(-1, -200);
  secondHand.vertex(1, -200);
  secondHand.vertex(3, 0);
  secondHand.endShape(CLOSE);
}

void draw() {
  background(255,0,0);
  //println(cx,cy);
  //println(tmp.h(), tmp.m(),tmp.s());
  //  println("Angle en degré pour l'heure suivi des minutes : "+tmp.h()*2*PI,tmp.s()*2*PI);
  

  translate(cx, cy);

  // Draw the clock face
  shape(clockFace, -diameter/2, -diameter/2);

  // Draw the hour hand
  pushMatrix();
  rotate(tmp.h()*TWO_PI);  // 30 degrees per hour
  shape(hourHand);
  popMatrix();

  // Draw the minute hand
  pushMatrix();
  rotate(tmp.m()*TWO_PI);  // 6 degrees per minute
  shape(minuteHand);
  popMatrix();

  // Draw the second hand
  pushMatrix();
  rotate(tmp.s()*TWO_PI);  // 6 degrees per second //<>//
  shape(secondHand);
  popMatrix();

  // Draw the hour marks
  for (int i = 0; i < 60; i++) {
    pushMatrix();
    rotate(radians(6 * i));
    stroke(0);
    if (i % 5 == 0) {
      line(0, -diameter / 2, 0, -diameter / 2 + 20);  // Hour mark
    } else {
      line(0, -diameter / 2, 0, -diameter / 2 + 10);  // Minute mark
    }
    popMatrix();
  }
}
