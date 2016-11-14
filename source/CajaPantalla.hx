package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class CajaPantalla extends FlxSprite
{
	private var _pantalla:FlxSprite;
	private var _intervalo:Float;
	private var _duracion:Float;
	private var timer:Float = 0;
	private var timer2:Float = 0;
	
	public function new(?X:Float = 0, ?Y:Float = 0, intervalo:Float, duracion:Float, color:String, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		FlxG.state.add(this);
		_intervalo = intervalo;
		_duracion = duracion;
		_pantalla = new FlxSprite();
		if (color == "NEGRO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		}
		else if (color == "BLANCO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.WHITE);
		}
		else if (color == "AZUL")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.BLUE);
		}
		else if (color == "ROJO")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.RED);
		}
		else if (color == "VERDE")
		{
			_pantalla.makeGraphic(FlxG.width, FlxG.height,FlxColor.GREEN);
		}
		_pantalla.alpha = 0;
		FlxG.state.add(_pantalla);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer > _duracion)
		{
			timer2 += elapsed;
			if (_pantalla.alpha != 1 && timer2 <= _intervalo)
			{
				trace("+");
				_pantalla.alpha += 0.1;
			}
			if (timer2 > _intervalo)
			{
				if (_pantalla.alpha != 0)
				{
					trace("-");
					_pantalla.alpha -= 0.1;
				}
				else
				{
					timer = 0;
					timer2 = 0;
				}
			}
		}
	}
	
}