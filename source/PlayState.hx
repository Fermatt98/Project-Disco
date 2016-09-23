package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
<<<<<<< HEAD
	//-------Ecenario-------//
	private var piso:FlxSprite;
	private var paredA:FlxSprite;
	private var paredB:FlxSprite;
	private var techo:FlxSprite;
	//-------Armas------//
	private var TrampaDisco:FlxSprite;
	override public function create():Void
	{
		super.create();
		piso = new Piso(0, 580);
		paredA = new Pared();
		paredB = new Pared(780, 0);
		techo = new Techo();
		TrampaDisco = new CajaDisco(50,50,4);
		add(TrampaDisco);
		add(piso);
		add(paredA);
		add(paredB);
		add(techo);
=======
	private var player:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		player = new Player(FlxG.width/2, FlxG.height);
		add(player);
>>>>>>> refs/remotes/origin/master
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
