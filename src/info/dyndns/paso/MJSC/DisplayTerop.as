package info.dyndns.paso.MJSC  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.filters.DisplacementMapFilter;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	
	import info.dyndns.paso.MJSEvent.*;
	import info.dyndns.paso.Data.*;
	
	/**
	 * ...
	 * @author wizard_paso
	 */
	
	public final class DisplayTerop extends PartDisplay
	{
		
		
		private var slideMax:uint;//けしたい｡
		
		public function DisplayTerop(mainMC:Sprite) 
		{
			var mc:MovieClip = new TeropMC();//mcはスーパクラスにある スーパクラスにゲッタセッタが存在せずにゲットセットするものをつくるときに$をつける｡
			mc.y = GlobalData.HEIGHT - 100;
			trace(GlobalData.WIDTH,mc.width)
			super(mc, mainMC);
			var displayEventDispatcher:DisplayEventDispatcher=DisplayEventDispatcher.getInstance()//ここはクラス変数でなくローカル変数でいい｡
				displayEventDispatcher.addEventListener(DisplayEvent.TEROP_EVENT,teropEventHandler);
		}
		private function teropEventHandler(event:DisplayEvent):void{//DisplayEventDispatcherがイベントを吐くとこれが呼び出される
			setText(event.data.text);
			//trace(event.data,"aaaaa");
		}
		public function setText(str:String):void {
			mc.unTextMC1.unTextMC1.unText2.text = mc.unTextMC1.unTextMC1.unText1.text = mc.unTextMC1.unTextMC2.unText1.text;
			mc.unTextMC1.unTextMC2.unText2.text = mc.unTextMC1.unTextMC2.unText1.text = str;//テロップの下に隠れている代替テキストに新規テキストを挿入
			
			/*
			 var test:TextField=new TextField();//のちに試す
test.text="";
test.autoSize=TextFieldAutoSize.LEFT
*/

			
				var textByte:ByteArray=new ByteArray();
				textByte.writeMultiByte(mc.unTextMC1.unTextMC2.unText1.text,"shift-jis");//シフトJISエンコードで文字の大きさをカウントする
				if (textByte.length>23) {//テキストボックスのWIDTHカウントでもできるような気はするが、元からテキストが入ってるので今は難しい、要検討。　また、動きもいずれプログラマブルに作る
					slideMax=(textByte.length-23)*GlobalData.WIDTH/24/2;//960/24で1文字40pix｡よって1文字あたり半分の20動かす｡はみ出た部分/2の値
					mc.removeEventListener(Event.ENTER_FRAME,slideText);
					mc.addEventListener(Event.ENTER_FRAME, slideText);


				} else {
					mc.removeEventListener(Event.ENTER_FRAME,slideText);
				}
				
				mc.unTextMC1.gotoAndPlay(1);
				mc.unTextMC2.gotoAndPlay(1);
				
						
					var count:int=0
				function slideText(event:Event):void {
					mc.unTextMC1.x-=3;
					mc.unTextMC2.x -= 3;
					if (mc.unTextMC1.x + slideMax + GlobalData.WIDTH < 0) {
						mc.unTextMC1.x=mc.unTextMC2.x+GlobalData.WIDTH+slideMax*2;//ここらてすとすること
					}	
					if (mc.unTextMC2.x+slideMax+GlobalData.WIDTH<0) {
						mc.unTextMC2.x=mc.unTextMC1.x+GlobalData.WIDTH+slideMax*2;
				}
			}
		}

			
		/*
		 	internal function setUnText(str:String):void {//下部テキストを設定
			if (str!="") {
				terops.unTextMC.mc.unText2.text=terops.unTextMC.mc.unText.text=terops.unTextMC.mc.unText.text;
				terops.unTextMC.mc.unText2.text=terops.unTextMC.mc.unText.text=str;

				//terops.mc.mc.unText2.text=terops.mc.mc.unText.text=str

				var textByte:ByteArray=new ByteArray();
				textByte.writeMultiByte(terops.unTextMC.mc.unText.text,"shift-jis");
				if (textByte.length>23) {
					slideMax=(textByte.length-23)*WIDTH/24/2;//960/24で1文字40pix｡よって1文字あたり半分の20動かす｡はみ出た部分/2の値
					//m_width=textByte.length*WIDTH/24
					//slideMax=-textByte.length*WIDTH/24
					//slideSize=1.5;
					//unTextMC.x=100+slideMax;
					//mc.x=unTextMC.x+WIDTH+slideMax
					addEventListener(Event.ENTER_FRAME,slideText, false, 0, true);
					//mc.x=100+slideMax+WIDTH+slideMax*2

				} else {

					//unTextMC.x=0;
					//mc.x=unTextMC.x+WIDTH+slideMax
					removeEventListener(Event.ENTER_FRAME,slideText);
				}
				//mc.x=100+slideMax+WIDTH+slideMax*2
				terops.mc.gotoAndPlay(1);
				terops.unTextMC.gotoAndPlay(1);


				//unTextMC.mc.gotoAndPlay(1);
			}
		}
		*/
		/*
		internal function setTerop(str:String,colo:ColorTransform,time:int,flgC:Boolean) {//テキストの割り込み｡音が鳴る
			flameKK.alpha=1;
			if (flgC) {
				sound_obj.play(0,1);
				seTimer.start();
			}
			if (teropFlg) {
				teropTimer.removeEventListener(TimerEvent.TIMER,stopTerop);
			}
			teropFlg=true;
			setUnText(str);
			setBackColor(colo);
			trace("terop timer start "+time+"seconds");
			teropTimer=new Timer(time*1000,1);
			teropTimer.addEventListener(TimerEvent.TIMER,stopTerop, false, 0, true);
			teropTimer.start();
		}
		 */
		
	}
}