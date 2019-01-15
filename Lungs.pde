//homework by Esther Roman, week 5
//the sketch displays a pair of lungs that inflate and deflate
//You can make the subject start running and the lungs will breathe faster and faster
//when the person is running there will be a text display saying "YASSS EXERCISE!!"
//the code uses the library controlp5, classes, arrays, and loops
//not much to look at but I tried to apply all my knowledge

//ISSUES
//I had a lot of problems displaying the windpipe. Now it works, but I don't know why
//I tried to fill the lungs with a triangle texture, does not appear possible with controlp5
//(I left the code for the texture commented out in the lungs tab)
//coding the two lungs separately is inelegant

import controlP5.*;
ControlP5 cp5;
boolean Running = false;
String s = "YASSS EXERCISE!!";


Lung[] lungs = new Lung[3];
Windpipe w;

void setup() {
size(600, 500);
  smooth();
  
 lungs[0] = new Lung();
 lungs[1] = new Lung();
 cp5 = new ControlP5(this);
  
  cp5.addToggle("Running")
     .setPosition(500,20)
     .setSize(50,20)
     .setValue(false)
     .setMode(ControlP5.SWITCH);
   
 w = new Windpipe();
 }

void draw() {
  background(#7AD1F7);
  w.pipes();
switchlungs();
  
  
 
    
}

void switchlungs() {
int faster =50;
 lungs[0] = new Lung();
 lungs[1] = new Lung();

if(Running==false){
lungs[1].leftlung(400);
lungs[1].rightlung(400);
}



else {
lungs[0].leftlung(faster);
lungs[0].rightlung(faster);
}

while(Running==true && faster > -12) {
 
faster = faster-1;
}

if(faster < 10) {
  textSize(40);
text(s, 80, 450);
}
}

int radius=0;
int length=200;
int tempD;
boolean deflate = true;
int redvalue;
//PImage img;

class Lung {
void leftlung(int tempD) {
  redvalue = 209;
  //PImage img = loadImage("lung texture.jpg");
  rectMode(CENTER);
  noStroke();
  fill(redvalue, 126, 191);
  //texture(img);
  rect(width/4, height/2, length-20, length+30, 150, 6, 12, 18);

  // Inflate and deflate
  if (deflate) length--;
  else length++;
  delay(tempD);

  // Reverse
  if (length == 160 || length == 200) deflate = !deflate;
}

void rightlung(int tempD) {
   redvalue = 209;
  rectMode(CENTER);
  noStroke();
  //fill(#D17EBF);
  fill(redvalue, 126, 191);
  //PImage img = loadImage("lung texture.jpg");
  rect(340, height/2, length-20, length+30, 6, 150, 12, 18);

  // Inflate and deflate
  if (deflate) length--;
  else length++;
  delay(tempD);

  // Reverse
  if (length == 160 || length == 200) deflate = !deflate;
  

}

}
class Windpipe {
  
  void draw(){
 pipes();
 }
 
 void pipes(){
 strokeWeight(30);
stroke(199,21,133);
line(245, 100, 245, 200);
line(200, 220, 245, 200);
line(300, 220, 245, 200);}
}
