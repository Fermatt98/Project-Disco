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
	private var _animacion:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 540);
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
		
		if (_animacion == 1 && _time > 0.05)
		{
			loadGraphic("assets/images/Luz/luz_2.png");
			_animacion += 1;
		}
		if (_animacion == 2 && _time > 0.1)
		{
			loadGraphic("assets/images/Luz/luz_3.png");
		}
		
	}
	
}