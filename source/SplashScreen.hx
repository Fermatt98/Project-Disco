package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class SplashScreen extends FlxState
{
	private var Menu:FlxSprite;
	private var _time:Float = 0;
	private var counter:Int = 0;
	private var nextState:FlxState;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic(AssetPaths.Bestin__png);
		add(Menu);
		nextState = new MenuState();
		Reg.stateString = "SplashScreen";
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_time += elapsed;
		if (_time > 5)
		{
			FlxG.switchState(nextState);
		}
	}
}
