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
	private var _direccionY;
	private var _direccionX;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, direccionX, direccionY) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		loadGraphic("assets/images/Pixel/pixel.png");
		_direccionX = direccionX;
		_direccionY = direccionY;
		velocity.y = _direccionY;
		velocity.x = _direccionX;
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