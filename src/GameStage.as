package  
{
	import flash.display.GraphicsGradientFill;
	import flash.xml.XMLNode;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import punk.ui.PunkLabel;
	import punk.ui.PunkPanel;
	import punk.ui.skins.RolpegeBlue;
	
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class GameStage extends GameWorld 
	{
		[Embed(source = "../stages/1.oel", mimeType = "application/octet-stream")] public static const STAGE_1:Class;
		[Embed(source = "../assets/tiles.png")] public static const TILES:Class;
		
		public static const TILE_SIZE:uint = 32;
		
		public var stageFile:Class;
		public var stageData:XML;
		
		public var width:uint;
		public var height:uint;
		
		public var hardThings:Grid;
		public var tileThings:Tilemap;
		
		public var player:Player;
		
		public function GameStage(file:Class = null) 
		{
			// defaults to stage 1
			if (file == null) {
				file = STAGE_1;
			}
			
			stageFile = file;
			stageData = FP.getXML(file);
			
			width = int(stageData.@width);
			height = int(stageData.@height);
			
			hardThings = new Grid(width, height, TILE_SIZE, TILE_SIZE);
			hardThings.loadFromString(stageData.Walls, "", "\n");
			addMask(hardThings, "HardThings");
			
			var obj:XML;
			
			tileThings = new Tilemap(TILES, width, height, TILE_SIZE, TILE_SIZE);
			for each (obj in stageData.Tiles.tile) {
				tileThings.setTile(int(obj.@x), int(obj.@y), int(obj.@tx));
			}
			addGraphic(tileThings, 5);

			for each (obj in stageData.Objects.Player) {
				add(player = new Player(int(obj.@x), int(obj.@y)));
			}
			
			for each (obj in stageData.Objects.Enemy) {
				add(new Enemy(int(obj.@x), int(obj.@y)));
			}
			
			// add prisioners
			Stats.totalPrisoners = 0;
			Stats.rescuedPrisoners = 0;
			for each (obj in stageData.Objects.Prisoner) {
				add(new Prisoner(int(obj.@x), int(obj.@y)));
				Stats.totalPrisoners += 1;
			}
			
			// add refills
			for each (obj in stageData.Objects.Refill) {
				add(new Refill(int(obj.@x), int(obj.@y)));
			}
			
			// add candy
			for each (obj in stageData.Objects.Candy) {
				add(new Candy(int(obj.@x), int(obj.@y)));
			}
			
			// add keys
			for (var k:String in stageData.Objects.Key) {
				//add(new Key(k.@x, k.@y));
			}
			
			// add locks
			for (var l:String in stageData.Objects.Lock) {
				//add(new Lock(l.@x, l.@y));
			}
			
			camera.x = int(stageData.@camerax);
			camera.y = int(stageData.@cameray);
			
			add(new TextBox(""));
		}
		
		override public function update():void
		{
			super.update();
			camera.x += ((player.x - 200+16)-camera.x)*0.1;
			camera.y += ((player.y - 150) - camera.y) * 0.1;
			
			if (Stats.rescuedPrisoners == Stats.totalPrisoners) {
				FP.world = new YouWon();
			}
			
		}
		
	}

}