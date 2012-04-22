package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Chris Cacciatore
	 */
	public class TextBox extends Entity 
	{
		
		public var text:Text;
		public function TextBox(msg:String) 
		{
			text = new Text(msg);
			text.scale = 1;
			super(0, 0, text);
			layer = -10;
			type = "Text";
		}
		
	}

}