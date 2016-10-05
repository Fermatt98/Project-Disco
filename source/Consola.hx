package;

import flixel.text.FlxText;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Consola extends FlxText
{
	private var _Text:String;
	public function new(X:Float=0, Y:Float=0, ?Text:String, Numero:Float, FieldWidth:Float=0, Size:Int=18, EmbeddedFont:Bool=true) 
	{
		super(X, Y, FieldWidth, Text, Size, EmbeddedFont);
		text = Text +" " + Numero;
		_Text = Text;
		FlxG.state.add(this);
	}
	public function cambio(num:Float)
	{
		text = _Text +" "+ num;
	}
	
}