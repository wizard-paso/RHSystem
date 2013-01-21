package info.dyndns.paso.network
{
	import flash.events.*;
	import flash.net.Socket;
	import flash.sampler.Sample;
	
	import info.dyndns.paso.data.GlobalData;
	import info.dyndns.paso.mjsevent.*;

	public class JSONSocket extends Socket
	{
		private var displayEventDispatcher:DisplayEventDispatcher
		
		public function JSONSocket(host:String,port:int)//受け取るとともに接続
		{
			super(host,port);
			addEventListener(Event.CONNECT,connectHandler);
			addEventListener(Event.CLOSE,closeHandler);
			addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
			addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
			displayEventDispatcher=DisplayEventDispatcher.getInstance();
			//displayEventDispatcher.debug();
			var networkEventDispatcher:NetworkEventDispatcher=NetworkEventDispatcher.getInstance()//ここはクラス変数でなくローカル変数でいい｡
			networkEventDispatcher.addEventListener(NetworkEvent.EVENT,networkEventHandler);
		}
		
		/**
		 * ネットに送信すべきデータを受け取り､ネットワークへと受け渡す
		 * */
		private function networkEventHandler(event:NetworkEvent):void{//NetworkEventDispatcherがイベントを吐くとこれが呼び出される
			trace(event.data.text,"aaaaa");
			var object:Object={
				
			}
			
		}
		//connectメソッドは親のもの(Socket)を使う｡
		private function send(value:String):void{
			writeUTFBytes(value);
			writeByte(0);//nullByteを送ることによってJavaサーバ側に区切りを示す
			flush();
		}
		public function JSONSend(value:Object):void{
			try{
				trace("send: "+JSON.stringify(value))
					send(JSON.stringify(value));	//ここで接続確認を行う?	接続されてなかったらローカルに直接飛ばすとか｡
				}catch(error:Error){
					trace(error.toString());
				}
		}
		private function connectHandler(event:Event):void{
			//JSONSend({"type":"message" as String,"text":"\naiueo" as String})
			GlobalData.network=true;
			trace(Event.CONNECT)
		}
		private function closeHandler(event:Event):void{
			GlobalData.network=false;
			trace(Event.CLOSE);
		}
		private function socketDataHandler(event:ProgressEvent):void{
			//trace("trace="+readUTFBytes(bytesAvailable));
			var json:Object=JSON.parse(readUTFBytes(bytesAvailable));
			trace("receive: "+JSON.stringify(json))
			switch(json.type){
				case "message":
					
					break;
				case "event":
					for(var eventType:String in json.data){
						displayEventDispatcher.dispatchEvent(new DisplayEvent(eventType,json.data[eventType]));//eventTypeをそのままイベント名にする｡中身をデータとして受け渡す
					}
					//json.data
					/*if(json.data.terop){
						displayEventDispatcher.dispatchEvent(new DisplayEvent(DisplayEvent.TEROP_EVENT,json.data.terop));
					}
					if(json.data.color){
						displayEventDispatcher.dispatchEvent(new DisplayEvent(DisplayEvent.COLOR_EVENT,json.data.color));
					}*/
					
					break;
				case "test":
					break;
			}
		}
		private function ioErrorHandler(event:IOErrorEvent):void{
			trace(event.text);
		}
		private function securityErrorHandler(event:SecurityErrorEvent):void{
			trace(event);
		}
	}
}
