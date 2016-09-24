package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	//private var pixelRain:PixelRain;
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		/*Reg.TrampaDisco = new CajaDisco(200, 10, 30, 0.5, 500);
		Reg.TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
		Reg.TrampaDisco3 = new CajaDisco(600, 10, 10, 4, 300);
		pixelRain = new PixelRain(0.2);
		Reg.Luz1 = new CajaLuz(300, 10, 0.5, 1);
		Reg.Luz2 = new CajaLuz(500, 10, 1, 1);
		Reg.Luz3 = new CajaLuz(100, 10, 0.3, 0.7);
		Reg.Luz4 = new CajaLuz(700, 10, 1.3, 0.5);*/
		Reg.Laser1 = new Lase(0, 0, true, true, 100,3);
		Reg.Laser2 = new Lase(0, 600, true, false, 100,4);
		Reg.Laser3 = new Lase(0,0, false, true, 100,3);
		Reg.Laser4 = new Lase(800,0,false,false,100,4);
		/*add(Reg.TrampaDisco);
		add(Reg.TrampaDisco2);
		add(Reg.TrampaDisco3);
		add(Reg.Luz1);
		add(Reg.Luz2);
		add(Reg.Luz3);
		add(Reg.Luz4);
		add(pixelRain);*/
		add(Reg.piso);
		add(Reg.paredIzq);
		add(Reg.paredDer);
		add(Reg.techo);
		add(Reg.Laser1);
		add(Reg.Laser2);
		add(Reg.Laser3);
		add(Reg.Laser4);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
	//	FlxG.debugger.visible = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
