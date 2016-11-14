package;

import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class ConsolaTexto extends FlxText
{
	private var _Text:String;
	
	public function new(X:Float=0, Y:Float=0, ?Text:String, Text2:String, FieldWidth:Float=0, Size:Int=36, EmbeddedFont:Bool=true) 
	{
		super(X, Y, FieldWidth, Text, Size, EmbeddedFont);
		text = Text +" " + Text2;
		_Text = Text;
		FlxG.state.add(this);
		color = 0x00000000;
		
	}
	
	public function cambio(num:String)
	{
		text = _Text +" "+ num;
	}
}