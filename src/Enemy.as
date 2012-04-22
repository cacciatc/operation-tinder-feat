package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Enemy extends Entity 
	{
		
		[Embed(source = "../assets/enemy.png")] public static const ENEMY:Class;
		[Embed(source = "../assets/death.mp3")] public static const DEATH:Class;
		
		public var sprite:Spritemap = new Spritemap(ENEMY, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		public var deathSound:Sfx = new Sfx(DEATH);
		
		public var morale:int;
		
		public var target:Point;
		public var v:Point;
		
		public const NORTH:int = 1;
		public const SOUTH:int = 2;
		public const EAST:int  = 3;
		public const WEST:int  = 4;
		
		public var facing:int;
		public var shootTimer:Number;
		
		public function Enemy(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			morale = 50;
			v = new Point();
			target = new Point(x, y);
			facing = NORTH;
			shootTimer = 0;
		}
		
		override public function update():void
		{
			checkCollision();
			var water:Entity;
			if ((water = collide("Water", x, y)))
			{
				morale -= 10;
				FP.world.remove(water);			
			}
			
			if (morale <= 0)
			{
				deathSound.play();
				FP.world.remove(this);
			}
			
			var player:Player = Player(FP.world.typeFirst("Player"));
			if (distanceToPoint(player.x, player.y) < 160)
			{
				aim(player.x,player.y);
				shoot();
			}
		}
		
		public function checkCollision():void
		{
			if (distanceToPoint(target.x,target.y) < 2)
			{
				v = new Point();
				target = new Point();
			}
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
		
		public function shoot():void 
		{
			shootTimer += FP.elapsed;
			if (shootTimer > 1)
			{
			// which way are we facing?
			var p:Point = new Point();
			var xsign:int=1;
			var ysign:int = 1;
					
			switch(facing)
			{
						case NORTH:
							p.x = x;
							p.y = y - 32;
							xsign = 0;
							ysign *= -1;
						break;
						case SOUTH:
							p.x = x;
							p.y = y + GameStage.TILE_SIZE + 10;

							xsign = 0;
						break;
						case EAST:
							p.x = x + GameStage.TILE_SIZE + 10;
							p.y = y;
							ysign = 0;

						break;
						case WEST:
							p.x = x - 32;
							p.y = y;
							xsign *= -1;
							ysign = 0;
						break;
					}
			FP.world.add(new WaterJet(p.x, p.y, (250) * xsign, (250) * ysign));
			shootTimer = 0;
			}
			
		}
		
		public function aim(px:int,py:int):void
		{
			if (px == x || py == y)
			{
				return;
			}
			if (Math.abs(px - x) > Math.abs(py - y))
			{
				target = new Point(x, py);
				v = new Point(0, (py - y));
				if (px -x) {
					facing = WEST;
				}
				else
				{
					facing = EAST;
				}
			}
			else
			{
				target = new Point((px - x), 0);
				if (py-y) {
					facing = SOUTH;
				}
				else
				{
					facing = NORTH;
				}
			}
			
		}
		
	}

}