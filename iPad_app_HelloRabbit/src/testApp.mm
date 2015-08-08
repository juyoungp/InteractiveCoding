/*
 Ju Young Park
 juyoungp88@gmail.com
 April.22.2014
*/
 
#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
	ofRegisterTouchEvents(this);
    //ofSetBackgroundAuto(FALSE);
    ofSetOrientation(OF_ORIENTATION_90_RIGHT);//Set iOS to Orientation Landscape Right
    // touch events will be sent to this object (this instance of testApp)
    //ofxMultiTouch.addListener(this);
    ofBackground(255, 255, 255);
    ofSetFrameRate(150);
    ofEnableAlphaBlending();
    //rabbit.loadImage("new_rabbit_normal.png");
    background.loadImage("story_bg01.jpg");
    teachme.loadImage("teachme2.png");
    logoImg.loadImage("hello_rabbit650px.png");
    carrotImg.loadImage("carrot1.png");
    apple.loadImage("apple.png");
    cloud.loadImage("cloud01.png");
    carrot.loadImage("carrot.png");
    questionmark.loadImage("questionmark.png");
    rabbitFriend1.loadImage("rabbit_friend2.png");
    rabbitFriend2.loadImage("rabbit_friend1.png");
    rabbitFriend3.loadImage("rabbit_friend6.png");
    rabbitFriend4.loadImage("rabbit_friend4.png");
    rabbitFriend5.loadImage("rabbit_friend5.png");
    rabbitFriend6.loadImage("rabbit_friend3.png");
    endRabbit2.loadImage("rabbit_friend3.png");
    endRabbit1.loadImage("pink-smile.png");
    endRabbit3.loadImage("blue-smile.png");
    thankyou.loadImage("thank-you.png");
    leftBtn.loadImage("left-carrot.png");
    rightBtn.loadImage("right-carrot.png");
    carrotBtn.loadImage("carrot-150px.png");
    story.loadFont("DK Crayon Crumble.ttf", 30);
    page.loadFont("Arial Bold.ttf", 18);
    xval.loadFont("DK Crayon Crumble.ttf", 26);
    yval.loadFont("DK Crayon Crumble.ttf", 26);
    gridX.loadFont("DK Crayon Crumble.ttf", 20);
    gridY.loadFont("DK Crayon Crumble.ttf", 20);
    next.loadFont("DK Crayon Crumble.ttf", 24);

    nextPressed = 0;
    rabbitX = ofGetWidth()/2-60;
    rabbitY = ofGetHeight()/2;
    rabbitF1X = ofGetWidth();
    rabbitF1Y = ofGetHeight()/2;
    rabbitF2X = ofGetWidth();
    rabbitF2Y = ofGetHeight()/2;
    rabbitF3X = -120;
    rabbitF3Y = ofGetHeight()/2;
    
    
    rabbitF11X =150;
    rabbitF22X =250;
    rabbitF33X =100;
    rabbitF11Y =ofGetHeight()/2 - 30;
    rabbitF22Y =ofGetHeight()/2;
    rabbitF33Y =ofGetHeight()/2+50;
    rabbitFY = 360;
    rabbitFY2 = 350;
    rabbitFY3 = 355;

    c = 255;
    speedY = 2.0;
    speedY2 = 2.0;
    speedY3 = 2.0;
    xspeed = 2.8;
    yspeed = 8.0;
    yspeed4 = 4.0;
    yspeed5 = 5.0;
    yspeed6 = 6.0;
    yspeed7 = 7.0;
    yspeed9 = 9.0;
    yspeed10 = 10.0;
    yspeed11 = 11.0;
    yspeed12 = 12.0;
    yspeed13 = 14.0;
    xdirection = 1;
    ydirection = 1;
    fydirection = 1;
    fydirection2 = 1;
    fydirection3 = 1;
    cloudX = 0;
    cloudX2 = ofGetWidth();
    cloudSpeed = 1.5;
    appleNum = 0;

    moveCarrot = false;
    carrotGridX = 174;

}


