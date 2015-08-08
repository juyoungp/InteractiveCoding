//Ju Young Park 
//2014 Aug
// Fultz group data viz FINAL
//speed and color as energy, size by intensity
import controlP5.*;

ControlP5 MyController;
Textlabel instruction;
float x, y, z;
int zoom = 2;
int energyRange;
int energy1 = 20;
int energy2 = 20;
float intensityMin = 0.0, intensityMax = 0.0;
int energyThreshold = 20; 
float rotatex = 0.0;
float rotatey = 0.0;
float hslice = 3.0;
float kslice = 4.0;
float lslice = 10;
FloatList mappedK, mappedH, mappedL, intensity, intensityc,  mappedK2, mappedH2, mappedL2, intensity2, intensityc2, mappedK3, mappedH3, mappedL3, intensity3, intensityc3, mappedK4, mappedH4, mappedL4, intensity4, intensityc4, mappedK5, mappedH5, mappedL5, intensity5, intensityc5, mappedK6, mappedH6, mappedL6, intensity6, intensityc6, mappedK7, mappedH7, mappedL7, intensity7, intensityc7, mappedK8, mappedH8, mappedL8, intensity8, intensityc8, mappedK9, mappedH9, mappedL9, intensity9, intensityc9, mappedK10, mappedH10, mappedL10, intensity10, intensityc10, mappedK11, mappedH11, mappedL11, intensity11, intensityc11, mappedK12, mappedH12, mappedL12, intensity12, intensityc12, mappedK13, mappedH13, mappedL13, intensity13, intensityc13, mappedK14, mappedH14, mappedL14, intensity14, intensityc14, mappedK15, mappedH15, mappedL15, intensity15, intensityc15, mappedK16, mappedH16, mappedL16, intensity16, intensityc16, mappedK17, mappedH17, mappedL17, intensity17, intensityc17, mappedK18, mappedH18, mappedL18, intensity18, intensityc18, mappedK19, mappedH19, mappedL19, intensity19, intensityc19, mappedK20, mappedH20, mappedL20, intensity20, intensityc20, mappedK21, mappedH21, mappedL21, intensity21, intensityc21, mappedK22, mappedH22, mappedL22, intensity22, intensityc22, mappedK23, mappedH23, mappedL23, intensity23, intensityc23, mappedK24, mappedH24, mappedL24, intensity24, intensityc24, mappedK25, mappedH25, mappedL25, intensity25, intensityc25, mappedK26, mappedH26, mappedL26, intensity26, intensityc26, mappedK27, mappedH27, mappedL27, intensity27, intensityc27, mappedK28, mappedH28, mappedL28, intensity28, intensityc28;
Table dataAll, data, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27;

