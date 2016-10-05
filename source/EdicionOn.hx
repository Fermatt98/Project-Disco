package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;


/**
 * ...
 * @author ...
 */
class EdicionOn extends FlxSprite
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(30, 30);
		this.color = 0xFF0000;
		FlxG.state.add(this);
	}
	public function cambio(prendido:Bool)
	{
		if (prendido == true)
		{
			this.color = 0xFF0000;
		}
		if (prendido == false)
		{
			this.color = 0x2EFE2E;
		}
	}
	
}