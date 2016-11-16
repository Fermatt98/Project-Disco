package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxSave;
/**
 * ...
 * @author ...
 */
class MenuEditor extends FlxState
{
	private var Menu:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic(AssetPaths.partidas__jpg);
		add(Menu);
		Reg.stateString = "MenuEditor";
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
}