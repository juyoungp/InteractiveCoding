/*
 Ju Young Park
 juyoungp88@gmail.com
 April.22.2014
 */
#include "ofMain.h"
#include "testApp.h"

int main(){
	ofSetupOpenGL(1024,768,OF_FULLSCREEN);			// <-------- setup the GL context

	ofRunApp(new testApp());
}
