package  
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class Stage extends GameWorld 
	{
		[Embed(source = "../stages/1.oel", mimeType = "application/octet-stream")] public static const STAGE_1:Class;
		
		const public var TILE_SIZE = 32;
		
		public var stageFile:Class;
		public var stageData:XML;
		
		public var uint width;
		public var uint height;
		
		public var hardThings:Grid;
		public var tileThings:Tilemap;
		
		//public var player:Player;
		
		public function Stage(file:Class = null) 
		{
			// defaults to stage 1
			if (fille == null) {
				file = STAGE_1;
			}
			
			stageFile = file;
			stageData = FP.getXML(file);
			
			width = stageData.@width;
			height = stageDate.@height;
			
			hardThings = new Grid(width, height, TILE_SIZE, TILE_SIZE);
			hardThings.loadFromString(stageData.Walls, "", "\n");
			addMask(hardThings, "HardThings");
			
			// load tilemap here
			//tileThings = new Tilemap(TILE_SIZE, width, height, TILE_SIZE, TILE_SIZE);
			
			
			// add players
			for (var p:XML in stageData.Objects.Player) {
				//add(player = new Player(p.@x, p.@y));
			}
			
			// add enemies
			for (var e:XML in stageData.Objects.Enemy) {
				//add(new Enemy(e.@x, e.@y));
			}
			
			// add prisioners
			for (var p:XML in stageData.Objects.Prisioner) {
				//add(new Prisioner(p.@x, p.@y));
			}
			
			// add power-ups
			for (var p:XML in stageData.Objects.Powerup) {
				//add(new Powerup(p.@x, p.@y));
			}
			
			// add keys
			for (var k:XML in stageData.Objects.Key) {
				//add(new Key(k.@x, k.@y));
			}
			
			// add locks
			for (var l:XML in stageData.Objects.Lock) {
				//add(new Lock(l.@x, l.@y));
			}
		}
		
	}

}