//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
   
    
    if(nextPressed==0){
        ofBackground(252, 255, 181);
        logo();
        rabbit.loadImage("new_rabbit_smile.png");
    }
    if(nextPressed > 0){
        ofSetColor(255, 255, 255);
        background.draw(0,0, ofGetWidth(), ofGetHeight());
        moveCloud();
        
    }
    
    if(nextPressed > 0 && nextPressed < 16){
        //moveCloud();
        ofPushMatrix();
        rightBtn.draw(ofGetWidth()-150, 50);
        ofPopMatrix();
        rabbit.loadImage("new_rabbit_normal.png");
        
        
        
    }
    
    if(nextPressed > 5){
        
        //moveCloud();
        ofPushMatrix();
        leftBtn.draw(150, 50);
        ofPopMatrix();
        rabbit.loadImage("new_rabbit_normal.png");
        
        
        
    }
    

    if(nextPressed==1){
        
        pageZeroZeroZero();
        
    } else if(nextPressed == 2){
        pageZeroZero();
        jumpingRabbits();
    }
    
    else if(nextPressed == 3){
        chaseRabbits();
        pageZero();
        if(backRs){
            backRabbits();
            rabbit.loadImage("crying_rabbit.png");
        }
        
    } else if(nextPressed == 4){
        backRs = false;
        chaseBack();
        rabbit.loadImage("crying_rabbit.png");
        pageStart();
    } else if(nextPressed == 5){
        rabbit.loadImage("new_rabbit_normal.png");
        pageOne();
    } else if(nextPressed == 6){
        pageTwo();
    } else if(nextPressed == 7){
        if(happyRabbit){
            rabbit.loadImage("new_rabbit_smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
        }
        pageThree();
    } else if(nextPressed == 8){
        if(happyRabbit){
            rabbit.loadImage("new_rabbit_smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
        }
        pageFour();
    } else if(nextPressed == 9){
        if(happyRabbit){
            rabbit.loadImage("new_rabbit_smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
        }
        pageFive();
    } else if(nextPressed == 10){
        pageSix();
        
    } else if(nextPressed == 11){
        if(happyRabbit){
            rabbit.loadImage("rabbit_apple_smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
        }
        pageSeven();
    } else if(nextPressed == 12){
        if(happyRabbit){
            rabbit.loadImage("rabbit_apple_smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
        }
        pageEight();
    } else if(nextPressed == 13){
        pageNine();
        
    } else if(nextPressed == 14){
        if(happyRabbit){
            rabbit.loadImage("smile-rabbit-none-holding.png");
            rabbitFriend4.loadImage("pink-smile.png");
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
            rabbitFriend4.loadImage("rabbit_friend4.png");
        }
        pageTen();
        
    } else if(nextPressed == 15){
        if(happyRabbit){
            rabbit.loadImage("smile-rabbit-none-holding.png");
            if(friend1happy) {
            rabbitFriend4.loadImage("pink-smile.png");
            } else {
                rabbitFriend4.loadImage("rabbit_friend4.png");
            }
            if(friend2happy){
                rabbitFriend2.loadImage("blue-smile.png");
            } else {
                rabbitFriend2.loadImage("rabbit_friend1.png");

            }
            
        } else {
            rabbit.loadImage("new_rabbit_normal.png");
            rabbitFriend4.loadImage("rabbit_friend4.png");
            rabbitFriend2.loadImage("rabbit_friend1.png");
        }
        pageEleven();
        
    } else if(nextPressed == 16){
        rabbit.loadImage("smile-rabbit-none-holding.png");
        ending();
    }


    ofPushMatrix();
    ofSetColor(255, 255, 255);
    rabbit.draw(rabbitX, rabbitY);
    ofPopMatrix();
    
    
    
    if(moveRabbitX && page_01){
        moveRabbit(rabbitNum, 1);
    } else if(moveRabbitY && page_02){
        moveRabbit(rabbitNum, 2);
    } else if(moveRabbitX && page_03){
        moveRabbit(rabbitNum, 3);
    } else if(moveRabbitX && page_04){
        moveRabbit(rabbitNum, 3);
    } else if(moveRabbitX && page_05){
        moveRabbit(rabbitNum, 4);
    } else if(page_06){
        moveRabbit(rabbitNum, 5);
    } else if(moveRabbitY && page_07){
        moveRabbit(rabbitNum, 6);
    } else if(moveRabbitY && page_08){
        moveRabbit(rabbitNum, 6);
    } else if(page_09){
        moveRabbit(rabbitNum, 7);
    } else if(page_10){
        moveRabbit(rabbitNum, 8);
    } else if(page_11){
        moveRabbit(rabbitNum, 9);
    }
    


	
}
//--------------------------------------------------------------
void testApp::moveCloud(){
    cloudX = cloudX + cloudSpeed;
    cloudX2--;
    if(cloudX > ofGetWidth()){
        
        cloudX = 0;
    }
    
    if(cloudX2 < 0){
        cloudX2 = ofGetWidth();
    }
    
    
    cloud.draw(cloudX, 50);
    cloud.draw(cloudX2, 150);
}


//--------------------------------------------------------------
void testApp::moveRabbit(int x, int page){
    if(page == 1){

        if(x != 11) rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);

    } else if(page == 2){
        if(x != 11){
            if (x == 0) rabbitY = 324;
            else if(x == 1 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed7 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 230){
                    rabbitY = 324;
                    jumpRabbit = false;
                    ydirection = 1;
                }
                
            } else if(x == 2 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed9 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 137){
                    rabbitY = 324;
                    jumpRabbit = false;
                    ydirection = 1;
                }
                
            } else if(x == 3 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed10 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 43){
                    rabbitY = 324;
                    jumpRabbit = false;
                    ydirection = 1;
                }
                
            } else if(x == 4 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed11 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < -50){
                    rabbitY = 324;
                    jumpRabbit = false;
                    ydirection = 1;
                }
                
            }

        }
    } else if(page == 3){
        if(x != 11) rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);
        
        if(x==3) happyRabbit = true;
        else happyRabbit = false;
        
        if(jumpRabbit){
            
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            

        } else rabbitY = 324;
        
    } else if(page == 4){
        if(x != 11) rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);
        
        if(carrotX == -15 && jumpRabbit == true && rabbitNum == 0){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 77 && jumpRabbit == true && rabbitNum == 1){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 174 && jumpRabbit == true && rabbitNum == 2){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 277 && jumpRabbit == true && rabbitNum == 3){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 379 && jumpRabbit == true && rabbitNum == 4){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 477 && jumpRabbit == true && rabbitNum == 5){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 584 && jumpRabbit == true && rabbitNum == 6){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 694 && jumpRabbit == true && rabbitNum == 7){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 796 && jumpRabbit == true && rabbitNum == 8){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 898 && jumpRabbit == true && rabbitNum == 9){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else if(carrotX == 1000 && jumpRabbit == true && rabbitNum == 10){
            happyRabbit = true;
            rabbitY = rabbitY + (yspeed * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                jumpRabbit = false;
                ydirection = 1;
            }
            
        } else happyRabbit = false;
        
    } else if(page == 5){
        
        if(x != 11){
            rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);
            if(jumpRabbit){
                rabbitY = rabbitY + (yspeed * ydirection);
            
                if(rabbitY > ofGetHeight()/2-60){
                    ydirection = -1;
                } else if(rabbitY < 220){
                    rabbitY = 324;
                    jumpRabbit = false;
                    ydirection = 1;
                }
            }
        }
        
    } else if(page == 6){
        if(x != 11){
            if (x == 0) rabbitY = 324;
            else if(x == 1 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed9 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 230){
                    rabbitY = 324;
                    jumpRabbit = false;
                    happyRabbit = false;
                    ydirection = 1;
                }
                
            } else if(x == 2 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed11 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 137){
                    rabbitY = 324;
                    jumpRabbit = false;
                    happyRabbit = true;
                    ydirection = 1;
                }
                
            } else if(x == 3 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed12 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < 43){
                    rabbitY = 324;
                    jumpRabbit = false;
                    happyRabbit = true;
                    ydirection = 1;
                }
                
            } else if(x == 4 && jumpRabbit) {
                rabbitY = rabbitY + (yspeed13 * ydirection);
                
                if(rabbitY > 324){
                    ydirection = -1;
                } else if(rabbitY < -50){
                    rabbitY = 324;
                    jumpRabbit = false;
                    happyRabbit = true;
                    ydirection = 1;
                }
                
            }
            
        }
    } else if(page == 7){
        
        if(jumpRabbit){
            
            rabbitY = rabbitY + (yspeed4 * ydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 220){
                rabbitY = 324;
                //jumpRabbit = false;
                ydirection = 1;
            }
            
            
        } else rabbitY = 324;
        
    } else if(page == 8){
        if(x != 11) rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);
        
        if( x == 0 || x == 1 || x == 2 ) happyRabbit = true;
        else happyRabbit = false;
        
        if(jumpRabbit){
            
            rabbitY = rabbitY + (yspeed5 * ydirection);
            
            rabbitFY = rabbitFY + (yspeed5 * fydirection);
            
            if(rabbitY > ofGetHeight()/2-60){
                ydirection = -1;
            } else if(rabbitY < 260){
                rabbitY = 324;
                //jumpRabbit = false;
                ydirection = 1;
            }
            
            if(rabbitFY > ofGetHeight()/2-60){
                fydirection = -1;
            } else if(rabbitFY < 260){
                rabbitFY = 360;
                //jumpRabbit = false;
                fydirection = 1;
            }
            
            
        } else {
            rabbitY = 324;
            rabbitFY = 360;
            
        }
        
    } else if(page == 9){
        if(x != 11) rabbitX = ofMap(x, 0, 9, 0, ofGetWidth()-110);
        
        if( x == 0 || x == 1 || x == 2 ){
            happyRabbit = true;
            friend2happy = false;
            friend1happy = true;
            rabbitFY2 = 350;
            rabbitFY3 = 355;
            if(jumpRabbit){
                
                rabbitY = rabbitY + (yspeed5 * ydirection);
                
                rabbitFY = rabbitFY + (yspeed5 * fydirection);
                
                if(rabbitY > ofGetHeight()/2-60){
                    ydirection = -1;
                } else if(rabbitY < 260){
                    rabbitY = 324;
                    //jumpRabbit = false;
                    ydirection = 1;
                }
                
                if(rabbitFY > ofGetHeight()/2-60){
                    fydirection = -1;
                } else if(rabbitFY < 260){
                    rabbitFY = 360;
                    //jumpRabbit = false;
                    fydirection = 1;
                }
                
            }
        } else if( x == 9 ){
            happyRabbit = true;
            friend2happy = true;
            friend1happy = false;
            rabbitFY = 360;
            rabbitFY3 = 355;
            if(jumpRabbit){
                
                rabbitY = rabbitY + (yspeed5 * ydirection);
                
                rabbitFY2 = rabbitFY2 + (yspeed5 * fydirection);
                
                if(rabbitY > ofGetHeight()/2-60){
                    ydirection = -1;
                } else if(rabbitY < 260){
                    rabbitY = 324;
                    //jumpRabbit = false;
                    ydirection = 1;
                }
                
                if(rabbitFY2 > ofGetHeight()/2-60){
                    fydirection = -1;
                } else if(rabbitFY2 < 260){
                    rabbitFY2 = 350;
                    //jumpRabbit = false;
                    fydirection = 1;
                }
                
                
            }
        } else if( x == 6 || x == 7 ){
            happyRabbit = true;
            friend2happy = false;
            friend1happy = false;
            rabbitFY = 360;
            rabbitFY2 = 350;
            if(jumpRabbit){
                
                rabbitY = rabbitY + (yspeed5 * ydirection);
                
                rabbitFY3 = rabbitFY3 + (yspeed5 * fydirection);
                
                if(rabbitY > ofGetHeight()/2-60){
                    ydirection = -1;
                } else if(rabbitY < 260){
                    rabbitY = 324;
                    //jumpRabbit = false;
                    ydirection = 1;
                }
                
                if(rabbitFY3 > ofGetHeight()/2-60){
                    fydirection = -1;
                } else if(rabbitFY3 < 260){
                    rabbitFY3 = 355;
                    //jumpRabbit = false;
                    fydirection = 1;
                }
                
                
            }
        } else if(x == 8){
            happyRabbit = true;
            friend2happy = true;
            friend1happy = false;
            rabbitFY = 360;
            if(jumpRabbit){
                
                rabbitY = rabbitY + (yspeed5 * ydirection);
                
                rabbitFY2 = rabbitFY2 + (yspeed5 * fydirection);
                
                rabbitFY3 = rabbitFY3 + (yspeed5 * fydirection);
                
                if(rabbitY > ofGetHeight()/2-60){
                    ydirection = -1;
                } else if(rabbitY < 260){
                    rabbitY = 324;
                    //jumpRabbit = false;
                    ydirection = 1;
                }
                
                if(rabbitFY2 > ofGetHeight()/2-60){
                    fydirection = -1;
                } else if(rabbitFY3 < 260){
                    rabbitFY2 = 350;
                    //jumpRabbit = false;
                    fydirection = 1;
                }

                
                if(rabbitFY3 > ofGetHeight()/2-60){
                    fydirection = -1;
                } else if(rabbitFY3 < 260){
                    rabbitFY3 = 355;
                    //jumpRabbit = false;
                    fydirection = 1;
                }
                
                
            }

            
        } else {
            happyRabbit = false;
            jumpRabbit = false;
            friend2happy = false;
            friend1happy = false;
            rabbitY = 324;
            rabbitFY = 360;
            rabbitFY2 = 350;
            rabbitFY3 = 355;
            
        }

    }
    
}

