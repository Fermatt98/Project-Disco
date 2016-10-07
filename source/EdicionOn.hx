package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


/**
 * ...
 * @author ...
 */
class EdicionOn extends FlxSprite
{
	private var arma:Int = 0;
	private var activo:String = "NULL";
	private var armaUno:Bool = false;
	private var armaDos:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		this.color = 0xFF0000;
		FlxG.state.add(this);
	}
	public function cambio(prendido:Bool)
	{
		if (prendido == true)
		{
			this.color = 0xFF0000;
		}
		else if (prendido == false)
		{
			this.color = 0x2EFE2E;
		}
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.mouse.justPressed && arma == 1)
		{
			Reg.CajaDiscos[Reg.CantCajaDiscos] = new CajaDisco(FlxG.mouse.x, FlxG.mouse.y, Reg.CantDiscos,Reg.DelayDiscos,Reg.VelDiscos);
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
				cambio(true);
			}
			else
			{
				if (armaUno != true)
				{
					Reg.BotonEditor[0] = new Boton(230, 103, true, "Tiros");
					Reg.BotonEditor[1] = new Boton(73, 103, false, "TirosMenos");
					Reg.BotonEditor[2] = new Boton(315, 129, true, "Delay");
					Reg.BotonEditor[3] = new Boton(73, 129, false, "DelayMenos");
					Reg.BotonEditor[4] = new Boton(350, 155, true, "Velocidad");
					Reg.BotonEditor[5] = new Boton(73, 155, false, "VelocidadMenos");
					Reg.Consol[0] = new Consola(100, 100, "Cantidad", Reg.CantDiscos);
					Reg.Consol[1] = new Consola(100, 125, "Tiempo disparo", Reg.DelayDiscos);
					Reg.Consol[2] = new Consola(100, 150, "Velocidad disparo", Reg.VelDiscos);
				}
				activo = "armaUno";
				armaUno = true;
				arma = 1;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.TWO)
		{
			if (arma == 2)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				if (armaDos != true)
				{
					Reg.BotonEditor[6] = new Boton(230, 103, true, "DelayLuz");
					Reg.BotonEditor[7] = new Boton(73, 103, false, "DelayLuzMenos");
					Reg.BotonEditor[8] = new Boton(315, 129, true, "Duracion");
					Reg.BotonEditor[9] = new Boton(73, 129, false, "DuracionMenos");
					Reg.Consol[3] = new Consola(100, 100, "Tiempo entre disparo", Reg.CantDiscos);
					Reg.Consol[4] = new Consola(100, 125, "Duracion", Reg.DelayDiscos);
				}
				activo = "armaDos";
				armaDos = false;
				arma = 2;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.THREE)
		{
			if (arma == 3)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 3;
				cambio(false);
			}
		}
		if (FlxG.keys.justPressed.FOUR)
		{
			if (arma == 4)
			{
				arma = 0;
				cambio(true);
			}
			else
			{
				arma = 4;
				cambio(false);
			}
		}
		if (armaUno == true && activo != "armaUno")
		{
			for (a in 0...3)
			{
				Reg.Consol[a].destroy();
			}
			for (a in 0...6)
			{
				Reg.BotonEditor[a].destroy();
			}
			armaUno = false;
		}
		if (armaUno == true && activo != "armaUno")
		{
			for (a in 2...5)
			{
				Reg.Consol[a].destroy();
			}
			for (a in 6...10)
			{
				Reg.BotonEditor[a].destroy();
			}
			armaUno = false;
		}
	}
}