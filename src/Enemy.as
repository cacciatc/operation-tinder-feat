package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Enemy extends Entity 
	{
		
		[Embed(source = "../assets/enemy.png")] public static const ENEMY:Class;
		
		public var sprite:Spritemap = new Spritemap(ENEMY, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		
		public var morale:int;
		public function Enemy(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			morale = 50;
		}
		
		override public function update():void
		{
			if (collide("Water", x, y))
			{
				morale -= 5;
			}
			
			if (morale <= 0)
			{
				FP.world.remove(this);
			}
		}
		
	}

}