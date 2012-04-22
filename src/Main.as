package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Main extends Engine 
	{
		public function Main()
		{
			super(400, 400, 60, true);
			FP.screen.scale = 2;
			FP.world = new Instructions();
			//FP.world = new GameStage();
		}
	}
	
}