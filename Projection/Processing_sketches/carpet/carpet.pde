//unnamed project

int MaxSegments = 5;





int leftorright = 3; //1 = left, 3 = right

color invisiblecolor = color(255, 255, 255);
color truecolor = color(0, 255, 0);
color falsecolor = color(255, 0, 0);
char[] leftx = new char[4];
char[] rightx = new char[4];

void setup() {
  

 leftx[0] = '0';
 leftx[1] = '1';
 leftx[2] = '2';
 leftx[3] = '0'; //0 = not shown, 1 = true, 2 = false
 

 rightx[0] = '0';
 rightx[1] = '2';
 rightx[2] = '1';
 rightx[3] = '0';

  
  //size(640, 480);
  fullScreen();
  
  stroke(0, 0, 0);
  background(255, 255, 255);
}

void draw() {
  String[] values= loadStrings("controller.txt");
  for(int i=0;i<4;i++){
    leftx[i] = values[i].charAt(0);
    rightx[i] = values[i+4].charAt(0);
  }
  
  line(width/2, height/(MaxSegments-1), width/2, height);
  bezier(float(0), height/(MaxSegments-.5), float(width/2), float(height/(MaxSegments-1)), float(width/2), float(height/(MaxSegments-1)), float(width), height/(MaxSegments-.5));  
fill(random(0,255), random(0,255), random(0,255));
  ellipse(width/2, height/(MaxSegments+2), width/8, width/8); 
  fill(255,255,255);
  for (int segments = 1; segments < MaxSegments; segments ++) {
    line(0, ((segments+1)*(height/MaxSegments)), width, ((segments+1)*(height/MaxSegments)));
  }
  
leftorright=1;  
populatearray(leftx,leftorright);
leftorright=3;
populatearray(rightx,leftorright);

}


void populatearray(char[] inputarray,int drawside){
  for (int segments = 0; segments < 4; segments ++) {
  switch(inputarray[segments]){
  case '0':
      fill(invisiblecolor);
      break;
  case '1':
      fill(truecolor);
      break;
  case '2':
      fill(falsecolor);
      break;
  }      
  ellipse(drawside*(width/4), (segments+1.5)*(height/5), width/8, width/8); 
  }

}