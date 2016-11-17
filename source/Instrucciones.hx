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
	private var start:Bool = false;
	private var historia:FlxSprite;
	private var Editor:FlxSprite;
	private var comic:FlxState;
	private var menuEditor:FlxState;
	private var instrucciones:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic(AssetPaths.instrucciones__png);
		add(Menu);
		comic = new Comic();
		menuEditor = new MenuEditor();
		Reg.stateString = "MenuSelection";
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
}