package info.dyndns.paso.MJSEvent
{
	import flash.events.*;
	
	public interface MessageListener extends EventDispatcher
	{
		function messageThrow(DisplayEvent):void;
	}
}