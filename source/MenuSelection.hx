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
class MenuSelection extends FlxState
{
	private var Menu:FlxSprite;
	private var start:Bool = false;
	private var historia:FlxSprite;
	private var Editor:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic("assets/images/AnimacionMenu/escritorio_90.jpg");
		add(Menu);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!start)
		{
			if (FlxG.mouse.justPressed)
			{
				start = true;
				Menu.loadGraphic(AssetPaths.Menu__jpg);
				historia = new FlxSprite(
			}
		}
		
	}
}