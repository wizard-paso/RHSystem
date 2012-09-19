package paso.dyndns.info.MJSC 
{
	import flash.display.MovieClip;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author wizard_paso
	 */
	internal class PartDisplay
	{
		private var mc:MovieClip;
		private var baseMC:Sprite;
		
		
		public function PartDisplay(mc:MovieClip,baseMC:Sprite) 
		{
			this.mc = mc;
			this.baseMC = baseMC;
			baseMC.addChild(mc);
		}
		public function get $mc():MovieClip{
			return mc;
		}
		
		/*public function setVisible() {//MCの表示を消す
			if (!visible)
			{
				stage.removeChild(mc)
				visible2 = true;
			}
		}
		public function setInvisible() {//MCの表示を行う
			if (visible)
			{
				stage.addChild(mc);
				visible2 = false;
			}
		}  */
	}

}