package info.dyndns.paso.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import info.dyndns.paso.Data.GlobalData;
	import info.dyndns.paso.Data.GlobalData;
	
	
	public final class DisplayDigitalClock extends PartDisplay
	{
		
		private var calendar:TextField=new TextField();
		private var clock:TextField=new TextField();
		private var refreshTimer:Timer=new Timer(1000);
		
		
		public function DisplayDigitalClock(mainMC:Sprite)
		{
			
			var mc:MovieClip = new MovieClip();
			
			
			clock.y=-10;
			clock.width=1;
			clock.x=GlobalData.WIDTH;
			clock.autoSize=TextFieldAutoSize.RIGHT;
			mc.addChild(clock);
			
			setText(clock,"88:88",100);
			
			
			calendar.y=-10;
			calendar.autoSize=TextFieldAutoSize.LEFT;
			mc.addChild(calendar);
			
			setText(calendar,"calendar",70);
			
			
			
			
			super(mc, mainMC);
			
			refreshTimer.addEventListener(TimerEvent.TIMER,timeRefresh);
			refreshTimer.start();
		}
		
		
		
		
		private function setText(textField:TextField,text:String,size:Object):TextField{
			
			textField.selectable=false;
			
			//デフォルトテキストフォーマットを設定
			var textFormat:TextFormat=new TextFormat();
			textFormat.size=size;
			textFormat.color=0xFFFFFF;
			
			textField.defaultTextFormat=textFormat;
			//フィルターを適用、ドロップシャドウフィルター
			var dropShadowFilter:DropShadowFilter=new DropShadowFilter(5.0, 45, 0x666666, 1.0, 5.0, 5.0, 1.0, 1, false, false, false);
			textField.filters=[dropShadowFilter];
				
			textField.text=text;
			
			return textField;
		}
		
		private function timeRefresh(event:TimerEvent):void{
			
			var date:Date=new Date();
			calendar.text=date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
			clock.text=(String(date.getHours()).length==1?"0"+date.getHours():String(date.getHours()))+":"+(String(date.getMinutes()).length==1?"0"+date.getMinutes():String(date.getMinutes()))
			
		}
		
	}
}