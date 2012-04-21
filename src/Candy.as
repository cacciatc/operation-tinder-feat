package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Candy extends Entity 
	{
		
		[Embed(source = "../assets/candy.png")] public static const CANDY:Class;
		
		public var moraleBonus:uint;
		
		public var sprite:Spritemap = new Spritemap(CANDY, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public function Candy(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			type = "Candy";
			moraleBonus = 25;
		}
		
	}

}