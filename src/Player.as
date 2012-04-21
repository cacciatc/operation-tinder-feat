package  
{
	import flash.geom.Point;
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
		
		public const SPEED:uint = 100;
		
		public var sprite:Spritemap = new Spritemap(PLAYER, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		
		public var v:Point;
		
		public function Player(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			v = new Point(0, 0);
		}
		
		public function checkCollision():void
		{
			x += v.x * FP.elapsed;
			if (collide("HardThings", x, y)) {
				if (FP.sign(v.x) > 0) 
				{
					v.x = 0;
					x = Math.floor(x/32)*32 + 32 - width;
				}
				else {
					v.x = 0;
					x = Math.floor(x/32)*32 + 32;
				}
			}
			
			y += v.y * FP.elapsed;
			if (collide("HardThings", x, y)) {
				if (FP.sign(v.y) > 0) {
					v.y = 0;
					y = Math.floor(y/32)*32 + 32 - height;
				}
				else {
					v.y = 0;
					y = Math.floor(y/32)*32 + 32;
				}
			}
		}
		
		override public function update():void 
		{
			checkCollision();
			v.x = 0;
			v.y = 0;
			if (Input.check(Key.DOWN))
			{
				v.y = SPEED;
			}
			if (Input.check(Key.UP)) 
			{
				v.y = -SPEED;
			}
			if (Input.check(Key.RIGHT))
			{
				v.x = SPEED;
			}
			if (Input.check(Key.LEFT))
			{
				v.x = -SPEED;
			}
		}
		
	}

}