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
	private var inicio:Int = 200;
	private var distancia:Int = 50;
	
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
			Reg.CajaDiscos[Reg.CantCajaDiscos] = new CajaDisco(Std.int(FlxG.mouse.x/64)*64, Std.int(FlxG.mouse.y/64)*64, Reg.CantDiscos,Reg.DelayDiscos,Reg.VelDiscos);
			Reg.CantCajaDiscos += 1;
		}
		if (FlxG.mouse.justPressed && FlxG.mouse.overlaps(Reg.techo) && arma == 2)
		{
			Reg.CajaLuzes[Reg.CantCajaLuzes] = new CajaLuz(Std.int(FlxG.mouse.x/64)*64, Std.int(FlxG.mouse.y/64)*64, Reg.DelayLuz,Reg.DuracionLuz);
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
					Reg.Consol[0] = new Consola(inicio, inicio, "Cantidad", Reg.CantDiscos);
					Reg.Consol[1] = new Consola(inicio, inicio + distancia, "Tiempo disparo", Reg.DelayDiscos);
					Reg.Consol[2] = new Consola(inicio, inicio + distancia*2, "Velocidad disparo", Reg.VelDiscos);
					Reg.BotonEditor[0] = new Boton(Reg.Consol[0].x + Reg.Consol[0].width, Reg.Consol[0].y + Reg.Consol[0].height/2, true, "Tiros");
					Reg.BotonEditor[1] = new Boton(Reg.Consol[0].x, Reg.Consol[0].y + Reg.Consol[0].height/2, false, "TirosMenos");
					Reg.BotonEditor[2] = new Boton(Reg.Consol[1].x + Reg.Consol[1].width, Reg.Consol[1].y + Reg.Consol[1].height/2, true, "Delay");
					Reg.BotonEditor[3] = new Boton(Reg.Consol[1].x, Reg.Consol[1].y + Reg.Consol[1].height/2, false, "DelayMenos");
					Reg.BotonEditor[4] = new Boton(Reg.Consol[2].x + Reg.Consol[2].width, Reg.Consol[2].y + Reg.Consol[2].height/2, true, "Velocidad");
					Reg.BotonEditor[5] = new Boton(Reg.Consol[2].x, Reg.Consol[2].y + Reg.Consol[2].height/2, false, "VelocidadMenos");
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
					Reg.Consol[3] = new Consola(inicio, inicio, "Tiempo entre disparo", Reg.CantDiscos);
					Reg.Consol[4] = new Consola(inicio, inicio+distancia, "Duracion", Reg.DelayDiscos);
					Reg.BotonEditor[6] = new Boton(Reg.Consol[3].x + Reg.Consol[3].width, Reg.Consol[3].y + Reg.Consol[3].height/2, true, "DelayLuz");
					Reg.BotonEditor[7] = new Boton(Reg.Consol[3].x, Reg.Consol[3].y + Reg.Consol[3].height/2, false, "DelayLuzMenos");
					Reg.BotonEditor[8] = new Boton(Reg.Consol[4].x + Reg.Consol[4].width, Reg.Consol[4].y + Reg.Consol[4].height/2, true, "Duracion");
					Reg.BotonEditor[9] = new Boton(Reg.Consol[4].x, Reg.Consol[4].y + Reg.Consol[4].height/2, false, "DuracionMenos");
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
					Reg.Consol[5] = new Consola(inicio, inicio, "Spawn Tiempo", Reg.PixelSpawn);
					Reg.Consol[6] = new Consola(inicio, inicio + distancia, "DireccionX", Reg.PixelDireccionX);
					Reg.Consol[7] = new Consola(inicio, inicio + distancia*2, "DireccionY", Reg.PixelDireccionY);
					Reg.Consol[8] = new Consola(inicio, inicio + distancia*3, "Distancia", Reg.PixelDistancia);
					Reg.Consol[9] = new Consola(inicio, inicio + distancia*4, "Velocidad", Reg.PixelVelocidad);
					Reg.BotonEditor[10] = new Boton(Reg.Consol[5].x + Reg.Consol[5].width, Reg.Consol[5].y + Reg.Consol[5].height/2, true, "Spawn");
					Reg.BotonEditor[11] = new Boton(Reg.Consol[5].x, Reg.Consol[5].y + Reg.Consol[5].height/2, false, "SpawnMenos");
					Reg.BotonEditor[12] = new Boton(Reg.Consol[6].x + Reg.Consol[6].width, Reg.Consol[6].y + Reg.Consol[6].height/2, true, "DireccionX");
					Reg.BotonEditor[13] = new Boton(Reg.Consol[6].x, Reg.Consol[6].y + Reg.Consol[6].height/2, false, "DireccionXMenos");
					Reg.BotonEditor[14] = new Boton(Reg.Consol[7].x + Reg.Consol[7].width, Reg.Consol[7].y + Reg.Consol[7].height/2, true, "DireccionY");
					Reg.BotonEditor[15] = new Boton(Reg.Consol[7].x, Reg.Consol[7].y + Reg.Consol[7].height/2, false, "DireccionYMenos");
					Reg.BotonEditor[16] = new Boton(Reg.Consol[8].x + Reg.Consol[8].width, Reg.Consol[8].y + Reg.Consol[8].height/2, true, "Distancia");
					Reg.BotonEditor[17] = new Boton(Reg.Consol[8].x, Reg.Consol[8].y + Reg.Consol[8].height/2, false, "DistanciaMenos");
					Reg.BotonEditor[18] = new Boton(Reg.Consol[9].x + Reg.Consol[9].width, Reg.Consol[9].y + Reg.Consol[9].height/2, true, "VelocidadPixel");
					Reg.BotonEditor[19] = new Boton(Reg.Consol[9].x, Reg.Consol[9].y + Reg.Consol[9].height/2, false, "VelocidadPixelMenos");
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
					Reg.Consol[10] = new Consola(inicio, inicio, "Vertical", Reg.LacerVerticalN);
					Reg.Consol[11] = new Consola(inicio, inicio+distancia, "Direccion", Reg.LacerDireccionN);
					Reg.Consol[12] = new Consola(inicio, inicio+distancia*2, "Velocidad", Reg.LacerVelocidad);
					Reg.Consol[13] = new Consola(inicio, inicio+distancia*3, "Tiempo Cambio", Reg.LacerCambio);
					Reg.Consol[14] = new Consola(inicio, inicio+distancia*4, "Intervalo", Reg.LacerIntervalo);
					Reg.BotonEditor[20] = new Boton(Reg.Consol[10].x + Reg.Consol[10].width, Reg.Consol[10].y + Reg.Consol[10].height/2, true, "VerticalLacer");
					Reg.BotonEditor[21] = new Boton(Reg.Consol[10].x, Reg.Consol[10].y + Reg.Consol[10].height/2, false, "VerticalLacerMenos");
					Reg.BotonEditor[22] = new Boton(Reg.Consol[11].x + Reg.Consol[11].width, Reg.Consol[11].y + Reg.Consol[11].height/2, true, "DireccionLacer");
					Reg.BotonEditor[23] = new Boton(Reg.Consol[11].x, Reg.Consol[11].y + Reg.Consol[11].height/2, false, "DireccionLacerMenos");
					Reg.BotonEditor[24] = new Boton(Reg.Consol[12].x + Reg.Consol[12].width, Reg.Consol[12].y + Reg.Consol[12].height/2, true, "LacerVelocidad");
					Reg.BotonEditor[25] = new Boton(Reg.Consol[12].x, Reg.Consol[12].y + Reg.Consol[12].height/2, false, "LacerVelocidadMenos");
					Reg.BotonEditor[26] = new Boton(Reg.Consol[13].x + Reg.Consol[13].width, Reg.Consol[13].y + Reg.Consol[13].height/2, true, "LacerCambio");
					Reg.BotonEditor[27] = new Boton(Reg.Consol[13].x, Reg.Consol[13].y + Reg.Consol[13].height/2, false, "LacerCambioMenos");
					Reg.BotonEditor[28] = new Boton(Reg.Consol[14].x + Reg.Consol[14].width, Reg.Consol[14].y + Reg.Consol[14].height/2, true, "LacerIntervalo");
					Reg.BotonEditor[29] = new Boton(Reg.Consol[14].x, Reg.Consol[14].y + Reg.Consol[14].height/2, false, "LacerIntervaloMenos");
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