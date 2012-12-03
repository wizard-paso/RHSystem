package info.dyndns.paso.keyboard
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	
	import flashx.textLayout.elements.BreakElement;
	
	import info.dyndns.paso.data.GlobalData;
	import info.dyndns.paso.mjsc.DisplayController;
	
	/*
	StageとTextField両方にリスナーを追加すると､
	Fieldにフォーカスがある際にキー押下すると両方のリスナーが反応する仕様がある
	
	この対策として､
	 ･イベントリスナーを追加･削除してその都度 切り替える
	･ｓｔａｇｅのみにリスナーを追加､こちらに変数を持たせて変数によって切り替える
	方法を考えた｡
	
	リスナーを都度追加削除するのは漏れるリスクがある
	(=緊急事態を止められないとかにつながる)ので､変数で切り替える方式を使う｡
	*/
	
	//キーボード入力を管理する
	public class KeyboardListener
	{
		//モードを決める		現在の実装では INPUT <-ENTER-> NORMARL <-NUMPAD-> EMERGENCY
		private static const NORMAL:String="NORMAL";		
		private static const INPUT:String="INPUT";	
		private static const EMERGENCY:String="EMERGENCY";	
		//モードごとにオブジェクトを用意する? ->モードを変更する際に不便? 
		
		private var displayController:DisplayController;
		
		private var _mode:String=NORMAL;//デフォルトはNORMALとする｡
		
		public function KeyboardListener(displayController:DisplayController)//コンストラクタ
		{
			this.displayController=displayController
			GlobalData.stage.addEventListener(KeyboardEvent.KEY_UP , keyUpHandler);
		}
		
		public function get mode():String{	//modeのゲッタ
			return _mode;
		}
		public function set mode(value:String):void{	//modeのセッタ
			trace("change KeyboardListener "+_mode+"to "+value);
			_mode=value;
		}
		
		//入力があった場合､modeで切り分ける｡
		private function keyUpHandler(event:KeyboardEvent):void{
			switch(_mode){
				case NORMAL:
					normalMode(event);
					break;
				case INPUT:
					inputMode(event);
					break;
				case EMERGENCY:
					emergencyMode(event);
					break;
			}
		}
		
		//どこでTextFieldの中をからっぽにするの??
		private function normalMode(event:KeyboardEvent):void{
			//trace("normal mode"+event.keyCode);
			switch(event.keyCode){
				case 13:
					//エンター押下後の処理に関して､
					//KeyboardListenerかこっちが処理するか
					//KListenerがやる
					//リスナーであっちに飛ぶので､KListenerを読み込む必要がない
					//イベント通知- KIがget,clearでリスナーを呼ぶ
					
					//こっちがやる
					//イベントリスナーをここに設置するだけで住む
					//textboxの中をgetして､clearして､コントローラを下げてからイベントリスナーを呼ぶ
					
					//->機能を限定させるため､こっちでやることにする
					
					var displayControllerData:Object=displayController.getData();
					
					
					if(displayControllerData.emer){
						
						//非常時の場合のイベント
						
						break;
					}else{
						
					}
					
			
						
						/*
						
			text:mc.inputTextMC.inputText.text,
			color:mc.inputTextMC.colorP.hexValue,
			time:mc.inputTextMC.numS.value,
			all:mc.inputTextMC.checkN.selected,
			chime:mc.inputTextMC.checkC.selected,
			emer:mc.inputTextMC.checkE.selected
						
						 */
					
					
					
					var text:String=displayController.getText();
					displayController.clearText();
					
					//上のtextをどこに運ぶか｡解析するクラスへ運ぶ? そしてnetworkとlocal振り分け? 
					//解析用クラスない 
					//つくる｡
			}
		}
	
	
		private function inputMode(event:KeyboardEvent):void{
			//trace("input mode"+event.keyCode);
			
		}
		private function emergencyMode(event:KeyboardEvent):void{
			//trace("emergency mode"+event.keyCode);
			
		}
		
		
	}
}