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
	private var comic:FlxState;
	private var menuEditor:FlxState;
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic("assets/images/AnimacionMenu/escritorio_90.jpg");
		add(Menu);
		comic = new Comic();
		menuEditor = new MenuEditor();
		Reg.stateString = "MenuSelection";
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
				historia = new FlxSprite(206, 424);
				historia.loadGraphic(AssetPaths.historia2__png);
				Editor = new FlxSprite(711, 424);
				Editor.loadGraphic(AssetPaths.Editor2__png);
				add(historia);
				add(Editor);
			}
		}
		else
		{
			if (FlxG.mouse.overlaps(historia))
			{
				historia.loadGraphic(AssetPaths.historia__png);
				if (FlxG.mouse.justPressed)
				{
					FlxG.switchState(comic);
				}
			}
			else
			{
				historia.loadGraphic(AssetPaths.historia2__png);
			}
			if (FlxG.mouse.overlaps(Editor))
			{
				Editor.loadGraphic(AssetPaths.Editor__png);
				if (FlxG.mouse.justPressed)
				{
					FlxG.switchState(menuEditor);
				}
			}
			else
			{
				Editor.loadGraphic(AssetPaths.Editor2__png);
			}
		}
	}
}