//--------------------------------------------------------------
void testApp::logo(){
    
    rabbitY = rabbitY + speedY;
    
    if (rabbitY > ofGetHeight()/2-120) {

        rabbitY= ofGetHeight()/2-120;

        speedY = speedY * -1;

    }
    else if (rabbitY <= 200) {

        speedY = -speedY;
    }
    
    ofPushMatrix();
    logoImg.draw(ofGetWidth()/2-330, ofGetHeight()/2+60);
    ofPopMatrix();

}
//--------------------------------------------------------------
void testApp::chaseRabbits(){
    if(rabbitX > 280){
        rabbitX = rabbitX - 2;
    }
    
    else{
        backRs = true;
        
    }
    
}
//--------------------------------------------------------------
void testApp::chaseBack(){
    if(rabbitX < ofGetWidth()/2){
        rabbitX = rabbitX + 4;
    } else{
        teachme.draw(rabbitX+70, ofGetHeight()/2-80);
    }
    
}
//--------------------------------------------------------------
void testApp::backRabbits(){
        
    if (rabbitF11Y > ofGetHeight()/2 -30) {
            
        rabbitF11Y= ofGetHeight()/2 - 30;
            
        speedY = speedY * -1;
            
    }
    else if (rabbitF11Y <= 300) {
            
        speedY = -speedY;
    }
        
    if (rabbitF22Y > ofGetHeight()/2) {
            
        rabbitF22Y= ofGetHeight()/2;
            
        speedY2 = speedY2 * -1;
            
    }
    else if (rabbitF22Y <= 300) {
            
        speedY2 = -speedY2;
    }
        
    if (rabbitF33Y > ofGetHeight()/2 +50) {
            
        rabbitF33Y= ofGetHeight()/2 +50;
            
        speedY3 = speedY3 * -1;
            
    }
    else if (rabbitF33Y <= 300) {
            
        speedY3 = -speedY3;
    }
        
        
    if(rabbitF11X < 0){
        rabbitF11X = -200;
        rabbitF11Y = 0;
            
            
    } else{
        rabbitF11X = rabbitF11X - 1.5;
        rabbitF11Y = rabbitF11Y + speedY;
            
    }
        
    if(rabbitF22X < 0){
        rabbitF22X = -200;
        rabbitF22Y = 0;
    } else{
        rabbitF22X = rabbitF22X - 1;
        rabbitF22Y = rabbitF22Y + speedY2;
            
    }
        
    if(rabbitF33X < 0){
        rabbitF33X = -200;
        rabbitF33Y = 0;
    } else{
        rabbitF33X = rabbitF33X - 1;
        rabbitF33Y = rabbitF33Y + speedY3;
            
    }
}
//--------------------------------------------------------------
void testApp::jumpingRabbits(){
    
    if (rabbitF1Y > ofGetHeight()/2) {
        
        rabbitF1Y= ofGetHeight()/2;
        
        speedY = speedY * -1;
        
    }
    else if (rabbitF1Y <= 300) {
        
        speedY = -speedY;
    }
    
    if (rabbitF2Y > ofGetHeight()/2) {
        
        rabbitF2Y= ofGetHeight()/2;
        
        speedY2 = speedY2 * -1;
        
    }
    else if (rabbitF2Y <= 300) {
        
        speedY2 = -speedY2;
    }
    
    if (rabbitF3Y > ofGetHeight()/2) {
        
        rabbitF3Y= ofGetHeight()/2;
        
        speedY3 = speedY3 * -1;
        
    }
    else if (rabbitF3Y <= 300) {
        
        speedY3 = -speedY3;
    }
    
    
    
    if(rabbitF1X < 0){
        rabbitF1X = -200;
        rabbitF1Y = 0;

        
    } else{
        rabbitF1X = rabbitF1X - 1.5;
        rabbitF1Y = rabbitF1Y + speedY;
        
    }
    
    if(rabbitF2X < 0){
        rabbitF2X = -200;
        rabbitF2Y = 0;
    } else{
        rabbitF2X = rabbitF2X - 1;
        rabbitF2Y = rabbitF2Y + speedY2;
        
    }
    
    if(rabbitF3X > ofGetWidth()){
        rabbitF3X = ofGetWidth() + 200;
        rabbitF3Y = 0;
    } else{
        rabbitF3X = rabbitF3X + 1;
        rabbitF3Y = rabbitF3Y + speedY3;
        
    }
    

    

    
}
//--------------------------------------------------------------
void testApp::pageZeroZeroZero(){

    ofSetColor(255);
    
    story.drawString("Once upon a time, there was ", 30, ofGetHeight()/2+260);
    story.drawString("one special Rabbit in rabbit village.", 30, ofGetHeight()/2+300);
        

    
    
    rabbitX = ofGetWidth()/2;
    rabbitY = ofGetHeight()/2;
    
    
}

//--------------------------------------------------------------
void testApp::pageZeroZero(){
    
    ofSetColor(255);
    story.drawString("While other rabbits loved to hop around, ", 30, ofGetHeight()/2+260);
    story.drawString("This rabbit was afraid of hopping.", 30, ofGetHeight()/2+300);
    

    
    ofPushMatrix();
    ofSetColor(255);
    rabbitFriend1.draw(rabbitF1X, rabbitF1Y);
    rabbitFriend2.draw(rabbitF2X, rabbitF2Y);
    rabbitFriend3.draw(rabbitF3X, rabbitF3Y);
    ofPopMatrix();
    
    ofPushMatrix();
    ofSetColor(255);
    questionmark.draw(rabbitX+60, rabbitY-80);
    ofPopMatrix();
   
}

