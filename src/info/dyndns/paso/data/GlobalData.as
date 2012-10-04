package info.dyndns.paso.data
{
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author wizard_paso
	 */
	public class GlobalData 
	{
		public static const WIDTH:uint = 960;
		public static const HEIGHT:uint = 540;
		public static var stage:Stage=null;//デフォルトnullにしておく
		
		private static var _network:Boolean=false;
		
		public function GlobalData() 
		{
			
		}
		public static function get network():Boolean{
			return _network;
		}
		public static function set network(value:Boolean):void{
			_network=value;
		}
		
	}

}