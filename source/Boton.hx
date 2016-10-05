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
	public function new(?X:Float=0, ?Y:Float=0, ?mas:Bool, ?SimpleGraphic:FlxGraphicAsset) 
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
	}
	public function cambio(numero:Float,suma:Float)
	{
		numero + suma;
		return numero;
	}
	
	
}