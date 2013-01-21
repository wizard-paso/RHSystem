package info.dyndns.paso.mjsevent
{
	import flash.events.Event;
	
	public class NetworkEvent　extends Event
	{
				public static const EVENT :String ='EVENT';
				
				
				//↑イベント名をここに記述する
				
				
				public var data:Object;//Object型のdataをもたせることによって､値をイベント通知先に渡すことができる｡ソース元を読みに行く方式だと､ソース元が変更されてしまう可能性があるためこうする
				
				//イベントが呼び出す
				
				public function NetworkEvent(type:String,data:Object=null,bubbles:Boolean=false,cancelable:Boolean=false):void {
					super(type,bubbles,cancelable);//ここでEventクラスにデータをなげる｡
					this.data=data;//コンストラクタでクラス変数にObjectを入れる
				}
				
				public override function clone():Event{
					
					return　new　NetworkEvent(type,bubbles,cancelable);
					
			}
	}
}