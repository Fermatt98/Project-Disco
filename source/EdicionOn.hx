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
	private var armaTres:Bool = false;
	private var armaCuatro:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(60, 60);
		this.color = 0xFF0000;
		FlxG.state.add(this);
		cambio(true);
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
			Reg.CajaLuzes[Reg.CantCajaLuzes] = new CajaLuz(FlxG.mouse.x, FlxG.mouse.y, Reg.DelayLuz,Reg.DuracionLuz);
			Reg.CantCajaLuzes += 1;
		}
		if (FlxG.mouse.justPressed && arma == 3)
		{
			Reg.CajaPixel[Reg.CantCajaPixel] = new PixelRain(FlxG.mouse.x, FlxG.mouse.y, Reg.PixelSpawn, Reg.PixelDireccionX, Reg.PixelDireccionY, Reg.PixelDistancia, Reg.PixelVelocidad);
			Reg.CantCajaPixel += 1;
		}
		if (FlxG.mouse.justPressed && arma == 4)
		{
			Reg.CajaLacer[Reg.CantCajaLacer] = new Laser(FlxG.mouse.x, FlxG.mouse.y, Reg.LacerVertical,Reg.LacerDireccion, Reg.LacerVelocidad, Reg.LacerCambio, Reg.LacerIntervalo);
			Reg.CantCajaLacer += 1;
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
					Reg.BotonEditor[6] = new Boton(380, 103, true, "DelayLuz");
					Reg.BotonEditor[7] = new Boton(73, 103, false, "DelayLuzMenos");
					Reg.BotonEditor[8] = new Boton(245, 129, true, "Duracion");
					Reg.BotonEditor[9] = new Boton(73, 129, false, "DuracionMenos");
					Reg.Consol[3] = new Consola(100, 100, "Tiempo entre disparo", Reg.CantDiscos);
					Reg.Consol[4] = new Consola(100, 125, "Duracion", Reg.DelayDiscos);
				}
				activo = "armaDos";
				armaDos = true;
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
				if (armaTres != true)
				{
					Reg.BotonEditor[10] = new Boton(300, 103, true, "Spawn");
					Reg.BotonEditor[11] = new Boton(73, 103, false, "SpawnMenos");
					Reg.BotonEditor[12] = new Boton(255, 129, true, "DireccionX");
					Reg.BotonEditor[13] = new Boton(73, 129, false, "DireccionXMenos");
					Reg.BotonEditor[14] = new Boton(255, 155, true, "DireccionY");
					Reg.BotonEditor[15] = new Boton(73, 155, false, "DireccionYMenos");
					Reg.BotonEditor[16] = new Boton(255, 181, true, "Distancia");
					Reg.BotonEditor[17] = new Boton(73, 181, false, "DistanciaMenos");
					Reg.BotonEditor[18] = new Boton(255, 206, true, "VelocidadPixel");
					Reg.BotonEditor[19] = new Boton(73, 206, false, "VelocidadPixelMenos");
					Reg.Consol[5] = new Consola(100, 100, "Spawn Tiempo", Reg.PixelSpawn);
					Reg.Consol[6] = new Consola(100, 125, "DireccionX", Reg.PixelDireccionX);
					Reg.Consol[7] = new Consola(100, 150, "DireccionY", Reg.PixelDireccionY);
					Reg.Consol[8] = new Consola(100, 175, "Distancia", Reg.PixelDistancia);
					Reg.Consol[9] = new Consola(100, 200, "Velocidad", Reg.PixelVelocidad);
				}
				activo = "armaTres";
				armaTres = true;
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
				if (armaCuatro != true)
				{
					Reg.BotonEditor[20] = new Boton(230, 103, true, "VerticalLacer");
					Reg.BotonEditor[21] = new Boton(73, 103, false, "VerticalLacerMenos");
					Reg.BotonEditor[22] = new Boton(235, 129, true, "DireccionLacer");
					Reg.BotonEditor[23] = new Boton(73, 129, false, "DireccionLacerMenos");
					Reg.BotonEditor[24] = new Boton(245, 155, true, "LacerVelocidad");
					Reg.BotonEditor[25] = new Boton(73, 155, false, "LacerVelocidadMenos");
					Reg.BotonEditor[26] = new Boton(315, 181, true, "LacerCambio");
					Reg.BotonEditor[27] = new Boton(73, 181, false, "LacerCambioMenos");
					Reg.BotonEditor[28] = new Boton(250, 205, true, "LacerIntervalo");
					Reg.BotonEditor[29] = new Boton(73, 205, false, "LacerIntervaloMenos");
					Reg.Consol[10] = new Consola(100, 100, "Vertical", Reg.LacerVerticalN);
					Reg.Consol[11] = new Consola(100, 125, "Direccion", Reg.LacerDireccionN);
					Reg.Consol[12] = new Consola(100, 150, "Velocidad", Reg.LacerVelocidad);
					Reg.Consol[13] = new Consola(100, 175, "Tiempo Cambio", Reg.LacerCambio);
					Reg.Consol[14] = new Consola(100, 200, "Intervalo", Reg.LacerIntervalo);
				}
				activo = "armaCuatro";
				armaCuatro = true;
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
		if (armaDos == true && activo != "armaDos")
		{
			for (a in 3...5)
			{
				Reg.Consol[a].destroy();
			}
			for (a in 6...10)
			{
				Reg.BotonEditor[a].destroy();
			}
			armaDos = false;
		}
		if (armaTres == true && activo != "armaTres")
		{
			for (a in 5...10)
			{
				Reg.Consol[a].destroy();
			}
			for (a in 10...20)
			{
				Reg.BotonEditor[a].destroy();
			}
			armaTres = false;
		}
		if (armaCuatro == true && activo != "armaCuatro")
		{
			for (a in 10...15)
			{
				Reg.Consol[a].destroy();
			}
			for (a in 20...30)
			{
				Reg.BotonEditor[a].destroy();
			}
			armaCuatro = false;
		}
	}
}