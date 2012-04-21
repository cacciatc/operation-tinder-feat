package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Prisoner extends Entity 
	{
		
		[Embed(source = "../assets/prisoner.png")] public static const PRISONER:Class;
		
		public var sprite:Spritemap = new Spritemap(PRISONER, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public function Prisoner(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
		}
		
	}

}