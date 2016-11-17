package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
/**
 * ...
 * @author ...
 */
class Instrucciones extends FlxState
{
	private var Menu:FlxSprite;
	private var nextState:FlxState;
	private var flecha:FlxSprite;
	private var int:Int = 0;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic(AssetPaths.instrucciones__png);
		add(Menu);
		nextState = new MenuSelection();
		Reg.stateString = "Instrucciones";
		flecha = new FlxSprite(FlxG.width, 0);
		flecha.loadGraphic(AssetPaths.Next2__png);
		flecha.x -= flecha.width;
		add(flecha);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(flecha) && FlxG.mouse.justPressed)
		{
			int++;
			if (int > 1)
			{
				FlxG.switchState(nextState);
			}
			else
			{
				Menu.loadGraphic(AssetPaths.instrucciones2__png);
			}
		}
	}
}