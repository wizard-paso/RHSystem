package info.dyndns.paso.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import info.dyndns.paso.MJSEvent.*;
		
		
	public final class DisplayBackground extends PartDisplay
	{
		public function DisplayBackground(mainMC:Sprite)
		{
			var mc:MovieClip = new BackgroundMC();
			super(mc, mainMC);
			var displayEventDispatcher:DisplayEventDispatcher=DisplayEventDispatcher.getInstance()//ここはクラス変数でなくローカル変数でいい｡
			displayEventDispatcher.addEventListener(DisplayEvent.COLOR_EVENT,colorEventHandler);
		}
		private function colorEventHandler(event:DisplayEvent):void{//DisplayEventDispatcherがイベントを吐くとこれが呼び出される
			var coler:ColorTransform=new ColorTransform();
			if(event.data.color){
				coler.color=event.data.color;
			}
			setColor(coler);
			
			//trace(event.data,"aaaaa");
		}
		
		public function setColor(color:ColorTransform):void{
			if (color!=null) {
				mc.nextBackColor.transform.colorTransform=color;
				mc.nowBackColor.gotoAndPlay(1);
			}
		}
	}
}