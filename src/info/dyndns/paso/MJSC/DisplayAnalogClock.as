package info.dyndns.paso.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public final class DisplayAnalogClock extends PartDisplay
	{
		public function DisplayAnalogClock(mainMC:Sprite)
		{
			var mc:MovieClip = new AnalogClockMC();
			super(mc, mainMC);
			
			mc.x=GlobalData.WIDTH/2-mc.width/2;
			mc.y=20;
			
			mc.addEventListener(Event.ENTER_FRAME,doClockRotation);
			
			
		}
		
		private function doClockRotation(event:Event):void {
			
			var date:Date=new Date();
			
			$mc.hou.rotation=(date.getHours()*60+date.getMinutes())/2;
			$mc.hou.tori.rotation=$mc.hou.rotation*4;
			$mc.min.rotation=(date.getMinutes()*60+date.getSeconds())/10;
			$mc.min.tori.rotation=$mc.min.rotation*2;
			$mc.sec.rotation=(date.getSeconds()*1000+date.getMilliseconds())/6000*36;
			$mc.sec.tori.rotation=$mc.sec.rotation;
		}
	}
}