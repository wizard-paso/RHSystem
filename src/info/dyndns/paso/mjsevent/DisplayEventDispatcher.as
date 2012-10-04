package info.dyndns.paso.mjsevent	
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import info.dyndns.paso.mjsevent.DisplayEvent;
	public class DisplayEventDispatcher extends EventDispatcher
	{
		private static var instance:DisplayEventDispatcher;
		public static function getInstance():DisplayEventDispatcher {
			if(instance == null) {
				instance = new DisplayEventDispatcher(arguments.callee);
			}
			return instance;
		}
		public function DisplayEventDispatcher(caller:Function = null) {
			if(caller != DisplayEventDispatcher.getInstance) {
				throw new Error("This is Singleton Class");
			}
			if(DisplayEventDispatcher.instance != null) {
				throw new Error("Only One Instance");
			}
			init();
		}
		private function init():void {
			//ここからいろいろ書く
		}
		public function debug():void{
			eventDispatch({messageType:"terop" as String,text:"test" as String});
			//eventDispatch({messageType:"terop" as String,text:"test" as String});
		}
		internal function eventDispatch(messageObject:Object):void {	//dispatchEventを呼び出せるのはこの中だけだから､上のdebugのような関数を通す必要がある?
			switch(messageObject.messageType){
				case "terop":
					dispatchEvent(new DisplayEvent(DisplayEvent.TEROP_EVENT,messageObject));//テロップイベントを発行
					break;
				default:							
			}
			//dispatchEvent(new Event(DisplayEvent.TEROP_EVENT));
		}
	}
}