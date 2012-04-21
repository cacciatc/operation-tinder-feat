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
			super(800, 1800, 60, true);
			
			FP.world = new GameStage();
		}
	}
	
}