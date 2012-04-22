package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Instructions extends World 
	{
		
		public function Instructions() 
		{
			add(new TextBox("OPERATION TINDER FEAT\n\nRescue all the prisoners from your\nneighborhood.\n\n Use the arrow keys to move.\n SPACE to shoot.\n 'Z' to build pressure for your gun.\n\nPress any key to continue."))
		}
		
		override public function update():void
		{
			if (Input.pressed(Key.ANY)) 
			{
				FP.world = new GameStage();
			}
		}
		
	}

}