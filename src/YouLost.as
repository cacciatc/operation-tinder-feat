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
	public class YouLost extends World 
	{
		
		public function YouLost() 
		{
			add(new TextBox("This isn't worth it!\n\nTry again?\n\nPress any key."))
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