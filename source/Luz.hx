package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Luz extends FlxSprite
{
	private var _time:Float = 0;
	private var timeLimit:Float = 0.05;
	private var _animacion:Int = 0;
	private var _duracionLuz:Float = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, duracionLuz:Float, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(60, 1080);
		_duracionLuz = duracionLuz;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		_time += elapsed;
		if (FlxG.overlap(Reg.player, this))
		{
			Reg.player.kill();
		}
		if (_animacion == 0 && _time > 0)
		{
			loadGraphic("assets/images/Luz/luz_1.png");
			_animacion += 1;
		}
		
		if (_animacion == 1 && _time > timeLimit)
		{
			loadGraphic("assets/images/Luz/luz_2.png");
			_animacion += 1;
		}
		if (_animacion == 2 && _time > timeLimit*2)
		{
			loadGraphic("assets/images/Luz/luz_3.png");
		}
		if( _time > _duracionLuz)
		{
			destroy();
		}
	}
	
}