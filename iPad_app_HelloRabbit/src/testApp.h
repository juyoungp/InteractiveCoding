/*
 Ju Young Park
 juyoungp88@gmail.com
 April.22.2014
 */
#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"

class testApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        //void mouseReleased(int x, int y, int button);
    
        void windowResized(int w, int h);
	
        void touchDown(ofTouchEventArgs & touch);
    
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
        void mouseReleased(int x, int y, int button);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        void drawXgrid();
        void drawXkeys();
        void drawYkeys();
        void drawYgrid();
        void logo();
        void moveCloud();
        void pageZeroZeroZero();
        void pageZeroZero();
        void pageZero();
        void pageStart();
        void pageOne();
        void pageTwo();
        void pageThree();
        void pageFour();
        void pageFive();
        void pageSix();
        void pageSeven();
        void pageEight();
        void pageNine();
        void pageTen();
        void pageEleven();
        void ending();
        void moveRabbit(int x, int page);
        void jumpingRabbits();
        void backRabbits();
        void chaseRabbits();
        void chaseBack();
        void drawCarrotSlide(int x);
        void drawApple();
        void fall(int x);
    
        float xspeed, yspeed, yspeed4, yspeed5, yspeed6, yspeed7, yspeed9, yspeed10, yspeed11, yspeed12, yspeed13, speedY, speedY2, speedY3, cloudSpeed;
    
        float xdirection, ydirection, fydirection, fydirection2, fydirection3;
    
        int rabbitNum, rabbitXmapped, nextPressed, rabbitX, rabbitY, c, cloudX, cloudX2, rabbitFY, rabbitFY2, rabbitFY3, rabbitF1X,  rabbitF1Y, rabbitF2X, rabbitF2Y, rabbitF3X, rabbitF3Y, rabbitF11X, rabbitF11Y, rabbitF22X, rabbitF22Y, rabbitF33X, rabbitF33Y, carrotX, carrotGridX, appleNum;
    
        ofImage rabbit, background, cloud, rabbitFriend1, rabbitFriend2, rabbitFriend3, rabbitFriend4, rabbitFriend5, rabbitFriend6, questionmark, logoImg, carrot, carrotImg, teachme, apple, endRabbit1, endRabbit2, endRabbit3, thankyou, carrotBtn, leftBtn, rightBtn;
    
        ofTrueTypeFont page, story, gridX, xval, yval, gridY, next;
    
        bool page_01, page_02, page_03, page_04, page_05, page_06, page_07, page_08, page_09, page_10, page_11, moveRabbitX, moveRabbitY, jumpRabbit, aloneRabbit, drawRabbits, backRs, happyRabbit, moveCarrot;
        bool fill0, fill1, fill2, fill3, fill4, fill5, fill6, fill7, fill8, fill9;
    
        bool drawApple0, drawApple1, drawApple2, drawApple3, drawApple4, drawApple5, drawApple6;
    
        bool fallApple0, fallApple1, fallApple2, fallApple3, fallApple4, fallApple5, fallApple6;
    
        bool friend1happy, friend2happy;
    
        int apple0Ctr, apple1Ctr, apple2Ctr, apple3Ctr, apple4Ctr, apple5Ctr, apple6Ctr;
    
        int apple0Y, apple1Y, apple2Y, apple3Y, apple4Y, apple5Y, apple6Y;
    
};