float sliderVal; 
boolean radioButtonH = false, radioButtonK = false, radioButtonL = false;
boolean energyEach = false, energyAll = false;
boolean grid = true;
float xpiv;
float ypiv;
boolean drawSliceH = false, drawSliceK = false, drawSliceL = false;
float hsliceValue, ksliceValue, lsliceValue;
PImage arrowKey;
PFont pfont;
void setup(){
  frameRate(30);
  size(1280, 720, P3D);
  frame.setTitle("Neutron Scattering Visualization");
  arrowKey = loadImage("keyboard.png");
  MyController = new ControlP5(this);
  
  pfont = createFont("Blender-Medium", 10, true);
  MyController.setControlFont(pfont);
              
  MyController.addToggle("drawGrid")
              .setCaptionLabel("Grid On/Off")
              .setPosition(20, height-300)
              .setSize(60, 30)
              .setValue(true)
              .setMode(ControlP5.SWITCH)
              ;
              
  MyController.addSlider("energy1")
              .setCaptionLabel("ENERGY 1")
              .setRange(20, 45)
              .setValue(20)
              .setPosition(width/2-100, height-200)
              .setSize(400, 35)
              .setNumberOfTickMarks(25)
              .setSliderMode(Slider.FLEXIBLE)
              .hide();
              
  MyController.addSlider("energy2")
              .setCaptionLabel("ENERGY 2")
              .setRange(20, 45)
              .setValue(20)
              .setPosition(width/2-100, height-150)
              .setSize(400, 35)
              .setNumberOfTickMarks(25)
              .setSliderMode(Slider.FLEXIBLE)
              .hide();
  
  MyController.addSlider("energyThreshold")
              .setCaptionLabel("ENERGY")
              .setRange(20, 45)
              .setValue(20)
              .setPosition(width/2-100, height-150)
              .setSize(400, 35)
              .hide();
      
  MyController.addRange("intensity")
              .setCaptionLabel("INTENSITY")
             // disable broadcasting since setRange and setRangeValues will trigger an event
             .setBroadcast(false) 
             .setPosition(width/2-100,height-100)
             .setSize(400,35)
             .setHandleSize(20)
             .setRange(0.0020, 0.03)
             .setRangeValues(0.0,0.0025)
             // after the initialization we turn broadcast back on again
             .setBroadcast(true)
             .setColorForeground(color(255,40))
             .setColorBackground(color(255,40))
             .hide();            
             
  MyController.addSlider("zoom",2,15,2,20,height-200,250,35);
  MyController.addSlider("rotatex",0.0,200.0,0.0,20,height-150,250,35).setCaptionLabel("ROTATE X");
  MyController.addSlider("rotatey",0.0,200.0,0.0,20,height-100,250,35).setCaptionLabel("ROTATE Y");
  
     
  MyController.addRadioButton("drawButton")
         .setPosition(width/2-250,height-150)
         .setSize(35,35)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(1)
         .setSpacingRow(20)
         .addItem("energyEach",1)
         .addItem("energyAll",2)
         ;

  MyController.addButton("H")
              .setCaptionLabel("  H")
              .setPosition(20, height-385)
              .setSize(30,30)
              ;
              
  MyController.addButton("K")
              .setCaptionLabel("  K")
              .setPosition(70, height-385)
              .setSize(30,30)
              ;
  MyController.addButton("L")
              .setCaptionLabel("  L")
              .setPosition(120, height-385)
              .setSize(30,30)
              ;
              
  MyController.addButton("EXPORT")
              .setCaptionLabel("   EXPORT")
              .setPosition(width-200, height-100)
              .setSize(60, 30)
              ;
              
  instruction = MyController.addTextlabel("label")
                    .setText("Use Keyboard Arrows to Move")
                    .setPosition(20,height-235)
                    .setFont(createFont("Blender-Medium",12))
                    ;


              
  rectMode(CENTER);
  x = width/2-140;
  y = height/2+125;
  z = 30;
  smooth(4);
  mappedK = new FloatList();
  mappedH = new FloatList();
  mappedL = new FloatList();
  intensity = new FloatList();
  intensityc = new FloatList();
  mappedK2 = new FloatList();
  mappedH2 = new FloatList();
  mappedL2 = new FloatList();
  intensity2 = new FloatList();
  intensityc2 = new FloatList();
  mappedK3 = new FloatList();
  mappedH3 = new FloatList();
  mappedL3 = new FloatList();
  intensity3 = new FloatList();
  intensityc3 = new FloatList();
  mappedK4 = new FloatList();
  mappedH4 = new FloatList();
  mappedL4 = new FloatList();
  intensity4 = new FloatList();
  intensityc4 = new FloatList();
  mappedK5 = new FloatList();
  mappedH5 = new FloatList();
  mappedL5 = new FloatList();
  intensity5 = new FloatList();
  intensityc5 = new FloatList();
  mappedK6 = new FloatList();
  mappedH6 = new FloatList();
  mappedL6 = new FloatList();
  intensity6 = new FloatList();
  intensityc6 = new FloatList();
  mappedK7 = new FloatList();
  mappedH7 = new FloatList();
  mappedL7 = new FloatList();
  intensity7 = new FloatList();
  intensityc7 = new FloatList();
  mappedK8 = new FloatList();
  mappedH8 = new FloatList();
  mappedL8 = new FloatList();
  intensity8 = new FloatList();
  intensityc8 = new FloatList();
  mappedK9 = new FloatList();
  mappedH9 = new FloatList();
  mappedL9 = new FloatList();
  intensity9 = new FloatList();
  intensityc9 = new FloatList();
  mappedK10 = new FloatList();
  mappedH10 = new FloatList();
  mappedL10 = new FloatList();
  intensity10 = new FloatList();
  intensityc10 = new FloatList();
  mappedK11 = new FloatList();
  mappedH11 = new FloatList();
  mappedL11 = new FloatList();
  intensity11 = new FloatList();
  intensityc11 = new FloatList();
  mappedK12 = new FloatList();
  mappedH12 = new FloatList();
  mappedL12 = new FloatList();
  intensity12 = new FloatList();
  intensityc12 = new FloatList();
  mappedK13 = new FloatList();
  mappedH13 = new FloatList();
  mappedL13 = new FloatList();
  intensity13 = new FloatList();
  intensityc13 = new FloatList();
  mappedK14 = new FloatList();
  mappedH14 = new FloatList();
  mappedL14 = new FloatList();
  intensity14 = new FloatList();
  intensityc14 = new FloatList();
  mappedK15 = new FloatList();
  mappedH15 = new FloatList();
  mappedL15 = new FloatList();
  intensity15 = new FloatList();
  intensityc15 = new FloatList();
  mappedK16 = new FloatList();
  mappedH16 = new FloatList();
  mappedL16 = new FloatList();
  intensity16 = new FloatList();
  intensityc16 = new FloatList();
  mappedK17 = new FloatList();
  mappedH17 = new FloatList();
  mappedL17 = new FloatList();
  intensity17 = new FloatList();
  intensityc17 = new FloatList();
  mappedK18 = new FloatList();
  mappedH18 = new FloatList();
  mappedL18 = new FloatList();
  intensity18 = new FloatList();
  intensityc18 = new FloatList();
  mappedK19 = new FloatList();
  mappedH19 = new FloatList();
  mappedL19 = new FloatList();
  intensity19 = new FloatList();
  intensityc19 = new FloatList();
  mappedK20 = new FloatList();
  mappedH20 = new FloatList();
  mappedL20 = new FloatList();
  intensity20 = new FloatList();
  intensityc20 = new FloatList();
  mappedK21 = new FloatList();
  mappedH21 = new FloatList();
  mappedL21 = new FloatList();
  intensity21 = new FloatList();
  intensityc21 = new FloatList();
  mappedK22 = new FloatList();
  mappedH22 = new FloatList();
  mappedL22 = new FloatList();
  intensity22 = new FloatList();
  intensityc22 = new FloatList();
  mappedK23 = new FloatList();
  mappedH23 = new FloatList();
  mappedL23 = new FloatList();
  intensity23 = new FloatList();
  intensityc23 = new FloatList();
  mappedK24 = new FloatList();
  mappedH24 = new FloatList();
  mappedL24 = new FloatList();
  intensity24 = new FloatList();
  intensityc24 = new FloatList();
  mappedK25 = new FloatList();
  mappedH25 = new FloatList();
  mappedL25 = new FloatList();
  intensity25 = new FloatList();
  intensityc25 = new FloatList();
  mappedK26 = new FloatList();
  mappedH26 = new FloatList();
  mappedL26 = new FloatList();
  intensity26 = new FloatList();
  intensityc26 = new FloatList();
  mappedK27 = new FloatList();
  mappedH27 = new FloatList();
  mappedL27 = new FloatList();
  intensity27 = new FloatList();
  intensityc27 = new FloatList();
  //loadData("Ihkl-20,45.csv", dataAll, mappedKall, mappedHall, mappedLall, intensityall, intensitycall);
  loadData("Ihkl-20,21.csv", data, mappedK, mappedH, mappedL, intensity, intensityc);
  loadData("Ihkl-21,22.csv", data2, mappedK2, mappedH2, mappedL2, intensity2, intensityc2);
  loadData("Ihkl-22,23.csv", data3, mappedK3, mappedH3, mappedL3, intensity3, intensityc3);
  loadData("Ihkl-23,24.csv", data4, mappedK4, mappedH4, mappedL4, intensity4, intensityc4);
  loadData("Ihkl-24,25.csv", data5, mappedK5, mappedH5, mappedL5, intensity5, intensityc5);
  loadData("Ihkl-25,26.csv", data6, mappedK6, mappedH6, mappedL6, intensity6, intensityc6);
  loadData("Ihkl-26,27.csv", data7, mappedK7, mappedH7, mappedL7, intensity7, intensityc7);
  loadData("Ihkl-27,28.csv", data8, mappedK8, mappedH8, mappedL8, intensity8, intensityc8);
  loadData("Ihkl-28,29.csv", data9, mappedK9, mappedH9, mappedL9, intensity9, intensityc9);
  loadData("Ihkl-29,30.csv", data10, mappedK10, mappedH10, mappedL10, intensity10, intensityc10);
  loadData("Ihkl-30,31.csv", data11, mappedK11, mappedH11, mappedL11, intensity11, intensityc11);
  loadData("Ihkl-31,32.csv", data12, mappedK12, mappedH12, mappedL12, intensity12, intensityc12);
  loadData("Ihkl-32,33.csv", data13, mappedK13, mappedH13, mappedL13, intensity13, intensityc13);
  loadData("Ihkl-33,34.csv", data14, mappedK14, mappedH14, mappedL14, intensity14, intensityc14);
  loadData("Ihkl-34,35.csv", data15, mappedK15, mappedH15, mappedL15, intensity15, intensityc15);
  loadData("Ihkl-35,36.csv", data16, mappedK16, mappedH16, mappedL16, intensity16, intensityc16);
  loadData("Ihkl-36,37.csv", data17, mappedK17, mappedH17, mappedL17, intensity17, intensityc17);
  loadData("Ihkl-37,38.csv", data18, mappedK18, mappedH18, mappedL18, intensity18, intensityc18);
  loadData("Ihkl-38,39.csv", data19, mappedK19, mappedH19, mappedL19, intensity19, intensityc19);
  loadData("Ihkl-39,40.csv", data20, mappedK20, mappedH20, mappedL20, intensity20, intensityc20);
  loadData("Ihkl-40,41.csv", data21, mappedK21, mappedH21, mappedL21, intensity21, intensityc21);
  loadData("Ihkl-41,42.csv", data22, mappedK22, mappedH22, mappedL22, intensity22, intensityc22);
  loadData("Ihkl-42,43.csv", data23, mappedK23, mappedH23, mappedL23, intensity23, intensityc23);
  loadData("Ihkl-43,44.csv", data24, mappedK24, mappedH24, mappedL24, intensity24, intensityc24);
  loadData("Ihkl-44,45.csv", data25, mappedK25, mappedH25, mappedL25, intensity25, intensityc25);
  loadData("Ihkl-45,46.csv", data26, mappedK26, mappedH26, mappedL26, intensity26, intensityc26);

}