//--------------------------------------------------------------
void testApp::pageZero(){
    
    ofSetColor(255);
    story.drawString("No other rabbit played with him, so ", 30, ofGetHeight()/2+260);
    story.drawString("this rabbit was always alone and lonely.", 30, ofGetHeight()/2+300);
    
    ofPushMatrix();
    ofSetColor(255);
    rabbitFriend3.draw(rabbitF11X, rabbitF11Y);
    rabbitFriend4.draw(rabbitF22X, rabbitF22Y);
    rabbitFriend5.draw(rabbitF33X, rabbitF33Y);
    ofPopMatrix();
    


    
    
}
//--------------------------------------------------------------
void testApp::pageStart(){
    
    ofSetColor(255);
    story.drawString("Rabbit didn't want to be alone anymore! ", 30, ofGetHeight()/2+260);
    story.drawString("He wanted to hop around with friends.", 30, ofGetHeight()/2+300);
    
}
//--------------------------------------------------------------
void testApp::pageOne(){
    drawXgrid();
    page_01 = true;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();

    story.drawString("Rabbit wants to practice running back and forth first!", 30, ofGetHeight()/2+260);
    //ofPopMatrix();
    
    //ofPushMatrix();
    //ofSetColor(255, 0, 0);
    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+320);

    ofPopMatrix();
    
    drawXkeys();
    
    
}

//--------------------------------------------------------------
void testApp::pageTwo(){
    drawYgrid();
    rabbitX = ofGetWidth()/2;
    page_01 = false;
    page_03 = false;
    page_04 = false;
    page_02 = true;
    
    ofPushMatrix();
    ofSetColor(255,255,255);
    ofNoFill();
    
    story.drawString("Rabbit wishes to see how high he can hop.", 30, ofGetHeight()/2+200);

    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+260);
    
    ofPopMatrix();
    
    drawYkeys();
    
    
}
//--------------------------------------------------------------
void testApp::pageThree(){
    
    drawXgrid();
    page_02 = false;
    page_03 = true;
    page_01 = false;
    page_04 = false;
    
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("Rabbit learns first hopping! If he gets carrot, he can hop once.", 30, ofGetHeight()/2+260);
    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+320);
    
    ofPopMatrix();
    
    if(!happyRabbit){
        ofPushMatrix();
        carrot.draw(320, ofGetHeight()/2+100);
        ofPopMatrix();
    }

    
    
    drawXkeys();
    
}
//--------------------------------------------------------------
void testApp::pageFour(){
    
    drawXgrid();
    page_02 = false;
    page_03 = true;
    page_01 = false;
    page_04 = true;
    
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("If he is at number 3, he can hop once.", 30, ofGetHeight()/2+260);
    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+320);
    
    ofPopMatrix();
    
    if(!happyRabbit){
        ofPushMatrix();
        carrot.draw(320, ofGetHeight()/2+100);
        ofPopMatrix();
    }
    
    
    
    drawXkeys();
    
}

//--------------------------------------------------------------
void testApp::pageFive(){
    
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = true;
    
    
    drawXgrid();
    drawCarrotSlide(carrotGridX);
    ofNoFill();
    
    story.drawString("Let him learn hopping at other positions.", 30, ofGetHeight()/2+290);
    page.drawString("Move the white carrot!   Touch number key to move him around.", 50, ofGetHeight()/2+350);
    //story.drawString("slider to move carrot, and let him get the rabbit!", 30, ofGetHeight()/2+320);
    //page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+360);
    ofPopMatrix();
    
    if(moveCarrot) {
        if(!happyRabbit){
            carrot.draw(carrotX+50, ofGetHeight()/2+100);
        }
        /*
        if(mouseY > ofGetHeight()/2+220 && mouseY < ofGetHeight()/2+280){
            carrotGridX = mouseX;
            
        }
        */
        
    } else {
        carrotX = 174;
        carrot.draw(carrotX+50, ofGetHeight()/2+100);
        
    }
    
    drawXkeys();
    

}
//--------------------------------------------------------------
void testApp::pageSix(){
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = true;
    
    story.drawString("Let him hop by himself at anywhere!", 30, ofGetHeight()/2+200);
    
    page.drawString("Touch the carrot!", 50, ofGetHeight()/2+260);
    
    carrotBtn.draw(ofGetWidth()/2-150, ofGetHeight()/2+200);
    
    
}
//--------------------------------------------------------------
void testApp::pageSeven(){
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = true;
    
    drawYgrid();
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("Let him hop higher so he can get an apple from tree!", 30, ofGetHeight()/2+200);
    //story.drawString("Let rabbit hop higher to get an apple!", 30, ofGetHeight()/2+240);
    page.drawString("Touch number key to let him hop higher.", 50, ofGetHeight()/2+260);
    
    ofPopMatrix();
    
    //if(!happyRabbit){
        ofPushMatrix();
        apple.draw(550, ofGetHeight()/2-140);
        ofPopMatrix();
    //}
    drawYkeys();
    
    
}
//--------------------------------------------------------------
void testApp::pageEight(){
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = false;
    page_08 = true;
    
    drawYgrid();
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("If rabbit hops at number 2, 3, or 4, he can get an apple!", 30, ofGetHeight()/2+200);
    //story.drawString("Let rabbit hop higher to get an apple!", 30, ofGetHeight()/2+240);
    page.drawString("Touch number key to let him hop higher.", 50, ofGetHeight()/2+260);
    
    ofPopMatrix();
    
    //if(!happyRabbit){
    ofPushMatrix();
    apple.draw(550, ofGetHeight()/2-140);
    ofPopMatrix();
    //}
    drawYkeys();
    
    
}


