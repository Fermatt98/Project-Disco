package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Next extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(81, 58);
		loadGraphic("assets/images/New/new.png");
		FlxG.state.add(this);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		if (overlapsPoint(FlxG.mouse.getPosition()) && FlxG.mouse.justPressed)
		{
			Reg.Hoja++;
			Reg.cuadro = 0;
		}
		
	}
	
}