void draw(){
  hint(ENABLE_DEPTH_TEST);

  
  background(0);
  
  translate(x, y, z);
  rotateX(rotatex * 0.05);
  rotateY(rotatey * 0.05);
  scale(zoom);
  
  if(grid){
  stroke(255);
  strokeWeight(0.6);
  fill(255);
  //sphere(20);
  line(-5, -50, -70, -5, -50, 155); //z axis 
  line(-5, -50, 155, -5, -120, 155); // y axis
  line(-5, -50, 155, 200, -50, 155); // x axis
  pushMatrix();
  text("H", -15, -50, -70);
  text("L", -25, -140, 105); 
  text("K", 230, -50, 105);
  popMatrix();
  }

  pushMatrix();
  if(energyEach == true) { 
    drawBySlider();
    if(MyController.getController("energy2").isMouseOver()){
      drawBySlider2();
    }
  }
  if(energyAll == true) drawAllEnergy();
  if(radioButtonH == true) {
    //drawSliderByH();
    drawSliceH = true;
    drawSliceK = false;
    drawSliceL = false;
  } 
  if(radioButtonK == true) {
    //drawSliderByK();
    drawSliceK = true;
    drawSliceH = false;
    drawSliceL = false;
  } 
  if(radioButtonL == true) { 
    //drawSliderByL();
    drawSliceL = true;
    drawSliceH = false;
    drawSliceK = false;
  } 
  if(!radioButtonH && !radioButtonK && !radioButtonL){
    drawSliceL = false;
    drawSliceH = false;
    drawSliceK = false;
  }
  popMatrix();
  translate(xpiv, ypiv);
  hint(DISABLE_DEPTH_TEST);
  camera();
  
  if(drawSliceH && (energyEach || energyAll)){
    pushMatrix();
    stroke(255);
    fill(255);
    line(20, 120, 0, 20, 315, 0);
    line(20, 315, 0, 220, 315, 0);
    text("E", 20, 115, 0);
    text("H", 225, 315, 0);
    popMatrix();
    
    pushMatrix();
    drawSliceH(mappedH, intensityc,  hsliceValue, 0);
    drawSliceH(mappedH2, intensityc2, hsliceValue, 1);
    drawSliceH(mappedH3, intensityc3, hsliceValue, 2);
    drawSliceH(mappedH4, intensityc4, hsliceValue, 3);
    drawSliceH(mappedH5, intensityc5, hsliceValue, 4);
    drawSliceH(mappedH6, intensityc6, hsliceValue, 5);
    drawSliceH(mappedH7, intensityc7, hsliceValue, 6);
    drawSliceH(mappedH8, intensityc8, hsliceValue, 7);
    drawSliceH(mappedH9, intensityc9, hsliceValue, 8);
    drawSliceH(mappedH10, intensityc10, hsliceValue, 9);
    drawSliceH(mappedH11, intensityc11, hsliceValue, 10);
    drawSliceH(mappedH12, intensityc12, hsliceValue, 11);
    drawSliceH(mappedH13, intensityc13, hsliceValue, 12);
    drawSliceH(mappedH14, intensityc14, hsliceValue, 13);
    drawSliceH(mappedH15, intensityc15, hsliceValue, 14);
    drawSliceH(mappedH16, intensityc16, hsliceValue, 15);
    drawSliceH(mappedH17, intensityc17, hsliceValue, 16);
    drawSliceH(mappedH18, intensityc18, hsliceValue, 17);
    drawSliceH(mappedH19, intensityc19, hsliceValue, 18);
    drawSliceH(mappedH20, intensityc20, hsliceValue, 20);
    drawSliceH(mappedH21, intensityc21, hsliceValue, 21);
    drawSliceH(mappedH22, intensityc22, hsliceValue, 22);
    drawSliceH(mappedH23, intensityc23, hsliceValue, 23);
    drawSliceH(mappedH24, intensityc24, hsliceValue, 24);
    drawSliceH(mappedH25, intensityc25, hsliceValue, 25);
    popMatrix();
  } else if(drawSliceK && (energyEach || energyAll)){
    pushMatrix();
    stroke(255);
    fill(255);
    line(20, 120, 0, 20, 315, 0);
    line(20, 315, 0, 220, 315, 0);
    text("E", 20, 115, 0);
    text("K", 225, 315, 0);
    popMatrix();
    
    pushMatrix();
    drawSliceK(mappedK, intensityc,  ksliceValue, 0);
    drawSliceK(mappedK2, intensityc2, ksliceValue, 1);
    drawSliceK(mappedK3, intensityc3, ksliceValue, 2);
    drawSliceK(mappedK4, intensityc4, ksliceValue, 3);
    drawSliceK(mappedK5, intensityc5, ksliceValue, 4);
    drawSliceK(mappedK6, intensityc6, ksliceValue, 5);
    drawSliceK(mappedK7, intensityc7, ksliceValue, 6);
    drawSliceK(mappedK8, intensityc8, ksliceValue, 7);
    drawSliceK(mappedK9, intensityc9, ksliceValue, 8);
    drawSliceK(mappedK10, intensityc10, ksliceValue, 9);
    drawSliceK(mappedK11, intensityc11, ksliceValue, 10);
    drawSliceK(mappedK12, intensityc12, ksliceValue, 11);
    drawSliceK(mappedK13, intensityc13, ksliceValue, 12);
    drawSliceK(mappedK14, intensityc14, ksliceValue, 13);
    drawSliceK(mappedK15, intensityc15, ksliceValue, 14);
    drawSliceK(mappedK16, intensityc16, ksliceValue, 15);
    drawSliceK(mappedK17, intensityc17, ksliceValue, 16);
    drawSliceK(mappedK18, intensityc18, ksliceValue, 17);
    drawSliceK(mappedK19, intensityc19, ksliceValue, 18);
    drawSliceK(mappedK20, intensityc20, ksliceValue, 20);
    drawSliceK(mappedK21, intensityc21, ksliceValue, 21);
    drawSliceK(mappedK22, intensityc22, ksliceValue, 22);
    drawSliceK(mappedK23, intensityc23, ksliceValue, 23);
    drawSliceK(mappedK24, intensityc24, ksliceValue, 24);
    drawSliceK(mappedK25, intensityc25, ksliceValue, 25);
    popMatrix();
  } else if(drawSliceL && (energyEach || energyAll)){
    pushMatrix();
    stroke(255);
    fill(255);
    line(20, 120, 0, 20, 315, 0);
    line(20, 315, 0, 220, 315, 0);
    text("E", 20, 115, 0);
    text("L", 225, 315, 0);
    popMatrix();
    
    pushMatrix();
    drawSliceL(mappedL, intensityc,  lsliceValue, 0);
    drawSliceL(mappedL2, intensityc2, lsliceValue, 1);
    drawSliceL(mappedL3, intensityc3, lsliceValue, 2);
    drawSliceL(mappedL4, intensityc4, lsliceValue, 3);
    drawSliceL(mappedL5, intensityc5, lsliceValue, 4);
    drawSliceL(mappedL6, intensityc6, lsliceValue, 5);
    drawSliceL(mappedL7, intensityc7, lsliceValue, 6);
    drawSliceL(mappedL8, intensityc8, lsliceValue, 7);
    drawSliceL(mappedL9, intensityc9, lsliceValue, 8);
    drawSliceL(mappedL10, intensityc10, lsliceValue, 9);
    drawSliceL(mappedL11, intensityc11, lsliceValue, 10);
    drawSliceL(mappedL12, intensityc12, lsliceValue, 11);
    drawSliceL(mappedL13, intensityc13, lsliceValue, 12);
    drawSliceL(mappedL14, intensityc14, lsliceValue, 13);
    drawSliceL(mappedL15, intensityc15, lsliceValue, 14);
    drawSliceL(mappedL16, intensityc16, lsliceValue, 15);
    drawSliceL(mappedL17, intensityc17, lsliceValue, 16);
    drawSliceL(mappedL18, intensityc18, lsliceValue, 17);
    drawSliceL(mappedL19, intensityc19, lsliceValue, 18);
    drawSliceL(mappedL20, intensityc20, lsliceValue, 20);
    drawSliceL(mappedL21, intensityc21, lsliceValue, 21);
    drawSliceL(mappedL22, intensityc22, lsliceValue, 22);
    drawSliceL(mappedL23, intensityc23, lsliceValue, 23);
    drawSliceL(mappedL24, intensityc24, lsliceValue, 24);
    drawSliceL(mappedL25, intensityc25, lsliceValue, 25);
    popMatrix();
  }
  
  pushMatrix();
  instruction.draw(this);
  image(arrowKey, 213, height-260);
  popMatrix();
  

}

