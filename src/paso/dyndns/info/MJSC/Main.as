package paso.dyndns.info.MJSC 
{

	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	
	import paso.dyndns.info.Network.*;
	
	/**
	 * ...
	 * @author wizard_paso
	 */
	
	[SWF(width="960", height="540", backgroundColor="0xFFFFFF", frameRate="30")]
	
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			var backMC:Sprite=new Sprite();
			addChild(backMC);
			
			var mainMC:Sprite = new Sprite();
			addChild(mainMC);
			
			var coverMC:Sprite=new Sprite();
			addChild(coverMC);
			
			
			
			
			/*debug
			var col:ColorTransform=new ColorTransform();
			col.color=0xFF0000;
			background.setColor(col);
			*/
			
			//var background:DisplayBackground=new DisplayBackground(mainMC);
			
			var terop:DisplayTerop = new DisplayTerop(mainMC);
			
			/*debug
			terop.setText("今日は晴天なり！！あいうえおあいうえお");
			*/
			
			
			//var digitalClock:DisplayDigitalClock=new DisplayDigitalClock(mainMC);
			
			//var analogClock:DisplayAnalogClock=new DisplayAnalogClock(mainMC);
			
			//var controller:DisplayController=new DisplayController(coverMC);
			
			var network:Network=new Network();
		}
	}
}