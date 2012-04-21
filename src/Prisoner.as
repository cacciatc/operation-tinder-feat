package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Tween;
	
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
			type = "Prisoner";
		}
		
		override public function update():void
		{
			if (collide("Player", x, y))
			{
				//add fade in and out tween!
			}
		}
		
	}

}