void drawGrid(boolean theFlag){
  if(theFlag == true) grid = true;
  else grid = false;
}

void drawSliceH(FloatList hlist, FloatList ilist, float value, int e){

  float reMappedValue = constrain(map(value, -10, 3, -150, 150), -150, 150);
  for(int i = 0; i <hlist.size(); i++){
    //if(hlist.get(i) <= reMappedValue){
      int mappedI = (int)map(ilist.get(i),0, 0.02, 255, 0);
      float hlistx = map(hlist.get(i), -150, 150, 0, 300);
      fill(255, mappedI, mappedI);
      noStroke();
      ellipse(-90+hlistx, 305-(e*8), 2, 2);
    //}
  }
 
}

void drawSliceK(FloatList klist, FloatList ilist, float value, int e){
 float reMappedValue = constrain(map(value, -6, 10, 0, 400), 0, 400);
  for(int i = 0; i <klist.size(); i++){
    
    //if(klist.get(i) <= reMappedValue){
      int mappedI = (int)map(ilist.get(i),0, 0.02, 255, 0);
      float klistx = map(klist.get(i), 0, 400, 0, 350);
      fill(255, mappedI, mappedI);
      noStroke();
      ellipse(30+klistx, 305-(e*8), 2, 2);
    //}
  }
 
}

