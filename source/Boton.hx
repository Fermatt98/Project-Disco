package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Boton extends FlxSprite
{
	private var _suma:Bool = false;
	private var _tag:String = "-";
	public function new(?X:Float=0, ?Y:Float=0, ?mas:Bool, tag:String, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioBoton, Reg.tamanioBoton);
		y -= height / 2;
		FlxG.state.add(this);
		if (mas == true)
		{
			loadGraphic("assets/images/Editor/BotonMas.png");
			x += width*2;
		}
		else
		{
			loadGraphic("assets/images/Editor/BotonMenos.png");
			x -= width;
		}
		_tag = tag;
	}
	public function cambio(numero:Float,suma:Float)
	{
		numero + suma;
		return numero;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed)
		{
			//------Discos----////
			if (_tag == "Tiros")
			{
				Reg.CantDiscos += 1;
				Reg.Consol[0].cambio(Reg.CantDiscos);
			}
			if (_tag == "TirosMenos" && Reg.CantDiscos > 0)
			{
				Reg.CantDiscos -= 1;
				Reg.Consol[0].cambio(Reg.CantDiscos);
			}
			if (_tag == "Delay")
			{
				Reg.DelayDiscos += 0.1;
				Reg.Consol[1].cambio(Reg.DelayDiscos);
			}
			if (_tag == "DelayMenos" && Reg.DelayDiscos > 0)
			{
				Reg.DelayDiscos -= 0.1;
				Reg.Consol[1].cambio(Reg.DelayDiscos);
			}
			if (_tag == "Velocidad" && Reg.DelayDiscos > 0)
			{
				Reg.VelDiscos += 10;
				Reg.Consol[2].cambio(Reg.VelDiscos);
			}
			if (_tag == "VelocidadMenos" && Reg.VelDiscos > 0)
			{
				Reg.VelDiscos -= 10;
				Reg.Consol[2].cambio(Reg.VelDiscos);
			}
			//-------FinDiscos-------//
			//-------Luz------//
			if (_tag == "DelayLuz" && Reg.DelayLuz > 0.1)
			{
				Reg.DelayLuz += 0.1;
				Reg.Consol[3].cambio(Reg.DelayLuz);
			}
			if (_tag == "DelayLuzMenos" && Reg.DelayLuz > 0.1)
			{
				Reg.DelayLuz -= 0.1;
				Reg.Consol[3].cambio(Reg.DelayLuz);
			}
			if (_tag == "Duracion" && Reg.DuracionLuz > 0.05)
			{
				Reg.DuracionLuz += 0.1;
				Reg.Consol[4].cambio(Reg.DuracionLuz);
			}
			if (_tag == "DuracionMenos" && Reg.DuracionLuz > 0.05)
			{
				Reg.DuracionLuz -= 0.1;
				Reg.Consol[4].cambio(Reg.DuracionLuz);
			}
			//------FinLuz-----//
			//------Pixel----//
			if (_tag == "Spawn" && Reg.DelayLuz > 0.1)
			{
				Reg.PixelSpawn += 0.1;
				Reg.Consol[5].cambio(Reg.PixelSpawn);
			}
			if (_tag == "SpawnMenos" && Reg.DelayLuz > 0.1)
			{
				Reg.PixelSpawn -= 0.1;
				Reg.Consol[5].cambio(Reg.PixelSpawn);
			}
			if (_tag == "DireccionX")
			{
				if (Reg.PixelDireccionX == 1)
				{
					Reg.PixelDireccionX = -1;
				}
				else
				{
					Reg.PixelDireccionX = 1;
				}
				Reg.Consol[6].cambio(Reg.PixelDireccionX);
			}
			if (_tag == "DireccionXMenos")
			{
				if (Reg.PixelDireccionX == 1)
				{
					Reg.PixelDireccionX = -1;
				}
				else
				{
					Reg.PixelDireccionX = 1;
				}
				Reg.Consol[6].cambio(Reg.PixelDireccionX);
			}
			if (_tag == "DireccionY")
			{
				if (Reg.PixelDireccionY == 1)
				{
					Reg.PixelDireccionY = -1;
				}
				else
				{
					Reg.PixelDireccionY = 1;
				}
				Reg.Consol[7].cambio(Reg.PixelDireccionY);
			}
			
			if (_tag == "DireccionYMenos")
			{
				if (Reg.PixelDireccionY == 1)
				{
					Reg.PixelDireccionY = -1;
				}
				else
				{
					Reg.PixelDireccionY = 1;
				}
				Reg.Consol[7].cambio(Reg.PixelDireccionY);
			}
			if (_tag == "Distancia")
			{
				Reg.PixelDistancia += 5;
				Reg.Consol[8].cambio(Reg.PixelDistancia);
			}
			if (_tag == "DistanciaMenos" && Reg.PixelDistancia >= 5)
			{
				Reg.PixelDistancia -= 5;
				Reg.Consol[8].cambio(Reg.PixelDistancia);
			}
			if (_tag == "VelocidadPixel")
			{
				Reg.PixelVelocidad += 5;
				Reg.Consol[9].cambio(Reg.PixelVelocidad);
			}
			if (_tag == "VelocidadPixelMenos" && Reg.PixelVelocidad >= 5)
			{
				Reg.PixelVelocidad -= 5;
				Reg.Consol[9].cambio(Reg.PixelVelocidad);
			}
			//------FinPixel-----//
			//------Lacer------//
			if (_tag == "VerticalLacer")
			{
				if (Reg.LacerVerticalN == 1)
				{
					Reg.LacerVerticalN = 0;
					Reg.LacerVertical = false;
				}
				else
				{
					Reg.LacerVerticalN = 1;
					Reg.LacerVertical = true;
				}
				Reg.Consol[10].cambio(Reg.LacerVerticalN);
			}
			if (_tag == "VerticalLacerMenos")
			{
				if (Reg.LacerVerticalN == 1)
				{
					Reg.LacerVerticalN = 0;
					Reg.LacerVertical = false;
				}
				else
				{
					Reg.LacerVerticalN = 1;
					Reg.LacerVertical = true;
				}
				Reg.Consol[10].cambio(Reg.LacerVerticalN);
			}
			if (_tag == "DireccionLacer")
			{
				if (Reg.LacerDireccionN == 1)
				{
					Reg.LacerDireccionN = 0;
					Reg.LacerDireccion = false;
				}
				else
				{
					Reg.LacerDireccionN = 1;
					Reg.LacerDireccion = true;
				}
				Reg.Consol[11].cambio(Reg.LacerDireccionN);
			}
			if (_tag == "DireccionLacerMenos")
			{
				if (Reg.LacerDireccionN == 1)
				{
					Reg.LacerDireccionN = 0;
					Reg.LacerDireccion = false;
				}
				else
				{
					Reg.LacerDireccionN = 1;
					Reg.LacerDireccion = true;
				}
				Reg.Consol[11].cambio(Reg.LacerDireccionN);
			}
			if (_tag == "LacerVelocidad")
			{
				Reg.LacerVelocidad += 5;
				Reg.Consol[12].cambio(Reg.LacerVelocidad);
			}
			if (_tag == "LacerVelocidadMenos" && Reg.LacerVelocidad >= 5)
			{
				Reg.LacerVelocidad -= 5;
				Reg.Consol[12].cambio(Reg.LacerVelocidad);
			}
			if (_tag == "LacerCambio")
			{
				Reg.LacerCambio += 0.1;
				Reg.Consol[13].cambio(Reg.LacerCambio);
			}
			if (_tag == "LacerCambioMenos" && Reg.LacerCambio >= 0.1)
			{
				Reg.LacerCambio -= 0.1;
				Reg.Consol[13].cambio(Reg.LacerCambio);
			}
			if (_tag == "LacerIntervalo")
			{
				Reg.LacerIntervalo += 0.1;
				Reg.Consol[14].cambio(Reg.LacerIntervalo);
			}
			if (_tag == "LacerIntervaloMenos")
			{
				Reg.LacerIntervalo -= 0.1;
				Reg.Consol[14].cambio(Reg.LacerIntervalo);
			}
		}
	}
}