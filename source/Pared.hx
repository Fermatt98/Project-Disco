package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Pared extends FlxSprite
{
	private var timer:Float = 0;
	private var animBool:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(Reg.tamanioPared, Std.int(FlxG.height));
		loadGraphic(AssetPaths.pared_2__png);
		if (x != 0)
		{
			x -= width;
		}
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		timer += elapsed;
		if (timer > 0.1)
		{
			timer = 0;
			if (animBool)
			{
				loadGraphic(AssetPaths.pared_2__png);
				animBool = false;
			}
			else
			{
				loadGraphic(AssetPaths.pared_1__png);
				animBool = true;
			}
		}
	}
}