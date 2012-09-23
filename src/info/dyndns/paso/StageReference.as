package info.dyndns.paso
{
	import flash.display.Stage;
	
	public class StageReference{
		public static var stage:Stage
		
		public static function get stageWidth():Number{
			return (stage!=null)? stage.stageWidth : DEFAULT_STAGE_WIDTH;
		}
		
		public static function get stageHeight():Number{
			return (stage!=null)? stage.stageHeight : DEFAULT_STAGE_HEIGHT;
		}
	}
}