void drawSliceL(FloatList llist, FloatList ilist, float value, int e){
 float reMappedValue = map(value, -10, 50, 100, -1000);
  for(int i = 0; i <llist.size(); i++){
    
    //if(llist.get(i) >= reMappedValue){
      int mappedI = (int)map(ilist.get(i),0, 0.02, 255, 0);
      float llistx = map(llist.get(i), 100, -1000, 0, 1000);
      fill(255, mappedI, mappedI);
      noStroke();
      ellipse(-110+llistx, 305-(e*8), 2, 2);
    //}
  }
 
}

void drawSliderByH(){
  pushMatrix();
  fill(255, 0, 0, 127);
  noStroke();
  float mappedHslice = map(hsliceValue, -5, 3, 85, -30);
  translate(-5, -50, mappedHslice);
  rect(0, 0, 8, 10);
  popMatrix();
  
  pushMatrix();
  float mappedHslice2 = map(hsliceValue, -5, 3, 85, -30);
  translate(-5, -50, mappedHslice2);
  fill(255, 255, 255, 47);
  noStroke();
  rect(101, -50, 200, 100);
  popMatrix();
  
  
  
  
}
void drawSliderByK(){
  pushMatrix();
  float mappedKslice = map(ksliceValue, -6, 10, -5, 200);
  translate(mappedKslice, -50, 155);
  fill(0, 0, 255, 127);
  noStroke();
  rotateY(radians(90));
  rect(0, 0, 8, 10);
  popMatrix();
  
  pushMatrix();
  float mappedKslice2 = map(ksliceValue, -6, 10, -5, 200);
  translate(mappedKslice2, -100, 56);
  fill(255, 255, 255, 47);
  rotateY(radians(90));
  rect(0, 0, 200, 100);
  popMatrix();
  //float mappedKslice = map(kslice, -6, 10);
}

