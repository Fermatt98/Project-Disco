package;

import flixel.FlxBasic;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class PixelRain extends FlxBasic
{
	private var timer:Float = 0;
	private var spawn:Float = 0;
	private var posicion:Int = 0;
	private var _distancia:Int = 30;
	private var _inicioX:Int = 0;
	private var _inicioY:Int = 0;
	private var _velocidad;
	private var _direccionY;
	private var _direccionX;
	private var fin:Int = 800;
	
	public function new(inicioX, inicioY, Spawn:Float, direccionX, direccionY, ?distancia = 30, velocidad) 
	{
		super();
		_inicioX = inicioX;
		_inicioY = inicioY;
		spawn = Spawn;
		_distancia = distancia;
		_velocidad = velocidad;
		_direccionX = direccionX;
		_direccionY = direccionY;
		Reg.pixel = new Array<Pixel>();
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer > spawn)
		{
			Reg.pixel.push(new Pixel((_distancia * posicion) + _inicioX, _inicioY, null, _direccionX, _direccionY));
			timer = 0;
			posicion++;
			if (distancia * posicion > fin)
			{
				posicion = 0;
			}
		}
	}
}