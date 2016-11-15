package;
import flash.media.Sound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxSave;
import haxe.Serializer;
import haxe.Unserializer;

class Level1 extends FlxState
{

	private var pixelRain:PixelRain;
	private var _gameSave:FlxSave;
	private var level1:Array<Array<List<Float>>>;
	private var existsCounter:Int = 0;
	private var serializer:Serializer;
	private var unserializer:Unserializer;
	
	override public function create():Void
	{
		super.create();
		level1 = new Array < Array<List<Float>> > ();
		Reg.stateString = "Level1";
		Reg.fondoo = new Fondo();
		Reg.getTime = 0;
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(FlxG.width, 0);
		Reg.piso = new Piso(0, FlxG.height);
		Reg.techo = new Techo();
		//Reg.EdicionControl = new EdicionOn(Reg.posicionEdicionOn.x,Reg.posicionEdicionOn.y);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.CajaPantallas = new Array<CajaPantalla>();
		//Reg.Consol = new Array<Consola>();
		//Reg.BotonEditor = new Array<FlxSprite>();
		Reg.music = FlxG.sound.load(AssetPaths.Game__wav);
		Reg.songLine = new SongLine(Reg.paredIzq.width, Reg.techo.height, Reg.music.length / 1000);
		serializer = new Serializer();
		//FlxG.debugger.visible = true;2*60+28
		_gameSave = new FlxSave();
		_gameSave.bind("Level1");
		FlxG.cameras.bgColor = 0xffffffff;
		unserializer = new Unserializer(Reg.EntireLevel);
		level1 = unserializer.unserialize();
		trace(level1);
		for (k in 0...6)
			{
				switch (k)
				{
					case 0:
						for (i in 0...level1[k].length)
						{
							Reg.CajaDiscos[i] = new CajaDisco();
							Reg.CajaDiscos[i].setVariable(level1[k][i]);
							Reg.CantCajaDiscos++;
						}
					case 1:
						for (i in 0...level1[k].length)
						{
							Reg.CajaLuzes[i] = new CajaLuz();
							Reg.CajaLuzes[i].setVariable(level1[k][i]);
							Reg.CantCajaLuzes++;
						}
					case 2:
						for (i in 0...level1[k].length)
						{
							Reg.CajaPixel[i] = new PixelRain();
							Reg.CajaPixel[i].setVariable(level1[k][i]);
							Reg.CantCajaPixel++;
						}
					case 4:
						for (i in 0...level1[k].length)
						{
							Reg.CajaLacer[i] = new Laser();
							Reg.CajaLacer[i].setVariable(level1[k][i]);
							Reg.CantCajaLacer++;
						}
					case 5:
						for (i in 0...level1[k].length)
						{
							Reg.CajaPantallas[i] = new CajaPantalla();
							Reg.CajaPantallas[i].setVariable(level1[k][i]);
							Reg.CantCajaPantallas++;
						}
				}
			}
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!Reg.player.exists)
		{
			FlxG.resetState();
		}
	}
}