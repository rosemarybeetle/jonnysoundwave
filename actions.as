import flash.utils.Timer;
import flash.media.Sound;
import flash.media.SoundChannel;
import flashx.textLayout.formats.Float;

stop();
var ttPeriod: Number= 1000; //period of scaling in milliseconds.
var evilHeadWidthInc: Number =0;
var evilHeadHeightInc: Number =0;
fscommand("fullscreen", "true");
greenery.visible = false;
dubstepperGuy.visible = false;
ghetto.visible = false;
oneD.visible = false;
puppet1.visible = false;
puppet2.visible = false;
jonny.visible = false;
evilHead.visible = false;
//evilHead.nastyFace.head.mouth.visible=false;
puppet3.visible = false;
if (Camera.names.length > 0)
{
	trace("User has at least one camera installed.");
	var camtest:Camera = Camera.getCamera();// Get default camera. 
}
else
{
	trace("User has no cameras installed.");
}
var humming:Boolean = false;
/*var cam:Camera = Camera.getCamera();

//var vid:Video = new Video(stage.stageWidth*1.4 , stage.stageHeight); 
var vidWidth:Number = 640;//(stage.stageWidth*1.4);
var vidHeight:Number = 270;//stage.stageHeight;
var vid:Video = new Video(160,90);
vid.attachCamera(cam);
addChild(vid);
var vidName:String = vid.name;
vid.x = vid.width / 2;
var vidSize:String = "max";

//stage.width/2;
//vid.width = stage.width;*/
var i:Number = 0;
var evilHeadSize:String = "min";
var evilHeadWidth:Number = 800;//(stage.stageWidth*1.4);
var evilHeadHeight:Number = 270;//stage.stageHeight;
var currentFocus:String = "puppet1";
var inc:int = 10;

/* Key Pressed Event
Executes the function fl_KeyboardDownHandler defined below when any keyboard key is pressed.
*/
var nirv:SoundId = new SoundId();
var channel:SoundChannel = new SoundChannel();
var Dubstep:Dubstep1 = new Dubstep1();
var channelDub:SoundChannel = new SoundChannel();
var DubstepSK:Skrillex = new Skrillex();
var channelSK:SoundChannel = new SoundChannel();
var oneDTunes:oneDTune = new oneDTune();
var channelOneD:SoundChannel = new SoundChannel();
var hummer:hum = new hum();
var channelHum:SoundChannel = new SoundChannel();

stage.addEventListener(KeyboardEvent.KEY_DOWN, fl_KeyboardDownHandler);
function fl_KeyboardDownHandler(event:KeyboardEvent):void
{
	// Start your custom code
	// This example code displays the words "Key Code Pressed:" and the keycode of the pressed key in the Output panel.
	trace("Key Code Pressed: " + event.keyCode);
	if (event.keyCode == 48)
	{
		// remove title if number "0" is pressed
		mainTitle.visible = false;
	}
	if (event.keyCode == 71)
	{
		if (greenery.visible == true)
		{
			greenery.visible = false;
			channel.stop();
		}
		else if (greenery.visible==false)
		{
			greenery.visible = true;
			channel = nirv.play();
			currentFocus = "greenery";
		}
	}

	if (event.keyCode == 84)
	{
		// make camera the focus if letter T is pressed
		if (dubstepperGuy.visible == false)
		{
			dubstepperGuy.visible = true;
			channelDub = Dubstep.play();
		}
		else if (dubstepperGuy.visible==true)
		{
			dubstepperGuy.visible = false;
			channelDub.stop();

		}
		currentFocus = "dubstepperGuy";
	}

	if (event.keyCode == 79)
	{
		// make camera the focus if letter "O" is pressed
		if (oneD.visible == false)
		{
			oneD.visible = true;
			channelOneD = oneDTunes.play();
		}
		else if (oneD.visible==true)
		{
			oneD.visible = false;
			channelOneD.stop();

		}
		currentFocus = "oneD";
	}

	if (event.keyCode == 68)
	{
		// make DubStep visible focus if letter d is pressed
		if (ghetto.visible == false)
		{
			ghetto.visible = true;
			channelSK = DubstepSK.play();
		}
		else if (ghetto.visible==true)
		{
			ghetto.visible = false;
			channelSK.stop();

		}
		currentFocus = "ghetto";
	}
	if (event.keyCode == 90)
	{
		// if letter "Z" is pressed
		currentFocus = "evilHead";
	}
	if (event.keyCode == 67)
	{
		// make camera the focus if letter C is pressed
		currentFocus = "vid";
	}
	if (event.keyCode == 72)
	{
		// make hum play if letter "H" is pressed
		if (humming==false)
		{
			channelHum = hummer.play();
			humming = true;
		}
		else if (humming==true)
		{
			channelHum.stop();
			humming = false;
		}
	}
	if (event.keyCode == 49)
	{
		currentFocus = "puppet1";// puppet 1 the focus if number 1 is pressed
	}
	if (event.keyCode == 50)
	{
		currentFocus = "puppet2";// puppet 2 the focus if number 2 is pressed

	}
	if (event.keyCode == 51)
	{
		currentFocus = "puppet3";// puppet 3 the focus if number 3 is pressed

	}
	if (event.keyCode == 74)
	{
		currentFocus = "jonny";// puppet 3 the focus if number 3 is pressed
	}
	if (event.keyCode == 77)
	{
		// actions for key "M" pressed
				if (currentFocus=="evilHead")
		{
			trace("currentFocus== evilHead");
			if (evilHeadSize=="max")
			{ 
				evilHeadMinimise();
			}
			else if (evilHeadSize=="min")
			{
				evilHeadMaximise();
			}
		}
		else
		{
			this[currentFocus].mouth.play();
		}
	}
	// if key M pressed, open mouth;

	if (event.keyCode == 69)
	{
		this[currentFocus].eyes.x -=  inc;
	}
	if (event.keyCode == 82)
	{
		this[currentFocus].eyes.x +=  inc;
	}
	if (event.keyCode == 37)
	{
		this[currentFocus].x -=  inc;
	}
	if (event.keyCode == 38)
	{
		this[currentFocus].y -=  inc;
	}
	if (event.keyCode == 39)
	{
		this[currentFocus].x +=  inc;
	}
	if (event.keyCode == 40)
	{
		this[currentFocus].y +=  inc;
	}

	if (event.keyCode == 86)
	{
		//(visibility controls because key "V" has been pressed
		/*trace(this[currentFocus]);
		if (currentFocus=="evilHead")
		{
			trace("currentFocus== evilHead");
			if (evilHeadSize=="max")
			{ 
				evilHeadMinimise();
			}
			else if (evilHeadSize=="min")
			{
				evilHeadMaximise();
			}
		}*/
		//else
		//{
			trace ("inside visibility els");
			if (this[currentFocus].visible == true)
			{
				this[currentFocus].visible = false;
			}
			else if (this[currentFocus].visible==false)
			{
				this[currentFocus].visible = true;
			}
		//}

	}


}
// End keyboard detection codes custom code

