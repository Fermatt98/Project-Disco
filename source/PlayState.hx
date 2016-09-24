package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.TrampaDisco = new CajaDisco(200, 10, 30, 0.5, 500);
		Reg.TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
		Reg.TrampaDisco3 = new CajaDisco(600, 10, 10, 4, 300);
		pixelRain = new PixelRain(0.2);
		Reg.Luz1 = new CajaLuz(300, 10, 0.5, 1);
		Reg.Luz2 = new CajaLuz(500, 10, 1, 1);
		Reg.Luz3 = new CajaLuz(100, 10, 0.3, 0.7);
		Reg.Luz4 = new CajaLuz(700, 10, 1.3, 0.5);
		add(Reg.TrampaDisco);
		add(Reg.TrampaDisco2);
		add(Reg.TrampaDisco3);
		add(Reg.Luz1);
		add(Reg.Luz2);
		add(Reg.Luz3);
		add(Reg.Luz4);
		add(pixelRain);
		add(Reg.piso);
		add(Reg.paredIzq);
		add(Reg.paredDer);
		add(Reg.techo);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
		FlxG.debugger.visible = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