void drawSliderByL(){
  pushMatrix();
  float mappedLslice = map(lsliceValue, -10, 50, -50, -120);
  translate(-6, mappedLslice, 155);
  noStroke();
  fill(0, 255, 0, 127);
  rotateX(radians(90));
  rect(0, 0, 8, 10);
  popMatrix();
  
  pushMatrix();
  float mappedLslice2 = map(lsliceValue, -10, 50, -50, -120);
  translate(110, mappedLslice2, 60);
  noStroke();
  fill(255, 255, 255, 47);
  rotateX(radians(90));
  rect(0, 0, 240, 200);
  popMatrix();
}
void drawAllEnergy(){
  drawData2(intensity, intensityc, mappedK, mappedH, mappedL, 1);
  drawData2(intensity2, intensityc2, mappedK2, mappedH2, mappedL2, 2);
  drawData2(intensity3, intensityc3, mappedK3, mappedH3, mappedL3, 3);
  drawData2(intensity4, intensityc4, mappedK4, mappedH4, mappedL4, 4);
  drawData2(intensity5, intensityc5, mappedK5, mappedH5, mappedL5, 5);
  drawData2(intensity6, intensityc6, mappedK6, mappedH6, mappedL6, 6);
  drawData2(intensity7, intensityc7, mappedK7, mappedH7, mappedL7, 7);
  drawData2(intensity8, intensityc8, mappedK8, mappedH8, mappedL8, 8);
  drawData2(intensity9, intensityc9, mappedK9, mappedH9, mappedL9, 9);
  drawData2(intensity10, intensityc10, mappedK10, mappedH10, mappedL10, 10);
  drawData2(intensity11, intensityc11, mappedK11, mappedH11, mappedL11, 11);
  drawData2(intensity12, intensityc12, mappedK12, mappedH12, mappedL12, 12);
  drawData2(intensity13, intensityc13, mappedK13, mappedH13, mappedL13, 13);
  drawData2(intensity14, intensityc14, mappedK14, mappedH14, mappedL14, 14);
  drawData2(intensity15, intensityc15, mappedK15, mappedH15, mappedL15, 15);
  drawData2(intensity16, intensityc16, mappedK16, mappedH16, mappedL16, 16);
  drawData2(intensity17, intensityc17, mappedK17, mappedH17, mappedL17, 17);
  drawData2(intensity18, intensityc18, mappedK18, mappedH18, mappedL18, 18);
  drawData2(intensity19, intensityc19, mappedK19, mappedH19, mappedL19, 19);
  drawData2(intensity20, intensityc20, mappedK20, mappedH20, mappedL20, 20);
  drawData2(intensity21, intensityc21, mappedK21, mappedH21, mappedL21, 21);
  drawData2(intensity22, intensityc22, mappedK22, mappedH22, mappedL22, 22);
  drawData2(intensity23, intensityc23, mappedK23, mappedH23, mappedL23, 23);
  drawData2(intensity24, intensityc24, mappedK24, mappedH24, mappedL24, 24);
  drawData2(intensity25, intensityc25, mappedK25, mappedH25, mappedL25, 25);
  drawData2(intensity26, intensityc26, mappedK26, mappedH26, mappedL26, 26);
  
}
void drawBySlider(){
  if(energy1 == 20){
    drawData(intensity, intensityc, mappedK, mappedH, mappedL, 1);
  } else if(energy1 == 21){
      drawData(intensity2, intensityc2, mappedK2, mappedH2, mappedL2, 2);
  } else if(energy1 == 22){
      drawData(intensity3, intensityc3, mappedK3, mappedH3, mappedL3, 3);
  } else if(energy1 == 23){
      drawData(intensity4, intensityc4, mappedK4, mappedH4, mappedL4, 4);
  } else if(energy1 == 24){
      drawData(intensity5, intensityc5, mappedK5, mappedH5, mappedL5, 5);
  } else if(energy1 == 25){
      drawData(intensity6, intensityc6, mappedK6, mappedH6, mappedL6, 6);
  } else if(energy1 == 26){
      drawData(intensity7, intensityc7, mappedK7, mappedH7, mappedL7, 7);
  } else if(energy1 == 27){
      drawData(intensity8, intensityc8, mappedK8, mappedH8, mappedL8, 8);
  } else if(energy1 == 28){
      drawData(intensity9, intensityc9, mappedK9, mappedH9, mappedL9, 9);
  } else if(energy1 == 29){
      drawData(intensity10, intensityc10, mappedK10, mappedH10, mappedL10, 10);
  } else if(energy1 == 30){
      drawData(intensity11, intensityc11, mappedK11, mappedH11, mappedL11, 11);
  } else if(energy1 == 31){
      drawData(intensity12, intensityc12, mappedK12, mappedH12, mappedL12, 12);
  } else if(energy1 == 32){
      drawData(intensity13, intensityc13, mappedK13, mappedH13, mappedL13, 13);
  } else if(energy1 == 33){
      drawData(intensity14, intensityc14, mappedK14, mappedH14, mappedL14, 14);
  } else if(energy1 == 34){
      drawData(intensity15, intensityc15, mappedK15, mappedH15, mappedL15, 15);
  } else if(energy1 == 35){
      drawData(intensity16, intensityc16, mappedK16, mappedH16, mappedL16, 16);
  } else if(energy1 == 36){
      drawData(intensity17, intensityc17, mappedK17, mappedH17, mappedL17, 17);
  } else if(energy1 == 37){
      drawData(intensity18, intensityc18, mappedK18, mappedH18, mappedL18, 18);
  } else if(energy1 == 38){
      drawData(intensity19, intensityc19, mappedK19, mappedH19, mappedL19, 19);
  } else if(energy1 == 39){
      drawData(intensity20, intensityc20, mappedK20, mappedH20, mappedL20, 20);
  } else if(energy1 == 40){
      drawData(intensity21, intensityc21, mappedK21, mappedH21, mappedL21, 21);
  } else if(energy1 == 41){
      drawData(intensity22, intensityc22, mappedK22, mappedH22, mappedL22, 22);
  } else if(energy1 == 42){
      drawData(intensity23, intensityc23, mappedK23, mappedH23, mappedL23, 23);
  } else if(energy1 == 43){
      drawData(intensity24, intensityc24, mappedK24, mappedH24, mappedL24, 24);
  } else if(energy1 == 44){
      drawData(intensity25, intensityc25, mappedK25, mappedH25, mappedL25, 25);
  } else if(energy1 == 45){
      drawData(intensity26, intensityc26, mappedK26, mappedH26, mappedL26, 26);
  }
}

