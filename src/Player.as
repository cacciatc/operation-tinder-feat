package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Player extends Entity 
	{
		[Embed(source = "../assets/player.png")] public static const PLAYER:Class;
		[Embed(source = "../assets/shoot.mp3")] public static const SHOOT:Class;
		
		public const SPEED:uint = 100;
		public const MAX_MORALE:int = 100;
		public const MAX_AMMO:int = 100;
		public const MAX_PRESSURE:int = 100;
		
		public var shootSound:Sfx = new Sfx(SHOOT);
		public var sprite:Spritemap = new Spritemap(PLAYER, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		
		public var v:Point;
		public var morale:int;
		public var ammo:int;
		public var pressure:int;
		
		public const NORTH:int = 1;
		public const SOUTH:int = 2;
		public const EAST:int  = 3;
		public const WEST:int  = 4;
		
		public var facing:int;
		
		public var shooting:Boolean;
		
		public var pressureTimer:Number;
		
		public function Player(x:int, y:int) 
		{
			super(x, y, sprite);
			setHitbox(32, 32);
			type = "Player";
			v = new Point(0, 0);
			morale = MAX_MORALE;
			ammo = MAX_AMMO;
			pressure = 0;
			pressureTimer = 0;
			shooting = false;
			facing = NORTH;
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
			
			var powerup:Entity;
			if ((powerup = collide("Candy", x, y)) && morale < MAX_MORALE) {
				morale += Candy(powerup).moraleBonus;
				morale %= 101;
				Candy(powerup).proc();
				FP.world.remove(powerup);
			}
			
			if ((powerup = collide("Refill", x, y)) && ammo < MAX_AMMO) {
				ammo += Refill(powerup).ammoBonus;
				ammo %= 101;
				Refill(powerup).proc();
				FP.world.remove(powerup);
			}
			
			var water:Entity;
			if ((water = collide("Water", x, y)))
			{
				morale -= 2;
				FP.world.remove(water);
			}
		}
		
		public function pump():void 
		{
			if (pressure < MAX_PRESSURE)
			{
				pressure += 1;
				// make satisfying sound
			}
			else
			{
				// make a full sound?
			}
		}
		
		public function shoot():void
		{
			/*if (shooting) 
			{
				shooting = false;
				shootSound.stop();
			}
			else{*/
				if (ammo > 0 && pressure > 0)// && !shooting)
				{
					pressure -= 2;
					ammo -= 1;
					
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
					FP.world.add(new WaterJet(p.x,p.y,(200 + pressure*10) * xsign,(200 + pressure*10) * ysign));
					//shooting = true;
					//shootSound.play(0.08);
				}
				/*else 
				{
					// make a clicking sound maybe?
				}*/
			//}
		}
		
		private function degradePressure():void 
		{
			pressureTimer += FP.elapsed;

			if (pressureTimer > 1) {
				pressure -= 1;
				pressureTimer = 0;
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
				facing = SOUTH;
			}
			else if (Input.check(Key.UP)) 
			{
				v.y = -SPEED;
				facing = NORTH;
			}
			else if (Input.check(Key.RIGHT))
			{
				v.x = SPEED;
				facing = EAST;
			}
			else if (Input.check(Key.LEFT))
			{
				v.x = -SPEED;
				facing = WEST;
			}
			
			if (Input.pressed(Key.SPACE)) {
				shoot();
			}
			if (Input.pressed(Key.Z))
			{
				pump();
			}
			
			degradePressure();
			
			//if (shooting) {
				//pressure -= 1;
			//}
			if (pressure <= 0) {
				shooting = false;
				pressure = 0;
				//shootSound.stop();
			}
		}
		
	}

}