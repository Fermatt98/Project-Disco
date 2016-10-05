package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	private var timer:Float = 0;
	private var arma:Int = 0;
	private var BotonTiros:FlxSprite;
	private var BotonTirosMenos:FlxSprite;
	private var BotonDelay:FlxSprite;
	private var BotonDelayMenos:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		add(Reg.player);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.EdicionControl = new EdicionOn(50,50);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.Consol = new Array<Consola>();
		//------Botones-----//
		BotonTiros = new Boton(220, 103, true);
		BotonTirosMenos = new Boton(73, 103, false);
		BotonDelay = new Boton(310, 129, true);
		BotonDelayMenos = new Boton(73, 129, false);
		//-----FinBotones---//
		Reg.Consol[0] = new Consola(100, 100, "Cantidad", Reg.CantDiscos);
		Reg.Consol[1] = new Consola(100,125,"Tiempo disparo", Reg.DelayDiscos);
		FlxG.sound.playMusic(AssetPaths.Game__wav);
		//FlxG.debugger.visible = true;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timer += elapsed;
		//----Editor----//
		if (BotonTiros.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed)
		{
			Reg.CantDiscos += 1;
			Reg.Consol[0].cambio(Reg.CantDiscos);
		}
		if (BotonTirosMenos.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed && Reg.CantDiscos > 0)
		{
			Reg.CantDiscos -= 1;
			Reg.Consol[0].cambio(Reg.CantDiscos);
		}
		if (BotonDelay.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed)
		{
			Reg.DelayDiscos += 0.1;
			Reg.Consol[1].cambio(Reg.DelayDiscos);
		}
		if (BotonDelayMenos.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed && Reg.DelayDiscos > 0)
		{
			Reg.DelayDiscos -= 0.1;
			Reg.Consol[1].cambio(Reg.DelayDiscos);
		}
		//---Fin Editor---//
		if (FlxG.mouse.justPressed && arma == 1)
		{
			Reg.CajaDiscos[Reg.CantCajaDiscos] = new CajaDisco(FlxG.mouse.x, FlxG.mouse.y, Reg.CantDiscos,Reg.DelayDiscos,500);
			Reg.CantCajaDiscos += 1;
		}
		if (FlxG.mouse.justPressed && arma == 2)
		{
			Reg.CajaLuzes[Reg.CantCajaLuzes] = new CajaLuz(FlxG.mouse.x, FlxG.mouse.y, 0.5,1);
			Reg.CantCajaLuzes += 1;
		}
		if (FlxG.mouse.justPressed && arma == 3)
		{
			Reg.CajaLacer[Reg.CantCajaLacer] = new Laser(FlxG.mouse.x, FlxG.mouse.y, true,false, 100, 4, 3);
			Reg.CantCajaLacer += 1;
		}
		if (FlxG.mouse.justPressed && arma == 4)
		{
			Reg.CajaPixel[Reg.CantCajaPixel] = new PixelRain(FlxG.mouse.x, FlxG.mouse.y, 0.5);
			Reg.CantCajaPixel += 1;
		}
		
		if (FlxG.keys.justPressed.ONE)
		{
			if (arma == 1)
			{
				arma = 0;
				Reg.EdicionControl.cambio(true);
			}
			else
			{
				arma = 1;
				Reg.EdicionControl.cambio(false);
			}
		}
		if (FlxG.keys.justPressed.TWO)
		{
			if (arma == 2)
			{
				arma = 0;
				Reg.EdicionControl.cambio(true);
			}
			else
			{
				arma = 2;
				Reg.EdicionControl.cambio(false);
			}
		}
		if (FlxG.keys.justPressed.THREE)
		{
			if (arma == 3)
			{
				arma = 0;
				Reg.EdicionControl.cambio(true);
			}
			else
			{
				arma = 3;
				Reg.EdicionControl.cambio(false);
			}
		}
		if (FlxG.keys.justPressed.FOUR)
		{
			if (arma == 4)
			{
				arma = 0;
				Reg.EdicionControl.cambio(true);
			}
			else
			{
				arma = 4;
				Reg.EdicionControl.cambio(false);
			}
		}
	}
}