void drawBySlider2(){
  if(energy2 == 20){
    drawData(intensity, intensityc, mappedK, mappedH, mappedL, 1);
  } else if(energy2 == 21){
      drawData(intensity2, intensityc2, mappedK2, mappedH2, mappedL2, 2);
  } else if(energy2 == 22){
      drawData(intensity3, intensityc3, mappedK3, mappedH3, mappedL3, 3);
  } else if(energy2 == 23){
      drawData(intensity4, intensityc4, mappedK4, mappedH4, mappedL4, 4);
  } else if(energy2 == 24){
      drawData(intensity5, intensityc5, mappedK5, mappedH5, mappedL5, 5);
  } else if(energy2 == 25){
      drawData(intensity6, intensityc6, mappedK6, mappedH6, mappedL6, 6);
  } else if(energy2 == 26){
      drawData(intensity7, intensityc7, mappedK7, mappedH7, mappedL7, 7);
  } else if(energy2 == 27){
      drawData(intensity8, intensityc8, mappedK8, mappedH8, mappedL8, 8);
  } else if(energy2 == 28){
      drawData(intensity9, intensityc9, mappedK9, mappedH9, mappedL9, 9);
  } else if(energy2 == 29){
      drawData(intensity10, intensityc10, mappedK10, mappedH10, mappedL10, 10);
  } else if(energy2 == 30){
      drawData(intensity11, intensityc11, mappedK11, mappedH11, mappedL11, 11);
  } else if(energy2 == 31){
      drawData(intensity12, intensityc12, mappedK12, mappedH12, mappedL12, 12);
  } else if(energy2 == 32){
      drawData(intensity13, intensityc13, mappedK13, mappedH13, mappedL13, 13);
  } else if(energy2 == 33){
      drawData(intensity14, intensityc14, mappedK14, mappedH14, mappedL14, 14);
  } else if(energy2 == 34){
      drawData(intensity15, intensityc15, mappedK15, mappedH15, mappedL15, 15);
  } else if(energy2 == 35){
      drawData(intensity16, intensityc16, mappedK16, mappedH16, mappedL16, 16);
  } else if(energy2 == 36){
      drawData(intensity17, intensityc17, mappedK17, mappedH17, mappedL17, 17);
  } else if(energy2 == 37){
      drawData(intensity18, intensityc18, mappedK18, mappedH18, mappedL18, 18);
  } else if(energy2 == 38){
      drawData(intensity19, intensityc19, mappedK19, mappedH19, mappedL19, 19);
  } else if(energy2 == 39){
      drawData(intensity20, intensityc20, mappedK20, mappedH20, mappedL20, 20);
  } else if(energy2 == 40){
      drawData(intensity21, intensityc21, mappedK21, mappedH21, mappedL21, 21);
  } else if(energy2 == 41){
      drawData(intensity22, intensityc22, mappedK22, mappedH22, mappedL22, 22);
  } else if(energy2 == 42){
      drawData(intensity23, intensityc23, mappedK23, mappedH23, mappedL23, 23);
  } else if(energy2 == 43){
      drawData(intensity24, intensityc24, mappedK24, mappedH24, mappedL24, 24);
  } else if(energy2 == 44){
      drawData(intensity25, intensityc25, mappedK25, mappedH25, mappedL25, 25);
  } else if(energy2 == 45){
      drawData(intensity26, intensityc26, mappedK26, mappedH26, mappedL26, 26);
  }
}

