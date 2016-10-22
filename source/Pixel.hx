package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pixel extends FlxSprite
{
	private var _direccionY:Float;
	private var _direccionX:Float;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, direccionX:Float, direccionY:Float,velocidad:Float) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioCajas, Reg.tamanioCajas);
		loadGraphic("assets/images/Pixel/pixel.png");
		_direccionX = direccionX;
		_direccionY = direccionY;
		velocity.y = velocidad * _direccionY;
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (!isOnScreen())
		{
			destroy();
		}
		if (FlxG.overlap(Reg.player, this))
		{
			Reg.player.kill();
		}
	}
}