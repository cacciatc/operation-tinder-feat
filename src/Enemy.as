package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Enemy extends Entity 
	{
		
		[Embed(source = "../assets/enemy.png")] public static const ENEMY:Class;
		
		public var sprite:Spritemap = new Spritemap(ENEMY, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public function Enemy(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
		}
		
	}

}