void drawData2(FloatList intensitylist, FloatList colorList, FloatList klist, FloatList hlist, FloatList llist, int e){
  pushMatrix();
 
  for(int i =0; i< intensitylist.size(); i++){
      int energyLevel = 20 + (e-1);
     
      if(energyLevel >= energyThreshold || (colorList.get(i) <= intensityMax && colorList.get(i) >= intensityMin)){
         float angle = map(e, 1, 26, 10, 350);
         drawRect(intensitylist.get(i), klist.get(i), hlist.get(i), llist.get(i), angle, e-1);
      }
    } 
  popMatrix();
}
void drawData(FloatList intensitylist, FloatList colorList, FloatList klist, FloatList hlist, FloatList llist, int e){

  pushMatrix();
  
  for(int i =0; i< intensitylist.size(); i++){
      
      if(colorList.get(i) >= intensityMin && colorList.get(i) <= intensityMax){ 
        float angle = map(e, 1, 26, 10, 350);
         drawRect(intensitylist.get(i), klist.get(i), hlist.get(i), llist.get(i), angle, e-1);
      }
  } 
  

  popMatrix();
  
  

}

void drawRect(float size, float k, float h, float l, float energyAngle, int co){
  int mappedI = (int)map(co , 0, 25, 255, 0);
  //fill(rc[co], gc[co], bc[co]);
  fill(255, mappedI, mappedI);
  noStroke();
  stroke(255, mappedI, mappedI);
  strokeWeight(0.2);
  pushMatrix();
  translate(k , l, h);
  rotateX(radians(90));
  rotateY(radians(energyAngle));
  //rotate(rotsped/2);
  rect(0, 0, size, 0.1);
  //box(3);
  popMatrix();

}

void keyPressed(){
  if(keyCode==UP){
    y = y-40;
  } else if(keyCode==DOWN){
    y = y+40;
  } else if(keyCode == LEFT){
    //xpivOld = xpiv;
    x = x-40;
  } else if(keyCode == RIGHT){
    x = x+40; 
  }
  
  zoom = constrain(zoom, 0, 100);
}


void hslice(float value){
  hsliceValue = value;
}

void kslice(float value){
  ksliceValue = value;
}

void lslice(float value){
  lsliceValue = value;
}

void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.isFrom("intensity")) {
    // min and max values are stored in an array.
    // access this array with controller().arrayValue().
    // min is at index 0, max is at index 1.
    intensityMin = (theControlEvent.getController().getArrayValue(0));
    intensityMax = (theControlEvent.getController().getArrayValue(1));
  } 
  
  if(theControlEvent.isFrom("H")) {
    radioButtonH = true;
    radioButtonK = false;
    radioButtonL = false;
  } 
  if(theControlEvent.isFrom("K")){
    radioButtonK = true;
    radioButtonH = false;
    radioButtonL = false;
  }
  if(theControlEvent.isFrom("L")){
    radioButtonK = false;
    radioButtonH = false;
    radioButtonL = true;
  }
  if(theControlEvent.isFrom("EXPORT")){
   saveIncremental("sketch","png");
  } 
}

void drawButton(int a){
  if(a == 1){
    energyEach = true;
    energyAll = false;
    MyController.getController("energy1").show();
    MyController.getController("energy2").show();
    MyController.getController("intensity").show();
    MyController.getController("energyThreshold").hide();
  } else if(a == 2){
    energyAll = true; 
    energyEach = false;
    MyController.getController("energy1").hide();
    MyController.getController("energy2").hide();
    MyController.getController("energyThreshold").show();
    MyController.getController("intensity").show();
  } else{
    energyAll = false;
    energyEach = false;
    MyController.getController("intensity").hide();
    MyController.getController("energyThreshold").hide();
    MyController.getController("energy1").hide();
    MyController.getController("energy2").hide();
  }
}


void loadData(String path, Table data, FloatList klist, FloatList hlist, FloatList llist, FloatList intensity, FloatList intensityColorList){
  //data = loadTable("../fultzViz02/data/2dslice2.csv");
  //data = loadTable("FeGe2_20K_coarse2_volume.csv");
  //Table data = loadTable("../creative2d_4/data/Ihkl-38,39.csv");
  data = loadTable(path);

  for(int i =0; i< data.getRowCount(); i++){

    if(data.getFloat(i, 3) > 0.0015){
      
      float tmpk = data.getFloat(i, 1);
      float tmph = data.getFloat(i, 0);
      float tmpl = data.getFloat(i, 2);
      float tmpi = data.getFloat(i, 3);
      
      klist.append(constrain(map(tmpk, -6, 10, 0, 400), 0, 400)); //x
      hlist.append(constrain(map(tmph, -10, 3, -150, 150), -150, 150)); //z
      //llist.append(constrain(map(tmpl, -10, 50, 2, 30), 2, 30)); //speed  
      llist.append(map(tmpl, -10, 50, 100, -1000));
      intensityColorList.append(tmpi);
      //intensity.append(map(tmpi,0, 0.02, 2, 30));
      intensity.append(map(tmpi, 0, 0.02, 1, 10));

    }
  }

}

// Saves a file with automatically incrementing filename,
// so that existing files are not overwritten. Will 
// function correctly for less than 1000 files.

void saveIncremental(String prefix,String extension) {
  int savecnt=0;
  boolean ok=false;
  String filename="";
  File f;
  
  while(!ok) {
    // Get a correctly configured filename
    filename=prefix;  
    if(savecnt<10) filename+="00";
    else if(savecnt<100) filename+="0";
    filename+=""+savecnt+"."+extension;

    // Check to see if file exists, using the undocumented
    // savePath() to find sketch folder
    f=new File(savePath(filename));
    if(!f.exists()) ok=true; // File doesn't exist
    savecnt++;
  }

  println("Saving "+filename);
  saveFrame(filename);
}
