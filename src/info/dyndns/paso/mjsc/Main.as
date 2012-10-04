package info.dyndns.paso.mjsc 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.text.*;
	import flash.ui.Keyboard;
	
	import info.dyndns.paso.keyboard.KeyboardListener;
	import info.dyndns.paso.network.*;
	import info.dyndns.paso.data.GlobalData;
	
	/**
	 * ...
	 * @author wizard_paso
	 */
	
	[SWF(width="960", height="540", backgroundColor="0xFFFFFF", frameRate="30")]
	
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();//ステージが読まれたかどうか｡これがなければstageクラスを参照できない｡
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event = null):void 
		{
			GlobalData.stage=stage;
			
			removeEventListener(Event.ADDED_TO_STAGE, init);	//ステージ追加判断のリスナーを削除
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
			
			var background:DisplayBackground=new DisplayBackground(mainMC);
			
			var terop:DisplayTerop = new DisplayTerop(mainMC);
			
			/*debug
			terop.setText("今日は晴天なり！！あいうえおあいうえお");
			*/
			
			
			//var digitalClock:DisplayDigitalClock=new DisplayDigitalClock(mainMC);
			
			//var analogClock:DisplayAnalogClock=new DisplayAnalogClock(mainMC);
			
			var controller:DisplayController=new DisplayController(coverMC);
			
			var keyboardInput:KeyboardListener=new KeyboardListener(controller);
			
			var network:Network=new Network();
			
			
			
			enableDebugConsole();
			
			function enableDebugConsole():void{
				var debugConsole:TextField=new TextField();
				debugConsole.type=TextFieldType.INPUT;
				addChild(debugConsole);
				
				debugConsole.addEventListener(KeyboardEvent.KEY_UP,function(event:KeyboardEvent){
					if(event.keyCode==13){//エンターキーが押下されたときにデバッグコマンド実行
						var consoleSplit:Array=debugConsole.text.split("::");
						debugConsole.text="";
						switch(consoleSplit[0]){
							case "keyboardModeChange":
								keyboardInput.mode=consoleSplit[1];
								break;
							
						}
						
					}
				});
			}//debugここまで
			
			
		}
	}
}