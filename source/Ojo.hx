package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class Ojo extends FlxSprite
{
	private var MaxX:Float = 740;
	private var MinX:Float = 540;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		MaxX = X + this.width + 100;
		MinX = X - 100;
		makeGraphic(169, 304);
		loadGraphic("assets/images/AnimacionFondos/ojo.png");
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (FlxG.keys.pressed.LEFT)
		{
			if (MinX < this.x)
			{
				velocity.x = -68;
			}
			else
			{
				velocity.x = 0;
			}
		}
		else if (FlxG.keys.pressed.RIGHT)
		{
			if (MaxX > x)
			{
				velocity.x = 68;
			}
			
			else
			{
				velocity.x = 0;
			}
		}
		else
		{
			velocity.x = 0;
		}
	}
	
}