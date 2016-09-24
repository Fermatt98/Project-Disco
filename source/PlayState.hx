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
	//-------Escenario-------//
	private var piso:FlxSprite;
	private var paredA:FlxSprite;
	private var paredB:FlxSprite;
	private var techo:FlxSprite;
	//-------Armas------//
	private var TrampaDisco:FlxSprite;
	private var TrampaDisco2:FlxSprite;
	private var TrampaDisco3:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		player = new Player(FlxG.width/2, FlxG.height);
		add(player);
		piso = new Piso(0, 580);
		paredA = new Pared();
		paredB = new Pared(780, 0);
		techo = new Techo();
		TrampaDisco = new CajaDisco(200, 10, 30, 0.5, 500);
		TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
		TrampaDisco3 = new CajaDisco(600, 10,10, 4, 300);
		add(TrampaDisco);
		add(TrampaDisco2);
		add(TrampaDisco3);
		add(piso);
		add(paredA);
		add(paredB);
		add(techo);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
