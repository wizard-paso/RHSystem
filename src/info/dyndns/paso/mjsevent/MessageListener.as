package info.dyndns.paso.mjsevent
{
	import flash.events.*;
	
	public interface MessageListener extends EventDispatcher
	{
		function messageThrow(DisplayEvent):void;
	}
}