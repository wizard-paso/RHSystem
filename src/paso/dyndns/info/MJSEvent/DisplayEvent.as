package paso.dyndns.info.MJSEvent
{
	import flash.events.Event;
	
	public class DisplayEvent　extends Event
	{
				public static const TEROP_EVENT :String ='TEROP_EVENT';
				public static const SUB_TEROP_EVENT:String = "SUB_TEROP_EVENT";
				
				//↑イベント名をここに記述する
				
				
				public var data:Object;//Object型のdataをもたせることによって､値をイベント通知先に渡すことができる
				
				//イベントが呼び出す
				
				public function DisplayEvent(type:String,data:Object,bubbles:Boolean=false,cancelable:Boolean=false):void {
					super(type,bubbles,cancelable);
					this.data=data;//コンストラクタでクラス変数にObjectを入れる
				}
				
				public override function clone():Event{
					
					return　new　DisplayEvent(type,bubbles,cancelable);
					
			}
	}
}