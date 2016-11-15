package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class Fondo extends FlxSprite
{
	private var count:Int = 0;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.fondo2__jpg);
		FlxG.state.add(this);
		Reg.ojo1 = new Ojo(770, 220);
		Reg.ojo2 = new Ojo(300,220);
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		/*if (Reg.getTime > 6 && Reg.getTime <= 12)
		{
			count++;
			switch(count)
			{
				case 1:
					loadGraphic(AssetPaths.Fondo1__jpg);
				case 10:
					loadGraphic(AssetPaths.Fondo2__jpg);
				case 20:
					loadGraphic(AssetPaths.Fondo3__jpg);
				case 30:
					loadGraphic(AssetPaths.Fondo4__jpg);
				case 40:
					loadGraphic(AssetPaths.Fondo5__jpg);
				case 50:
					loadGraphic(AssetPaths.Fondo4__jpg);
				case 60:
					loadGraphic(AssetPaths.Fondo6__jpg);
				case 70:
					loadGraphic(AssetPaths.Fondo7__jpg);
				case 80:
					loadGraphic(AssetPaths.Fondo8__jpg);
				case 90:
					loadGraphic(AssetPaths.Fondo7__jpg);
				case 100:
					loadGraphic(AssetPaths.Fondo9__jpg);
				case 110:
					count = 0;
			}
		}*/
		if (Reg.getTime > 12)
		{
		if (Reg.ojo1.exists)
		{
			Reg.ojo1.kill();
		}
		if (Reg.ojo2.exists)
		{
			Reg.ojo2.kill();
		}
		count++;
			switch(count)
			{
				case 1:
					loadGraphic(AssetPaths.Fondo2_1__jpg);
				case 5:
					loadGraphic(AssetPaths.Fondo2_2__jpg);
				case 10:
					loadGraphic(AssetPaths.Fondo2_3__jpg);
				case 15:
					loadGraphic(AssetPaths.Fondo2_4__jpg);
				case 20:
					loadGraphic(AssetPaths.Fondo2_5__jpg);
				case 25:
					loadGraphic(AssetPaths.Fondo2_4__jpg);
				case 30:
					loadGraphic(AssetPaths.Fondo2_3__jpg);
				case 35:
					loadGraphic(AssetPaths.Fondo2_2__jpg);
				case 40:
					count = 0;
			}
		}
	}
	
}