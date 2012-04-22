package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.Tween;
	import Stats;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Prisoner extends Entity 
	{
		
		[Embed(source = "../assets/prisoner.png")] public static const PRISONER:Class;
		[Embed(source = "../assets/rescue.mp3")] public static const RESCUE:Class;
		
		public var sound:Sfx = new Sfx(RESCUE);
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
				Stats.rescuedPrisoners += 1;
				sound.play();
				FP.world.remove(this);
			}
		}
		
	}

}