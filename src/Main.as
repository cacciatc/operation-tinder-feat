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
			super(800, 600, 60, false);
			
			//? FP.screen.scale = 2;
			FP.world = new GameWorld();
		}
	}
	
}