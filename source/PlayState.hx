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

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	private var music:FlxSound;
	private var _gameSave:FlxSave;
	private var serializer:Serializer;
	
	override public function create():Void
	{
		super.create();
		serializer = new Serializer();
		Reg.getTime = 0;
		Reg.player = new Player(FlxG.width/2, FlxG.height/2);
		Reg.piso = new Piso(0, 580);
		Reg.paredIzq = new Pared();
		Reg.paredDer = new Pared(780, 0);
		Reg.techo = new Techo();
		Reg.EdicionControl = new EdicionOn(50,50);
		Reg.CajaDiscos = new Array<CajaDisco>();
		Reg.CajaLuzes = new Array<CajaLuz>();
		Reg.CajaLacer = new Array<Laser>();
		Reg.CajaPixel = new Array<PixelRain>();
		Reg.Consol = new Array<Consola>();
		Reg.BotonEditor = new Array<FlxSprite>();
		Reg.songLine = new SongLine(Reg.paredIzq.width, Reg.techo.height, 2*60+28);
		music = FlxG.sound.load(AssetPaths.Game__wav);
		music.play();
		//FlxG.debugger.visible = true;
		_gameSave = new FlxSave(); // initialize
		_gameSave.bind("discos");
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.S)
		{
			_gameSave.data.discos = new Array<CajaDisco>();
			for (i in 0...Reg.CantCajaDiscos)
			{
				serializer.serialize(Reg.CajaDiscos[i]);
				_gameSave.data.discos.push(serializer);
				_gameSave.flush();
			}
		}
		if (FlxG.keys.justPressed.L)
		{
			Reg.CajaDiscos = _gameSave.data.discos;
		}
	}
}
