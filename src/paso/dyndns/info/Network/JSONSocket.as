package paso.dyndns.info.Network
{
	import flash.events.*;
	import flash.net.Socket;
	import flash.sampler.Sample;
	import paso.dyndns.info.MJSEvent.*;

	public class JSONSocket extends Socket
	{
		private var displayEventDispatcher:DisplayEventDispatcher
		
		public function JSONSocket(host:String,port:int)
		{
			super(host,port);
			addEventListener(Event.CONNECT,connectHandler);
			addEventListener(Event.CLOSE,closeHandler);
			addEventListener(ProgressEvent.SOCKET_DATA, socketDataHandler);
			addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
			displayEventDispatcher=DisplayEventDispatcher.getInstance()//ここはクラス変数でなくローカル変数でいい｡
			//displayEventDispatcher.debug();
		}
		//connectメソッド
		private function send(value:String):void{
			writeUTFBytes(value);
			writeByte(0);//nullByteを送ることによって区切りを示す
			flush();
		}
		public function JSONSend(value:Object):void{
			try{
				trace(JSON.stringify(value))
			send(JSON.stringify(value));
				}catch(error:Error){
					trace(error.toString());
				}
		}
		private function connectHandler(event:Event):void{
			//JSONSend({"type":"message" as String,"text":"\naiueo" as String})
			//trace("send")
		}
		private function closeHandler(event:Event):void{
			trace(Event.CLOSE);
		}
		private function socketDataHandler(event:ProgressEvent):void{
			//trace("trace="+readUTFBytes(bytesAvailable));
			var json:Object=JSON.parse(readUTFBytes(bytesAvailable));
			trace(JSON.stringify(json))
			switch(json.type){
				case "message":
					
					break;
				case "event":
					json.data//
					displayEventDispatcher.dispatchEvent(new DisplayEvent(DisplayEvent.TEROP_EVENT,json));
					
					break;
				case "test":
					break;
			}
		}
		private function messageThrow(event:Event):void{
			
		}
		private function ioErrorHandler(event:IOErrorEvent):void{
			trace(event.text);
		}
	}
}
