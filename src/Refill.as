package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Refill extends Entity 
	{
		
		[Embed(source = "../assets/refill.png")] public static const REFILL:Class;
		[Embed(source = "../assets/refill.mp3")] public static const REFILL_SOUND:Class;
		
		public var sprite:Spritemap = new Spritemap(REFILL, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public var sound:Sfx = new Sfx(REFILL_SOUND);
		public var ammoBonus:uint;
		
		public function Refill(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			type = "Refill";
			ammoBonus = 15;
		}
		
		public function proc():void
		{
			sound.play();
		}
		
	}

}