//--------------------------------------------------------------
void testApp::pageNine(){
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = false;
    page_08 = false;
    page_09 = true;
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("Let him learn hopping many times!", 30, ofGetHeight()/2+200);
    story.drawString("He can hop many times, while there are more than 3 apples!", 30, ofGetHeight()/2+240);
    page.drawString("Touch tree to make apple. Double touch tree to fall apple.", 50, ofGetHeight()/2+300);
    
    ofPopMatrix();
    
    drawApple();
    
    if(apple0Y == ofGetHeight()/2-140){
        apple0Ctr = 1;
        
    } else {
        apple0Ctr = 0;
    }
    if(apple1Y == ofGetHeight()/2-140){
        apple1Ctr = 1;
        
    } else{
        apple1Ctr = 0;
    }
    if(apple2Y == ofGetHeight()/2-140){
        apple2Ctr = 1;
    } else{
        apple2Ctr = 0;
    }
    if(apple3Y == ofGetHeight()/2-140){
        apple3Ctr = 1;
    } else{
        apple3Ctr = 0;
    }
    if(apple4Y == ofGetHeight()/2-140){
        apple4Ctr = 1;
    } else{
        apple4Ctr = 0;
    }
    if(apple5Y == ofGetHeight()/2-140){
        apple5Ctr = 1;
    } else{
        apple5Ctr = 0;
    }
    if(apple6Y == ofGetHeight()/2-140){
        apple6Ctr = 1;
    } else{
        apple6Ctr = 0;
    }
    
    appleNum = apple0Ctr + apple1Ctr + apple2Ctr + apple3Ctr + apple4Ctr + apple5Ctr + apple6Ctr;
    if(appleNum>=4){
        jumpRabbit = true;
    } else{
        jumpRabbit = false;
    }
}
//--------------------------------------------------------------
void testApp::pageTen(){
    drawXgrid();
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = false;
    page_08 = false;
    page_09 = false;
    page_10 = true;
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("Rabbit is ready to make friends now!", 30, ofGetHeight()/2+260);
    story.drawString("Let him go to the other rabbit so they can hop together!", 30, ofGetHeight()/2+300);
    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+360);
    
    ofPopMatrix();

    ofPushMatrix();
    rabbitFriend4.draw(100, rabbitFY);
    ofPopMatrix();
    
    drawXkeys();

    
}
//--------------------------------------------------------------
void testApp::pageEleven(){
    drawXgrid();
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = false;
    page_08 = false;
    page_09 = false;
    page_10 = false;
    page_11 = true;
    
    ofPushMatrix();
    ofSetColor(255, 255, 255);
    ofNoFill();
    
    story.drawString("Go to other rabbits and hop with them, too!", 30, ofGetHeight()/2+260);
    page.drawString("Touch number key to move him around.", 50, ofGetHeight()/2+320);
    
    ofPopMatrix();
    
    ofPushMatrix();
    rabbitFriend4.draw(100, rabbitFY);
    ofPopMatrix();
    
    ofPushMatrix();
    rabbitFriend2.draw(ofGetWidth()-120, rabbitFY2);
    ofPopMatrix();
    
    ofPushMatrix();
    rabbitFriend6.draw(ofGetWidth()-320, rabbitFY3);
    ofPopMatrix();

    
    drawXkeys();

    
}
//--------------------------------------------------------------
void testApp::ending(){
    page_01 = false;
    page_02 = false;
    page_03 = false;
    page_04 = false;
    page_05 = false;
    page_06 = false;
    page_07 = false;
    page_08 = false;
    page_09 = false;
    page_10 = false;
    page_11 = false;
    rabbitX = ofGetWidth()/2-95;
    
    ofSetColor(255);
    story.drawString("Now the Rabbit can hop with other rabbits,", 30, ofGetHeight()/2+260);
    story.drawString("and, he is not lonely anymore.   -The End-", 30, ofGetHeight()/2+300);
    
    
    
    
    rabbitY = rabbitY + (yspeed4 * ydirection);
    
    if(rabbitY > ofGetHeight()/2-60){
        ydirection = -1;
    } else if(rabbitY < 260){
        //rabbitY = 324;
        ydirection = 1;
    }
    
    rabbitFY = rabbitFY + (yspeed4 * fydirection);
    
    if(rabbitFY > 360){
        fydirection = -1;
    } else if(rabbitFY < 300){
        //rabbitY = 324;
        fydirection = 1;
    }
    
    rabbitFY2 = rabbitFY2 + (yspeed4 * fydirection2);
    
    if(rabbitFY2 > 350){
        fydirection2 = -1;
    } else if(rabbitFY < 300){
        //rabbitY = 324;
        fydirection2 = 1;
    }
    
    rabbitFY3 = rabbitFY3 + (yspeed4 * fydirection3);
    
    if(rabbitFY3 > 355){
        fydirection3 = -1;
    } else if(rabbitFY3 < 300){
        //rabbitY = 324;
        fydirection3 = 1;
    }
    
    ofPushMatrix();
    endRabbit1.draw(rabbitX-100, rabbitFY);
    ofPopMatrix();
    
    ofPushMatrix();
    endRabbit2.draw(rabbitX+100, rabbitFY2);
    ofPopMatrix();
    
    ofPushMatrix();
    endRabbit3.draw(rabbitX+200, rabbitFY3);
    ofPopMatrix();

    ofPushMatrix();
    thankyou.draw(rabbitX+70, ofGetHeight()/2-250);
    ofPopMatrix();

    
    

    
}
//--------------------------------------------------------------
void testApp::drawCarrotSlide(int x){
    
    ofSetColor(255);
    ofLine(0, ofGetHeight()/2+240, ofGetWidth(), ofGetHeight()/2+240);
    carrotImg.draw(x+50, ofGetHeight()/2+225);
    
    ofPushMatrix();

    
}
//--------------------------------------------------------------
void testApp::drawApple(){
    
   
    
    
    if(drawApple0 && !fallApple0){
        apple0Y = ofGetHeight()/2-140;
    }
    if(drawApple1 && !fallApple1){
        apple1Y = ofGetHeight()/2-140;
    }
    if(drawApple2 && !fallApple2){
        apple2Y = ofGetHeight()/2-140;
    }
    if(drawApple3 && !fallApple3){
        apple3Y = ofGetHeight()/2-140;
    }
    if(drawApple4 && !fallApple4){
        apple4Y = ofGetHeight()/2-140;
    }
    if(drawApple5 && !fallApple5){
        apple5Y = ofGetHeight()/2-140;
    }
    if(drawApple6 && !fallApple6){
        apple6Y = ofGetHeight()/2-140;
    }
    
    if(fallApple0){
        fall(0);
    }
    if(fallApple1){
        fall(1);
    }
    if(fallApple2){
        fall(2);
    }
    if(fallApple3){
        fall(3);
    }
    if(fallApple4){
        fall(4);
    }
    if(fallApple5){
        fall(5);
    }
    if(fallApple6){
        fall(6);
    }
    
    if(drawApple0){
        apple.draw(10, apple0Y);
    }
    if(drawApple1){
        apple.draw(160, apple1Y);
    }
    if(drawApple2){
        apple.draw(300, apple2Y);
    }
    if(drawApple3){
        apple.draw(460, apple3Y);
    }
    if(drawApple4){
        apple.draw(590, apple4Y);
    }
    if(drawApple5){
        apple.draw(730, apple5Y);
    }
    if(drawApple6){
        apple.draw(880, apple6Y);
        
    }
    
    
}
//--------------------------------------------------------------
void testApp::fall(int x){
    if(x==0){
        if(apple0Y< ofGetHeight()){
            apple0Y += 8;
        } else{
            fallApple0 = false;
            drawApple0 = false;
        }
    } else if(x==1){
        if(apple1Y< ofGetHeight()){
            apple1Y += 8;
        } else{
            fallApple1 = false;
            drawApple1 = false;
        }
    } else if(x==2){
        if(apple2Y< ofGetHeight()){
            apple2Y += 8;
        } else{
            fallApple2 = false;
            drawApple2 = false;
        }
    } else if(x==3){
        if(apple3Y< ofGetHeight()){
            apple3Y += 8;
        } else{
            fallApple3 = false;
            drawApple3 = false;
        }
    } else if(x==4){
        if(apple4Y< ofGetHeight()){
            apple4Y += 8;
        } else{
            fallApple4 = false;
            drawApple4 = false;
        }
    } else if(x==5){
        if(apple5Y< ofGetHeight()){
            apple5Y += 8;
        } else{
            fallApple5 = false;
            drawApple5 = false;
        }
    } else if(x==6){
        if(apple6Y< ofGetHeight()){
            apple6Y += 8;
        } else{
            fallApple6 = false;
            drawApple6 = false;
        }
    }
    
}
//--------------------------------------------------------------
void testApp::drawXgrid(){
    ofPushMatrix();
    ofNoFill();
    
    ofSetColor(0, 0, 0);
    
    //xgrid
    ofLine(0, ofGetHeight()/2+135, ofGetWidth(), ofGetHeight()/2+130);
    ofPopMatrix();
    
    //xgrid
    for(int j =0; j<11; j++){
        
        //ofLog() << ofGetWidth()/10 *j;
        ofPushMatrix();
        ofNoFill();
        ofLine(ofGetWidth()/10 * j, ofGetHeight()/2+130-10, ofGetWidth()/10 * j, ofGetHeight()/2+130+10);
        ofPopMatrix();
        
        if(j==0){
            gridX.drawString("0", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==1){
            gridX.drawString("1", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==2){
            gridX.drawString("2", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==3){
            gridX.drawString("3", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==4){
            gridX.drawString("4", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==5){
            gridX.drawString("5", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==6){
            gridX.drawString("6", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==7){
            gridX.drawString("7", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==8){
            gridX.drawString("8", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==9){
            gridX.drawString("9", ofGetWidth()/10 * j, ofGetHeight()/2+130-20);
            
        } else if(j==10){
            gridX.drawString("10", ofGetWidth()/10 * j -20, ofGetHeight()/2+130-20);
            
        }
    }

    
}

//--------------------------------------------------------------
void testApp::drawYgrid(){
    ofPushMatrix();
    ofNoFill();
    ofSetColor(0, 0, 0);
    //ygrid
    ofLine(100, 0, 100, ofGetHeight()/2+135);
    
    
    //ygrid
    
    for(int i =0; i<6; i++){
        
        if(i==0){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i, 100+10, (ofGetHeight()/2+130)/5 * i);
            gridY.drawString("5", 100+20, (ofGetHeight()/2+130)/5 * i + 20);
            
        } else if(i==1){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i, 100+10, (ofGetHeight()/2+130)/5 * i);
            gridY.drawString("4",100+20, (ofGetHeight()/2+130)/5 * i);
            
        } else if(i==2){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i, 100+10, (ofGetHeight()/2+130)/5 * i);
            gridY.drawString("3", 100+20, (ofGetHeight()/2+130)/5 * i);
            
        } else if(i==3){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i, 100+10, (ofGetHeight()/2+130)/5 * i);
            gridY.drawString("2", 100+20, (ofGetHeight()/2+130)/5 * i);
            
        } else if(i==4){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i, 100+10, (ofGetHeight()/2+130)/5 * i);
            gridY.drawString("1", 100+20, (ofGetHeight()/2+130)/5 * i);
            
        } else if(i==5){
            ofLine(100-10, (ofGetHeight()/2+130)/5 * i + 10, 100+10, (ofGetHeight()/2+130)/5 * i + 10);
            gridY.drawString("0", 100+20, (ofGetHeight()/2+130)/5 * i + 10);
            
        }
    }

    
    
}
//--------------------------------------------------------------
void testApp::drawXkeys(){
    
    ofPushMatrix();
    ofSetColor(255,255,255, 50);
    ofFill();
    
    ofRect(0, ofGetHeight()/2+130, ofGetWidth(), 90);
    ofPopMatrix();
    
    ofPushMatrix();
    if(fill0){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        //ofRect(ofGetWidth()/11 * 0 +50, ofGetHeight()/2+250, 84, 90);
        ofRect(ofGetWidth()/10 * 0, ofGetHeight()/2+130, 102, 90);
    } else if(fill1){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 1, ofGetHeight()/2+130, 102, 90);
    } else if(fill2){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 2, ofGetHeight()/2+130, 102, 90);
    } else if(fill3){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 3, ofGetHeight()/2+130, 102, 90);
    } else if(fill4){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 4, ofGetHeight()/2+130, 102, 90);
    } else if(fill5){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 5, ofGetHeight()/2+130, 102, 90);
    } else if(fill6){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 6, ofGetHeight()/2+130, 102, 90);
    } else if(fill7){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 7, ofGetHeight()/2+130, 102, 90);
    } else if(fill8){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 8, ofGetHeight()/2+130, 102, 90);
    } else if(fill9){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(ofGetWidth()/10 * 9, ofGetHeight()/2+130, 102, 90);
    }     ofPopMatrix();
    
    ofPushMatrix();
    for(int i =0; i<10; i++){
        
        //ofLog() << "x range is " << (ofGetWidth()/11) * i;
        //ofLog() << "y range is " << ofGetHeight()/2+130;
        //ofLog() << "y range is " << ofGetHeight()/2+220;
        
        ofSetColor(0);
        ofLine(ofGetWidth()/10 * i, ofGetHeight()/2+130, ofGetWidth()/10 * i, ofGetHeight()/2+220);
        
        
        if(i == 0){
            //ofSetColor(0);
            story.drawString("0", (ofGetWidth()/10 * 0 + ofGetWidth()/10 * 1)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 1){
            story.drawString("1", (ofGetWidth()/10 * 1 + ofGetWidth()/10 * 2)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 2){
            story.drawString("2", (ofGetWidth()/10 * 2 + ofGetWidth()/10 * 3)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 3){
            story.drawString("3", (ofGetWidth()/10 * 3 + ofGetWidth()/10 * 4)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 4){
            story.drawString("4", (ofGetWidth()/10 * 4 + ofGetWidth()/10 * 5)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 5){
            story.drawString("5", (ofGetWidth()/10 * 5 + ofGetWidth()/10 * 6)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 6){
            story.drawString("6", (ofGetWidth()/10 * 6 + ofGetWidth()/10 * 7)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 7){
            story.drawString("7", (ofGetWidth()/10 * 7 + ofGetWidth()/10 * 8)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 8){
            story.drawString("8", (ofGetWidth()/10 * 8 + ofGetWidth()/10 * 9)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } else if(i == 9){
            story.drawString("9", (ofGetWidth()/10 * 9 + ofGetWidth()/10 * 10)/2, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        } /*else if(i == 10){
            story.drawString("10", ofGetWidth()/11 * 10 + 90, ((ofGetHeight()/2+130)+(ofGetHeight()/2+220))/2+10);
        }*/
    }
    ofPopMatrix();
    
}
//--------------------------------------------------------------
void testApp::drawYkeys(){
    
    ofPushMatrix();
    ofSetColor(255, 255, 255, 50);
    ofFill();
    ofRect(0, 0, 100, 520);
    ofPopMatrix();
    
    ofPushMatrix();
    if(fill0){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 0, 100, 102);
    } else if(fill1){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 102, 100, 102);
    } else if(fill2){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 204, 100, 102);
    } else if(fill3){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 306, 100, 102);
    } else if(fill4){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 408, 100, 112);
    } /*else if(fill5){
        ofPushMatrix();
        ofSetColor(255, 0, 0);
        ofFill();
        ofRect(0, 510, 100, 102);
    }*/
    ofPopMatrix();

    ofPushMatrix();
    for(int i =0; i<6; i++){
        ofSetColor(0);
        //ofLog() << (ofGetHeight()/2+130)/5 * i;
        //ofLog() << (ofGetWidth()-130)/5 * i;
        //ofLog() << "x range is " << (ofGetWidth()-100);
        //ofLog() << "y range is " << ofGetHeight()/2+220;
        //ofLog() << "y range is " << ofGetHeight()/2+310;
        
        if(i == 0){
            ofLine(0, (ofGetHeight()/2+130)/5 * i, 100, (ofGetHeight()/2+130)/5 * i);
            story.drawString("4", 45, (ofGetHeight()/2+130)/5 * i + 50);
        } else if(i == 1){
            ofLine(0, (ofGetHeight()/2+130)/5 * i, 100, (ofGetHeight()/2+130)/5 * i);
            story.drawString("3", 45, (ofGetHeight()/2+130)/5 * i + 50);
        } else if(i == 2){
            ofLine(0, (ofGetHeight()/2+130)/5 * i, 100, (ofGetHeight()/2+130)/5 * i);
            story.drawString("2", 45, (ofGetHeight()/2+130)/5 * i + 50);
        } else if(i == 3){
            ofLine(0, (ofGetHeight()/2+130)/5 * i, 100, (ofGetHeight()/2+130)/5 * i);
            story.drawString("1", 45, (ofGetHeight()/2+130)/5 * i + 50);
        } else if(i == 4){
            ofLine(0, (ofGetHeight()/2+130)/5 * i, 100, (ofGetHeight()/2+130)/5 * i);
            story.drawString("0", 45, (ofGetHeight()/2+130)/5 * i + 50);
        } else if(i == 5){
            ofLine(0, (ofGetHeight()/2+130)/5 * i + 10, 100, (ofGetHeight()/2+130)/5 * i + 10);
        }
    }
    ofPopMatrix();
    
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void testApp::exit(){

}
//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
    
    fill0 = false;
    fill1 = false;
    fill2 = false;
    fill3 = false;
    fill4 = false;
    fill5 = false;
    fill6 = false;
    fill7 = false;
    fill8 = false;
    fill9 = false;
    
    if(x>ofGetWidth()-150 && x<ofGetWidth()-60 && y>50 && y< 140 && nextPressed<17){

        //nextPage = true;
        
        nextPressed++;

        moveCarrot = false;
        happyRabbit = false;
        jumpRabbit = false;
        drawApple0 = false;
        drawApple1 = false;
        drawApple2 = false;
        drawApple3 = false;
        drawApple4 = false;
        drawApple5 = false;
        drawApple6 = false;
        fallApple0 = false;
        fallApple1 = false;
        fallApple2 = false;
        fallApple3 = false;
        fallApple4 = false;
        fallApple5 = false;
        fallApple6 = false;
        apple0Ctr = 0;
        apple1Ctr = 0;
        apple2Ctr = 0;
        apple3Ctr = 0;
        apple4Ctr = 0;
        apple5Ctr = 0;
        apple6Ctr = 0;
        appleNum = 0;
        apple0Y = 0;
        apple1Y = 0;
        apple2Y = 0;
        apple3Y = 0;
        apple4Y = 0;
        apple5Y = 0;
        apple6Y = 0;



        speedY = 2.0;
        speedY2 = 2.0;
        speedY3 = 2.0;
        rabbitFY = 360;
        rabbitFY2 = 350;
        rabbitFY3 = 355;
        fydirection = 1;
        fydirection2 = 1;
        fydirection3 = 1;
        
        
        if(nextPressed<4){
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2;
        } else if(nextPressed == 4){
            rabbitNum = 11;
            rabbitY = ofGetHeight()/2;
            
        } else if(nextPressed == 5){
            rabbitNum = 11;
            rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 6) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 7) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 8) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 9) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 10) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 11) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 12) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 13){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
        } else if(nextPressed == 14){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 15){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        }
        
    }
    
    if( nextPressed > 5 && x>120 && x<260 && y> 50 && y< 140){
        
        nextPressed--;
        moveCarrot = false;
        happyRabbit = false;
        jumpRabbit = false;
        drawApple0 = false;
        drawApple1 = false;
        drawApple2 = false;
        drawApple3 = false;
        drawApple4 = false;
        drawApple5 = false;
        drawApple6 = false;
        fallApple0 = false;
        fallApple1 = false;
        fallApple2 = false;
        fallApple3 = false;
        fallApple4 = false;
        fallApple5 = false;
        fallApple6 = false;
        apple0Ctr = 0;
        apple1Ctr = 0;
        apple2Ctr = 0;
        apple3Ctr = 0;
        apple4Ctr = 0;
        apple5Ctr = 0;
        apple6Ctr = 0;
        appleNum = 0;
        apple0Y = 0;
        apple1Y = 0;
        apple2Y = 0;
        apple3Y = 0;
        apple4Y = 0;
        apple5Y = 0;
        apple6Y = 0;
        
        
        
        speedY = 2.0;
        speedY2 = 2.0;
        speedY3 = 2.0;
        rabbitFY = 360;
        rabbitFY2 = 350;
        rabbitFY3 = 355;
        
        if(nextPressed<4){
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2;
        } else if(nextPressed == 4){
            rabbitNum = 11;
            rabbitY = ofGetHeight()/2;
            
        } else if(nextPressed == 5){
            rabbitNum = 11;
            rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 6) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 7) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 8) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 9) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 10) {
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 11) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 12) {
            rabbitNum = 11;
            carrotGridX = 174;
            rabbitX = ofGetWidth()/2;
            //rabbitY = ofGetHeight()/2-60;
            
        } else if(nextPressed == 13){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
        } else if(nextPressed == 14){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        } else if(nextPressed == 15){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        }



         
    }
    
    
    if(page_05){

        if(carrotGridX >=0 && carrotGridX< 61){
            carrotGridX = -15;
            carrotX = -15;
        } else if(carrotGridX > 61 && carrotGridX < 153){
            carrotGridX = 77;
            carrotX = 77;
        } else if(carrotGridX > 153 && carrotGridX < 255){
            carrotGridX = 174;
            carrotX = 174;
        } else if(carrotGridX > 255 && carrotGridX < 357){
            carrotGridX = 277;
            carrotX = 277;
        } else if(carrotGridX > 357 && carrotGridX < 459){
            carrotGridX = 379;
            carrotX = 379;
        } else if(carrotGridX > 459 && carrotGridX < 561){
            carrotGridX = 477;
            carrotX = 477;
        } else if(carrotGridX > 561 && carrotGridX < 663){
            carrotGridX = 584;
            carrotX = 584;
        } else if(carrotGridX > 663 && carrotGridX < 765){
            carrotGridX = 694;
            carrotX = 694;
        } else if(carrotGridX > 765 && carrotGridX < 867){
            carrotGridX = 796;
            carrotX = 796;
        } else if(carrotGridX > 867 && carrotGridX < 969){
            carrotGridX = 898;
            carrotX = 898;
        } else if(carrotGridX > 969 && carrotGridX < 1028){
            carrotGridX = 1000;
            carrotX = 1000;
        } else if(nextPressed == 12){
            rabbitNum = 11;
            rabbitX = ofGetWidth()/2;
            rabbitY = ofGetHeight()/2-60;
        }

    }
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

    if(nextPressed == 0){
        nextPressed = 1;
    }
    
    if(page_01){
        if(touch.x>0 && touch.x<102 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 0;
        } else if(touch.x>102 && touch.x<204 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 1;
        } else if(touch.x>204 && touch.x<306 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 2;
        } else if(touch.x>306 && touch.x<408 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 3;
        } else if(touch.x>408 && touch.x<510 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 4;
        } else if(touch.x>510 && touch.x<612 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = true;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 5;
        } else if(touch.x>612 && touch.x<714 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = true;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 6;
        } else if(touch.x>714 && touch.x<816 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = true;
            fill8 = false;
            fill9 = false;
            rabbitNum = 7;
        } else if(touch.x>816 && touch.x<918 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = true;
            fill9 = false;
            rabbitNum = 8;
        } else if(touch.x>918 && touch.x<1020 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = true;
            rabbitNum = 9;
        }
    } else if(page_02){
        moveRabbitX = false;
        if(touch.x>0 && touch.x<100 && touch.y>0 && touch.y <102){
            moveRabbitY = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 4;
        } else if(touch.x>0 && touch.x<100 && touch.y>102 && touch.y <204){
            moveRabbitY = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 3;
        } else if(touch.x>0 && touch.x<100 && touch.y>204 && touch.y <306){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 2;
        } else if(touch.x>0 && touch.x<100 && touch.y>306 && touch.y <408){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 1;
        } else if(touch.x>0 && touch.x<100 && touch.y>408 && touch.y <510){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 0;
        }
    } else if(page_03){
        
        if(touch.x>0 && touch.x<102 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 0;
            jumpRabbit = false;
        } else if(touch.x>102 && touch.x<204 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 1;
            jumpRabbit = false;
        } else if(touch.x>204 && touch.x<306 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 2;
            jumpRabbit = false;
        } else if(touch.x>306 && touch.x<408 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 3;
            jumpRabbit = true;
        } else if(touch.x>408 && touch.x<510 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 4;
            jumpRabbit = false;
        } else if(touch.x>510 && touch.x<612 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = true;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 5;
            jumpRabbit = false;
        } else if(touch.x>612 && touch.x<714 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = true;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 6;
            jumpRabbit = false;
        } else if(touch.x>714 && touch.x<816 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = true;
            fill8 = false;
            fill9 = false;
            rabbitNum = 7;
            jumpRabbit = false;
        } else if(touch.x>816 && touch.x<918 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = true;
            fill9 = false;
            rabbitNum = 8;
            jumpRabbit = false;
        } else if(touch.x>816 && touch.x<1020 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = true;
            rabbitNum = 9;
            jumpRabbit = false;
        }
    } else if(page_05){
        if(touch.x>0 && touch.x<102 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 0;
            rabbitY = 324;
            if(carrotX == -15){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>102 && touch.x<204 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 1;
            rabbitY = 324;
            if(carrotX == 77){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>204 && touch.x<306 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 2;
            rabbitY = 324;
            if(carrotX == 174){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>306 && touch.x<408 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 3;
            rabbitY = 324;
            if(carrotX == 277){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>408 && touch.x<510 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 4;
            rabbitY = 324;
            if(carrotX == 379){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>510 && touch.x<612 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = true;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 5;
            rabbitY = 324;
            if(carrotX == 477){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>612 && touch.x<714 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = true;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 6;
            rabbitY = 324;
            if(carrotX == 584){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>714 && touch.x<816 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = true;
            fill8 = false;
            fill9 = false;
            rabbitNum = 7;
            rabbitY = 324;
            if(carrotX == 694){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>816 && touch.x<918 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = true;
            fill9 = false;
            rabbitNum = 8;
            rabbitY = 324;
            if(carrotX == 796){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        } else if(touch.x>918 && touch.x<1020 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = true;
            rabbitNum = 9;
            rabbitY = 324;
            if(carrotX == 898){
                jumpRabbit = true;
            } else {
                jumpRabbit = false;
            }
        }
    } else if(page_06){
        
        if (touch.x>380 && touch.x<515 && touch.y >603 && touch.y<690) {
            rabbitNum = (int)ofRandom(0, 10);
            jumpRabbit = true;
            
        }
    
    } else if(page_07){
        moveRabbitX = false;
        if(touch.x>0 && touch.x<100 && touch.y>0 && touch.y <102){
            moveRabbitY = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            //fill5 = false;
            happyRabbit = false;
            jumpRabbit = true;
            rabbitNum = 4;
        } else if(touch.x>0 && touch.x<100 && touch.y>102 && touch.y <204){
            moveRabbitY = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 3;
        } else if(touch.x>0 && touch.x<100 && touch.y>204 && touch.y <306){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 2;
        } else if(touch.x>0 && touch.x<100 && touch.y>306 && touch.y <408){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            //fill5 = false;
            happyRabbit = false;
            jumpRabbit = true;
            rabbitNum = 1;
        } else if(touch.x>0 && touch.x<100 && touch.y>408 && touch.y <510){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 0;
        }
        
    } else if(page_08){
        moveRabbitX = false;
        if(touch.x>0 && touch.x<100 && touch.y>0 && touch.y <102){
            moveRabbitY = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            //fill5 = false;
            happyRabbit = false;
            jumpRabbit = true;
            rabbitNum = 4;
        } else if(touch.x>0 && touch.x<100 && touch.y>102 && touch.y <204){
            moveRabbitY = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 3;
        } else if(touch.x>0 && touch.x<100 && touch.y>204 && touch.y <306){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 2;
        } else if(touch.x>0 && touch.x<100 && touch.y>306 && touch.y <408){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            //fill5 = false;
            happyRabbit = false;
            jumpRabbit = true;
            rabbitNum = 1;
        } else if(touch.x>0 && touch.x<100 && touch.y>408 && touch.y <510){
            moveRabbitY = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            happyRabbit = false;
            //fill5 = false;
            jumpRabbit = true;
            rabbitNum = 0;
        }
        
    } else if(page_09){
        if(touch.x>0 && touch.x<153 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            drawApple0 = true;
            fallApple0 = !fallApple0;

        }
        if(touch.x>153 && touch.x<306 && touch.y > ofGetHeight()/2-150 && touch.y < ofGetHeight()/2+50){
            drawApple1 = true;
            fallApple1 = !fallApple1;
        }
        if(touch.x>306 && touch.x<459 && touch.y > ofGetHeight()/2-150 && touch.y < ofGetHeight()/2+50){
            drawApple2 = true;
            fallApple2 = !fallApple2;
        }
        if(touch.x>459 && touch.x<612 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            drawApple3 = true;
            fallApple3 = !fallApple3;
        }
        if(touch.x>612 && touch.x<765 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            drawApple4 = true;
            fallApple4 = !fallApple4;
        }
        if(touch.x>765 && touch.x<867 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            drawApple5 = true;
            fallApple5 = !fallApple5;
        }
        if(touch.x>867 && touch.x<1020 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            drawApple6 = true;
            fallApple6 = !fallApple6;
        }
        
    } else if(page_10){
        if(touch.x>0 && touch.x<102 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 0;
            jumpRabbit = true;
        } else if(touch.x>102 && touch.x<204 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 1;
            jumpRabbit = true;
        } else if(touch.x>204 && touch.x<306 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 2;
            jumpRabbit = true;
        } else if(touch.x>306 && touch.x<408 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 3;
            jumpRabbit = false;
        } else if(touch.x>408 && touch.x<510 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 4;
            jumpRabbit = false;
        } else if(touch.x>510 && touch.x<612 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = true;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 5;
            jumpRabbit = false;
        } else if(touch.x>612 && touch.x<714 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = true;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 6;
            jumpRabbit = false;
        } else if(touch.x>714 && touch.x<816 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = true;
            fill8 = false;
            fill9 = false;
            rabbitNum = 7;
            jumpRabbit = false;
        } else if(touch.x>816 && touch.x<918 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = true;
            fill9 = false;
            rabbitNum = 8;
            jumpRabbit = false;
        } else if(touch.x>918 && touch.x<1020 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = true;
            rabbitNum = 9;
            jumpRabbit = false;
        }
        
    } else if(page_11){
        if(touch.x>0 && touch.x<102 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = true;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 0;
            jumpRabbit = true;
        } else if(touch.x>102 && touch.x<204 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = true;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 1;
            jumpRabbit = true;
        } else if(touch.x>204 && touch.x<306 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = true;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 2;
            jumpRabbit = true;
        } else if(touch.x>306 && touch.x<408 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = true;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 3;
            jumpRabbit = false;
        } else if(touch.x>408 && touch.x<510 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = true;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 4;
            jumpRabbit = false;
        } else if(touch.x>510 && touch.x<612 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = true;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 5;
            jumpRabbit = false;
        } else if(touch.x>612 && touch.x<714 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = true;
            fill7 = false;
            fill8 = false;
            fill9 = false;
            rabbitNum = 6;
            jumpRabbit = true;
        } else if(touch.x>714 && touch.x<816 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = true;
            fill8 = false;
            fill9 = false;
            rabbitNum = 7;
            jumpRabbit = true;
        } else if(touch.x>816 && touch.x<918 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = true;
            fill9 = false;
            rabbitNum = 8;
            jumpRabbit = true;
        } else if(touch.x>918 && touch.x<1020 && touch.y>514 && touch.y <604){
            moveRabbitX = true;
            fill0 = false;
            fill1 = false;
            fill2 = false;
            fill3 = false;
            fill4 = false;
            fill5 = false;
            fill6 = false;
            fill7 = false;
            fill8 = false;
            fill9 = true;
            rabbitNum = 9;
            jumpRabbit = true;
        }
        
    }
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    if(page_05){
        if(touch.y > ofGetHeight()/2 + 220 && touch.y < ofGetHeight()/2+ 280){
            moveCarrot = true;
            carrotGridX = touch.x;
        }
    }
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
    
    if(page_09){
        if(touch.x>0 && touch.x<153 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            fallApple0 = true;
            drawApple0 = false;

        }
        if(touch.x>153 && touch.x<306 && touch.y > ofGetHeight()/2-150 && touch.y < ofGetHeight()/2+50){
            fallApple1 = true;
            drawApple1 = false;
        }
        if(touch.x>306 && touch.x<459 && touch.y > ofGetHeight()/2-150 && touch.y < ofGetHeight()/2+50){
            fallApple2 = true;
            drawApple2 = false;
        }
        if(touch.x>459 && touch.x<612 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            fallApple3 = true;
            drawApple3 = false;
        }
        if(touch.x>612 && touch.x<765 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            fallApple4 = true;
            drawApple4 = false;
        }
        if(touch.x>765 && touch.x<867 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            fallApple5 = true;
            drawApple5 = false;
        }
        if(touch.x>867 && touch.x<1020 && touch.y>ofGetHeight()/2-150 && touch.y <ofGetHeight()/2+50){
            fallApple6 = true;
            drawApple6 = false;
        }
        
    }

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}
