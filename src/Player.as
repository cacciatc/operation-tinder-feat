package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../assets/player.png")] public static const PLAYER:Class;
		
		public var sprite:Spritemap = new Spritemap(PLAYER, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public function Player(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.DOWN))
			{
				FP.camera.y += 50;
			}
		}
		
	}

}