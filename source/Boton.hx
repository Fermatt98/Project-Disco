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
		makeGraphic(18, 18);
		FlxG.state.add(this);
		if (mas == true)
		{
			loadGraphic("assets/images/Editor/BotonMas.png");
		}
		else
		{
			loadGraphic("assets/images/Editor/BotonMenos.png");
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
		}
	}
	
}