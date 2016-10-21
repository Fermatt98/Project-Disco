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

class PlayState extends FlxState
{
	private var pixelRain:PixelRain;
	private var music:FlxSound;
	private var _gameSave:FlxSave;
	private var cajaDiscoList:Array<List<Float>>;
	
	override public function create():Void
	{
		super.create();
		cajaDiscoList = new Array <List<Float>> ();
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
			_gameSave.erase();
			_gameSave.bind("discos");
			for (i in 0...Reg.CantCajaDiscos)
			{
				cajaDiscoList[i] = new List<Float>();
				Reg.CajaDiscos[i].getVariable(cajaDiscoList[i]);
			}
			_gameSave.data.discos = cajaDiscoList;
			_gameSave.flush();
			trace(_gameSave.data.discos);
		}
		if (FlxG.keys.justPressed.L)
		{
			for (i in 0...Reg.CajaDiscos.length)
			{
				Reg.CajaDiscos[i].destroy();
			}
			cajaDiscoList = _gameSave.data.discos;
			for (i in 0...cajaDiscoList.length)
			{
				Reg.CajaDiscos[i] = new CajaDisco();
				Reg.CajaDiscos[i].setVariable(cajaDiscoList[i]);
			}
			trace(_gameSave.data.discos);
			
		}
	}
}
