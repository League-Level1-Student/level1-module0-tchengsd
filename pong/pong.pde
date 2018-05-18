import ddf.minim.*;  
Minim minim;
AudioSample sound;
PImage backgroundImage;
void setup(){
  size(600,500);
  background(0,175,0);
  minim = new Minim (this);
  sound = minim.loadSample("4388__noisecollector__pongblipe5.wav", 128);
  backgroundImage=loadImage("Tennis-court-dimensions-size.jpg");
}
int x=300;
int y=400;
int speed=5;
int vertSpeed=5;
void draw(){
image(backgroundImage, 0, 0);
image(backgroundImage, 0, 0, width, height);
fill(255,255,255);
stroke(255,255,255);
ellipse(x,y,15,15);
rect(mouseX,470,100,10);
if(x>=600){
   sound.trigger();
speed=-5;
}
if(x<=0){
   sound.trigger();
speed=5;
}
x+=speed;
if(y<=0){
   sound.trigger();
vertSpeed=5;
}
if(y>=500){
 sound.trigger();
vertSpeed=-5;
}
y+=vertSpeed;

if(intersects(x,y,mouseX,470,100)){
vertSpeed=-5;
}
}
boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
     if (ballY > paddleY && ballX > paddleX && ballX < paddleX + paddleLength)
          return true;
     else 
          return false;
}