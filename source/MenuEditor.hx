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
	private var gamesave1:FlxSave;
	private var gamesave2:FlxSave;
	private var gamesave3:FlxSave;
	private var gamesave4:FlxSave;
	private var gamesave5:FlxSave;
	private var gamesave6:FlxSave;
	private var gameSprite1:FlxSprite;
	private var gameSprite2:FlxSprite;
	private var gameSprite3:FlxSprite;
	private var gameSprite4:FlxSprite;
	private var gameSprite5:FlxSprite;
	private var gameSprite6:FlxSprite;
	
	
	
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic(AssetPaths.partidas__jpg);
		add(Menu);
		Reg.stateString = "MenuEditor";
		gamesave1 = new FlxSave();
		gamesave2 = new FlxSave();
		gamesave3 = new FlxSave();
		gamesave4 = new FlxSave();
		gamesave5 = new FlxSave();
		gamesave6 = new FlxSave();
		gamesave1.bind("Create1");
		gamesave2.bind("Create2");
		gamesave3.bind("Create3");
		gamesave4.bind("Create4");
		gamesave5.bind("Create5");
		gamesave6.bind("Create6");
		gameSprite1 = new FlxSprite(258, 314);
		gameSprite2 = new FlxSprite(549, 314);
		gameSprite3 = new FlxSprite(844, 314);
		gameSprite4 = new FlxSprite(258, 568);
		gameSprite5 = new FlxSprite(549, 568);
		gameSprite6 = new FlxSprite(844, 568);
		add(gameSprite1);
		add(gameSprite2);
		add(gameSprite3);
		add(gameSprite4);
		add(gameSprite5);
		add(gameSprite6);
		if (gamesave1.data.Create1 == null)
		{
			gameSprite1.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite1.loadGraphic(AssetPaths.load__png);
		}
		if (gamesave2.data.Create1 == null)
		{
			gameSprite2.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite2.loadGraphic(AssetPaths.load__png);
		}
		if (gamesave3.data.Create1 == null)
		{
			gameSprite3.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite3.loadGraphic(AssetPaths.load__png);
		}
		if (gamesave4.data.Create1 == null)
		{
			gameSprite4.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite4.loadGraphic(AssetPaths.load__png);
		}
		if (gamesave5.data.Create1 == null)
		{
			gameSprite5.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite5.loadGraphic(AssetPaths.load__png);
		}
		if (gamesave6.data.Create1 == null)
		{
			gameSprite6.loadGraphic(AssetPaths.new__png);
		}
		else
		{
			gameSprite6.loadGraphic(AssetPaths.load__png);
		}
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
}