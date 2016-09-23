package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var player:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		player = new Player(FlxG.width/2, FlxG.height);
		add(player);
		//PUTO EL QUE LEE
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
