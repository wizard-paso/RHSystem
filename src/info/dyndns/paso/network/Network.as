package info.dyndns.paso.network
{
	import flash.events.*;
	import flash.net.NetConnection;
	import flash.net.Socket;
	import info.dyndns.paso.mjsevent.DisplayEventDispatcher;
	
	
	public class Network
	{
		private var displayEventDispatcher:DisplayEventDispatcher=DisplayEventDispatcher.getInstance();
		private var jsonSocket:JSONSocket;
		private var fileSocket:Socket;
		
		
		public function Network()
		{
			//イベントサンプル//displayEventDispatcher.dispatchEvent(new DisplayEvent(DisplayEvent.TEROP_EVENT,{text:"teaaaa" as String}));//イベントオブジェクトを通して値を渡さないと､呼び出し元オブジェクトは一定期間値を持ち続けなければならなくなるため｡
			
			jsonSocket=new JSONSocket("localhost",8080);
			//fileSocket=new FileSocket();
			
		}
		
		

	}
}

