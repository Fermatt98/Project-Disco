package;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.math.FlxAngle;


/**
 * ...
 * @author ...
 */
class CajaLuz extends FlxSprite
{
	private var _luz:FlxSprite;
	private var _time:Float = 0;
	private var _delayLuz:Float = 0;
	private var _duracionLuz:Float = 0;
	private var _duracionTotalLuz:Float = 0;
	private var _luzBool:Bool = false;
	public function new(?X:Float=0, ?Y:Float=0, ?delayLuz:Float, ?duracionLuz:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		loadGraphic("assets/images/CajaLuz/cajaLuz.png");
		_delayLuz = delayLuz;
		_duracionTotalLuz = duracionLuz;
		_duracionLuz = duracionLuz + delayLuz;
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_time += elapsed;
		if ( _time > _delayLuz && !_luzBool)
		{
			_luz = new Luz(x, y + height, _duracionTotalLuz);	
			_luzBool = true;
		}
		if( _time > _duracionLuz)
		{
			_time = 0;
			_luzBool = false;
		}
		if (this.overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressedRight)
		{
			destroy();
		}
		trace(_time);
	}
}