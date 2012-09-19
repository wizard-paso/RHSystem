package paso.dyndns.info.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
			
		
	public final class DisplayController extends PartDisplay
	{
		public function DisplayController(mainMC:Sprite)
		{
			var mc:MovieClip = new ControllerMC();
			mc.x=GlobalData.WIDTH/2-mc.width/2;
			mc.y=GlobalData.HEIGHT-200;
			super(mc, mainMC);
			
		}
		
		/*addChild後でないとstageは参照できない*/
		
		private function visibleMC(value:Boolean):void{
			if(value){//表示する場合
				
				$mc.gotoAndPlay(2);//MCをフレーム2から再生することによりコントロールパネルを上に上げるアニメーション
			}else{//非表示にする場合
				$mc.gotoAndPlay(31);//MCをフレーム31から再生することによりコントロールパネルを下に下げるアニメーションをみせる
			}
		}
		
		
		
	}
}