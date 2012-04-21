package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Refill extends Entity 
	{
		
		[Embed(source = "../assets/refill.png")] public static const REFILL:Class;
		
		public var sprite:Spritemap = new Spritemap(REFILL, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		
		public var ammoBonus:uint;
		public function Refill(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			type = "Refill";
			ammoBonus = 15;
		}
		
	}

}