function evilHeadMinimise():void
{
	evilHead.nastyFace.alpha=1;
	var myTimerMin:Timer = new Timer(1,30);
myTimerMin.addEventListener(TimerEvent.TIMER, timerListenerMin);

	myTimerMin.start();

function timerListenerMin (e:TimerEvent):void {
trace("TimerMin is Triggered");

		if (evilHead.width>0) {
		trace("evilHeadIfLoop");
		evilHead.width-=40;
		evilHead.height-=40;
		} else if (evilHead.width<=0) {
		evilHead.width=0;
		evilHead.height=0;
		evilHead.visible=false;
		}
		
	}


		evilHeadSize = "min";
}

//@@

//@@
function evilHeadMaximise():void
{
	
	

	trace("inside evilHeadMaximise");
	evilHead.visible=true;
	var myTimer:Timer = new Timer(1,40);
myTimer.addEventListener(TimerEvent.TIMER, timerListener);
myTimer.start();
function timerListener (e:TimerEvent):void {
trace("Timer is Triggered");

		trace("evilHeadFor");
		if (evilHead.width<evilHeadWidth) {
		trace("evilHeadIfLoop");
		evilHead.width+=20;
		evilHead.height+=20;
		evilHead.nastyFace.alpha-=0.013;
		
			} else {evilHeadSize = "max";}
		
	}


	
	
}
stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDowned);
function mouseDowned(event:MouseEvent):void
{
	trace("mouse.x = "+this.mouseX );
	trace("this[currentFocus].x = "+this[currentFocus].x );
	
	//var myPoint:Point = new Point(stage.mouseX,stage.mouseY);
if (jonny.hitTestPoint(stage.mouseX,stage.mouseY)) {
jonny.startDrag();
}
if (puppet1.hitTestPoint(stage.mouseX,stage.mouseY)) {
puppet1.startDrag();
}
if (puppet2.hitTestPoint(stage.mouseX,stage.mouseY)) {
puppet2.startDrag();
}
if (puppet3.hitTestPoint(stage.mouseX,stage.mouseY)) {
puppet3.startDrag();
}
if (ghetto.hitTestPoint(stage.mouseX,stage.mouseY)) {
ghetto.startDrag();
}
if (oneD.hitTestPoint(stage.mouseX,stage.mouseY)) {
oneD.startDrag();
}
if (dubstepperGuy.hitTestPoint(stage.mouseX,stage.mouseY)) {
dubstepperGuy.startDrag();
}
if (evilHead.hitTestPoint(stage.mouseX,stage.mouseY)) {
evilHead.startDrag();
}

} // end mouedown function
//---------------------------------------

stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);

function mouseReleased(event:MouseEvent):void
{
	trace("Up mouse.x = "+this.mouseX );
	trace("this[currentFocus] = "+this[currentFocus].name);
	
	
		this[currentFocus].stopDrag();
	
}//trace(this[currentFocus].dropTarget.name); ;
