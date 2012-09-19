package paso.dyndns.info.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	
		
		
	public final class DisplayBackground extends PartDisplay
	{
		public function DisplayBackground(mainMC:Sprite)
		{
			var mc:MovieClip = new BackgroundMC();
			super(mc, mainMC);
		}
		
		public function setColor(color:ColorTransform):void{
			if (color!=null) {
				$mc.nextBackColor.transform.colorTransform=color;
				$mc.nowBackColor.gotoAndPlay(1);
			}
		}
	}
}