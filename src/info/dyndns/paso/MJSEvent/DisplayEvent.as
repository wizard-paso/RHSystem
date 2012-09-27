package info.dyndns.paso.MJSEvent
{
	import flash.events.Event;
	
	public class DisplayEvent　extends Event
	{
				public static const TEROP_EVENT :String ='TEROP_EVENT';
				public static const SUB_TEROP_EVENT:String = "SUB_TEROP_EVENT";
				public static const COLOR_EVENT:String = "COLOR_EVENT";//右側はJSONによって受信するイベント名にする
				
				
				//↑イベント名をここに記述する
				
				
				public var data:Object;//Object型のdataをもたせることによって､値をイベント通知先に渡すことができる｡ソース元を読みに行く方式だと､ソース元が変更されてしまう可能性があるためこうする
				
				//イベントが呼び出す
				
				public function DisplayEvent(type:String,data:Object,bubbles:Boolean=false,cancelable:Boolean=false):void {
					super(type,bubbles,cancelable);//ここでEventクラスにデータをなげる｡
					this.data=data;//コンストラクタでクラス変数にObjectを入れる
				}
				
				public override function clone():Event{
					
					return　new　DisplayEvent(type,bubbles,cancelable);
					
			}
	}
}