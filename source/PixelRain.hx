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
	
	public function new(Spawn:Float) 
	{
		super();
		spawn = Spawn;
		Reg.pixel = new Array<Pixel>();
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer > spawn)
		{
			Reg.pixel.push(new Pixel((30 * posicion) + 20, 0));
			timer = 0;
			posicion++;
			if (30 * posicion > 800)
			{
				posicion = 0;
			}
		}
	}
}