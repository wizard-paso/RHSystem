package info.dyndns.paso.MJSC
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import info.dyndns.paso.Data.GlobalData;
			
		
	public final class DisplayController extends PartDisplay
	{
		public function DisplayController(mainMC:Sprite)
		{
			var mc:MovieClip = new ControllerMC();
			mc.x=GlobalData.WIDTH/2-mc.width/2;
			mc.y=GlobalData.HEIGHT-200;
			super(mc, mainMC);
			
			init();
		}
		
		/*addChild後でないとstageは参照できない*/
		private function init():void{
			
		}
		
		private function showMC(value:Boolean):void{
			if(value){//表示する場合
				
				mc.gotoAndPlay(2);//MCをフレーム2から再生することによりコントロールパネルを上に上げるアニメーション
			}else{//非表示にする場合
				mc.gotoAndPlay(31);//MCをフレーム31から再生することによりコントロールパネルを下に下げるアニメーションをみせる
			}
		}
		//MC内のテキストを取得する
		public function getText():String{
			return mc.inputTextMC.text
		}
		//MC内のテキストをクリアする
		public function clearText():void{
			mc.inputTextMC.text="";
		}	
	}
}