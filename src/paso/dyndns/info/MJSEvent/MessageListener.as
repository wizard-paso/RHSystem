package paso.dyndns.info.MJSEvent
{
	import flash.events.*;
	
	public interface MessageListener extends EventDispatcher
	{
		function messageThrow(DisplayEvent):void;
	}
}