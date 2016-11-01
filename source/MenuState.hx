package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
	private var Menu:FlxSprite;
	private var _time:Float = 0;
	private var counter:Int = 0;
	override public function create():Void
	{
		super.create();
		Menu = new FlxSprite();
		Menu.loadGraphic("assets/images/AnimacionMenu/escritorio_1.jpg");
		add(Menu);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		counter++;
		if (counter > 300)
		{
			counter = 1;
		}
		switch(counter){
			case 0:
				Menu.loadGraphic(AssetPaths.escritorio_1__jpg);
			case 1:
				Menu.loadGraphic(AssetPaths.escritorio_2__jpg);
			case 2:
				Menu.loadGraphic(AssetPaths.escritorio_3__jpg);
			case 3:
				Menu.loadGraphic(AssetPaths.escritorio_4__jpg);
			case 4:
				Menu.loadGraphic(AssetPaths.escritorio_5__jpg);
			case 5:
				Menu.loadGraphic(AssetPaths.escritorio_6__jpg);
			case 6:
				Menu.loadGraphic(AssetPaths.escritorio_7__jpg);
			case 7:
				Menu.loadGraphic(AssetPaths.escritorio_8__jpg);
			case 8:
				Menu.loadGraphic(AssetPaths.escritorio_9__jpg);
			case 9:
				Menu.loadGraphic(AssetPaths.escritorio_10__jpg);
			case 10:
				Menu.loadGraphic(AssetPaths.escritorio_11__jpg);
			case 11:
				Menu.loadGraphic(AssetPaths.escritorio_12__jpg);
			case 12:
				Menu.loadGraphic(AssetPaths.escritorio_13__jpg);
			case 13:
				Menu.loadGraphic(AssetPaths.escritorio_14__jpg);
			case 14:
				Menu.loadGraphic(AssetPaths.escritorio_15__jpg);
			case 15:
				Menu.loadGraphic(AssetPaths.escritorio_16__jpg);
			case 16:
				Menu.loadGraphic(AssetPaths.escritorio_17__jpg);
			case 17:
				Menu.loadGraphic(AssetPaths.escritorio_18__jpg);
			case 18:
				Menu.loadGraphic(AssetPaths.escritorio_19__jpg);
			case 19:
				Menu.loadGraphic(AssetPaths.escritorio_20__jpg);
			case 20:
				Menu.loadGraphic(AssetPaths.escritorio_21__jpg);
			case 21:
				Menu.loadGraphic(AssetPaths.escritorio_22__jpg);
			case 22:
				Menu.loadGraphic(AssetPaths.escritorio_23__jpg);
			case 26:
				Menu.loadGraphic(AssetPaths.escritorio_24__jpg);
			case 30:
				Menu.loadGraphic(AssetPaths.escritorio_25__jpg);
			case 34:
				Menu.loadGraphic(AssetPaths.escritorio_26__jpg);
			case 38:
				Menu.loadGraphic(AssetPaths.escritorio_27__jpg);
			case 39:
				Menu.loadGraphic(AssetPaths.escritorio_28__jpg);
			case 40:
				Menu.loadGraphic(AssetPaths.escritorio_29__jpg);
			case 41:
				Menu.loadGraphic(AssetPaths.escritorio_30__jpg);
			case 42:
				Menu.loadGraphic(AssetPaths.escritorio_31__jpg);
			case 43:
				Menu.loadGraphic(AssetPaths.escritorio_32__jpg);
			case 44:
				Menu.loadGraphic(AssetPaths.escritorio_33__jpg);
			case 45:
				Menu.loadGraphic(AssetPaths.escritorio_34__jpg);
			case 46:
				Menu.loadGraphic(AssetPaths.escritorio_35__jpg);
			case 47:
				Menu.loadGraphic(AssetPaths.escritorio_36__jpg);
			case 48:
				Menu.loadGraphic(AssetPaths.escritorio_37__jpg);
			case 49:
				Menu.loadGraphic(AssetPaths.escritorio_38__jpg);
			case 50:
				Menu.loadGraphic(AssetPaths.escritorio_39__jpg);
			case 51:
				Menu.loadGraphic(AssetPaths.escritorio_40__jpg);
			case 52:
				Menu.loadGraphic(AssetPaths.escritorio_41__jpg);
			case 53:
				Menu.loadGraphic(AssetPaths.escritorio_42__jpg);
			case 54:
				Menu.loadGraphic(AssetPaths.escritorio_43__jpg);
			case 55:
				Menu.loadGraphic(AssetPaths.escritorio_44__jpg);
			case 56:
				Menu.loadGraphic(AssetPaths.escritorio_45__jpg);
			case 57:
				Menu.loadGraphic(AssetPaths.escritorio_46__jpg);
			case 58:
				Menu.loadGraphic(AssetPaths.escritorio_47__jpg);
			case 59:
				Menu.loadGraphic(AssetPaths.escritorio_48__jpg);
			case 60:
				Menu.loadGraphic(AssetPaths.escritorio_49__jpg);
			case 61:
				Menu.loadGraphic(AssetPaths.escritorio_50__jpg);
			case 62:
				Menu.loadGraphic(AssetPaths.escritorio_51__jpg);
			case 65:
				Menu.loadGraphic(AssetPaths.escritorio_52__jpg);
			case 66:
				Menu.loadGraphic(AssetPaths.escritorio_53__jpg);
			case 67:
				Menu.loadGraphic(AssetPaths.escritorio_54__jpg);
			case 68:
				Menu.loadGraphic(AssetPaths.escritorio_55__jpg);
			case 69:
				Menu.loadGraphic(AssetPaths.escritorio_56__jpg);
			case 70:
				Menu.loadGraphic(AssetPaths.escritorio_57__jpg);
			case 71:
				Menu.loadGraphic(AssetPaths.escritorio_58__jpg);
			case 72:
				Menu.loadGraphic(AssetPaths.escritorio_59__jpg);
			case 73:
				Menu.loadGraphic(AssetPaths.escritorio_60__jpg);
			case 74:
				Menu.loadGraphic(AssetPaths.escritorio_61__jpg);
			case 75:
				Menu.loadGraphic(AssetPaths.escritorio_62__jpg);
			case 76:
				Menu.loadGraphic(AssetPaths.escritorio_63__jpg);
			case 77:
				Menu.loadGraphic(AssetPaths.escritorio_64__jpg);
			case 83:
				Menu.loadGraphic(AssetPaths.escritorio_65__jpg);
			case 84:
				Menu.loadGraphic(AssetPaths.escritorio_66__jpg);
			case 85:
				Menu.loadGraphic(AssetPaths.escritorio_67__jpg);
			case 86:
				Menu.loadGraphic(AssetPaths.escritorio_68__jpg);
			case 87:
				Menu.loadGraphic(AssetPaths.escritorio_69__jpg);
			case 88:
				Menu.loadGraphic(AssetPaths.escritorio_70__jpg);
			case 89:
				Menu.loadGraphic(AssetPaths.escritorio_71__jpg);
			case 90:
				Menu.loadGraphic(AssetPaths.escritorio_72__jpg);
			case 91:
				Menu.loadGraphic(AssetPaths.escritorio_73__jpg);
			case 92:
				Menu.loadGraphic(AssetPaths.escritorio_74__jpg);
			case 93:
				Menu.loadGraphic(AssetPaths.escritorio_75__jpg);
			case 94:
				Menu.loadGraphic(AssetPaths.escritorio_76__jpg);
			case 95:
				Menu.loadGraphic(AssetPaths.escritorio_77__jpg);
			case 96:
				Menu.loadGraphic(AssetPaths.escritorio_78__jpg);
			case 97:
				Menu.loadGraphic(AssetPaths.escritorio_79__jpg);
			case 98:
				Menu.loadGraphic(AssetPaths.escritorio_80__jpg);
			case 99:
				Menu.loadGraphic(AssetPaths.escritorio_81__jpg);
			case 100:
				Menu.loadGraphic(AssetPaths.escritorio_82__jpg);
			case 101:
				Menu.loadGraphic(AssetPaths.escritorio_83__jpg);
			case 102:
				Menu.loadGraphic(AssetPaths.escritorio_84__jpg);
			case 103:
				Menu.loadGraphic(AssetPaths.escritorio_85__jpg);
			case 105:
				Menu.loadGraphic(AssetPaths.escritorio_86__jpg);
			case 107:
				Menu.loadGraphic(AssetPaths.escritorio_87__jpg);
			case 109:
				Menu.loadGraphic(AssetPaths.escritorio_88__jpg);
			case 111:
				Menu.loadGraphic(AssetPaths.escritorio_89__jpg);
			case 113:
				Menu.loadGraphic(AssetPaths.escritorio_90__jpg);
		}
	}
}
