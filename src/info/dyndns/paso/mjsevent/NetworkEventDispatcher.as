package info.dyndns.paso.mjsevent	
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	public class NetworkEventDispatcher extends EventDispatcher
	{
		private static var instance:NetworkEventDispatcher;
		public static function getInstance():NetworkEventDispatcher {
			if(instance == null) {
				instance = new NetworkEventDispatcher(arguments.callee);
			}
			return instance;
		}
		public function NetworkEventDispatcher(caller:Function = null) {
			if(caller != NetworkEventDispatcher.getInstance) {
				throw new Error("This is Singleton Class");
			}
			if(NetworkEventDispatcher.instance != null) {
				throw new Error("Only One Instance");
			}
			init();
		}
		private function init():void {
			//ここからいろいろ書く
		}

	}
}