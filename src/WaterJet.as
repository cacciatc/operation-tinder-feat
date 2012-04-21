package  
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class WaterJet extends Entity 
	{
		[Embed(source = "../assets/water.png")] public const WATER:Class;
		public var sprite:Spritemap = new Spritemap(WATER, GameStage.TILE_SIZE, GameStage.TILE_SIZE);
		
		public var v:Point;
		public var timer:Number;
		
		public function WaterJet(x:int,y:int,dx:Number,dy:Number) 
		{
			v = new Point(dx, dy);
			super(x, y,sprite);
			setHitbox(5, 5);
			type = "Water";
			timer = 0;
		}
		
		override public function update():void
		{
			x += v.x * FP.elapsed;
			y += v.y * FP.elapsed;
			
			timer += FP.elapsed;
			if (timer > 5)
			{
				FP.world.remove(this);
			}
		}
		
	}

}