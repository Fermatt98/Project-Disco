package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredA = new Pared();
		Reg.paredB = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.TrampaDisco = new CajaDisco(200, 10, 30, 0.5, 500);
		Reg.TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
		Reg.TrampaDisco3 = new CajaDisco(600, 10,10, 4, 300);
		add(Reg.TrampaDisco);
		add(Reg.TrampaDisco2);
		add(Reg.TrampaDisco3);
		add(Reg.piso);
		add(Reg.paredA);
		add(Reg.paredB);
		add(Reg.techo);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
		FlxG.debugger.visible = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
