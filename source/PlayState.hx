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
	private var timer:Float = 0;
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.TrampaDisco = new CajaDisco(200, 10, 30, 4, 500);
		Reg.TrampaDisco.kill();
		/*
		Reg.TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
		Reg.TrampaDisco3 = new CajaDisco(600, 10, 10, 0.5, 300);
		*/
		pixelRain = new PixelRain(0.2);
		pixelRain.kill();
		Reg.Luz1 = new CajaLuz(300, 10, 0.5, 1);
		Reg.Luz1.kill();
		/*
		Reg.Luz2 = new CajaLuz(500, 10, 1, 1);
		Reg.Luz3 = new CajaLuz(100, 10, 0.3, 0.7);
		Reg.Luz4 = new CajaLuz(700, 10, 1.3, 0.5);
		*/
		Reg.Laser1 = new Laser(0, 0, true, true, 100, 2, 2);
		Reg.Laser1.kill();
		/*
		Reg.Laser2 = new Laser(0, 600, true, false, 100,2,2);
		Reg.Laser3 = new Laser(0,0, false, true, 100,2,2);
		Reg.Laser4 = new Laser(800,0,false,false,100,2,2);
		*/
		FlxG.sound.playMusic(AssetPaths.Game__wav);
		//FlxG.debugger.visible = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!Reg.player.exists)
		{
			timer += elapsed;
			if (timer > 2)
			{
				Reg.player.revive();
				timer = 0;
			}
		}
		if (FlxG.keys.justPressed.ONE)
		{
			if (Reg.TrampaDisco.exists)
			{
				Reg.TrampaDisco.kill();
				Reg.TrampaDisco2.kill();
				Reg.TrampaDisco3.kill();
			}
			else
			{
				Reg.TrampaDisco = new CajaDisco(200, 10, 30, 4, 500);
				Reg.TrampaDisco2 = new CajaDisco(400, 10,20, 2, 400);
				Reg.TrampaDisco3 = new CajaDisco(600, 10, 10, 0.5, 300);
			}
		}
		if (FlxG.keys.justPressed.TWO)
		{
			if (pixelRain.exists)
			{
				pixelRain.kill();
			}
			else
			{
				pixelRain = new PixelRain(0.2);
			}
		}
		if (FlxG.keys.justPressed.THREE)
		{
			if (Reg.Luz1.exists)
			{
				Reg.Luz1.kill();
				Reg.Luz2.kill();
				Reg.Luz3.kill();
				Reg.Luz4.kill();
			}
			else
			{
				Reg.Luz1 = new CajaLuz(300, 10, 0.5, 1);
				Reg.Luz2 = new CajaLuz(500, 10, 1, 1);
				Reg.Luz3 = new CajaLuz(100, 10, 0.3, 0.7);
				Reg.Luz4 = new CajaLuz(700, 10, 1.3, 0.5);
			}
		}
		if (FlxG.keys.justPressed.FOUR)
		{
			if (Reg.Laser1.exists)
			{
				Reg.Laser1.kill();
				Reg.Laser2.kill();
				Reg.Laser3.kill();
				Reg.Laser4.kill();
			}
			else
			{
				Reg.Laser1 = new Laser(0, 0, true, true, 100, 2, 2);
				Reg.Laser2 = new Laser(0, 600, true, false, 100,2,2);
				Reg.Laser3 = new Laser(0,0, false, true, 100,2,2);
				Reg.Laser4 = new Laser(800,0,false,false,100,2,2);
			}
		}
	}
}
