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
	private var Level1:Array<Array<List<Float>>>;
	
	override public function create():Void
	{
		super.create();
		Level1 = new Array <Array<List<Float>>> ();
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
		_gameSave = new FlxSave();
		_gameSave.bind("Level1");
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.S)
		{
			_gameSave.erase();
			_gameSave.bind("Level1");
			for (k in 0...Reg.cantArmas)
			{
				Level1[k] = new Array < List<Float> > ();
				switch (k)
				{
					case 0:
						for (i in 0...Reg.CantCajaDiscos)
						{
							Level1[k][i] = new List<Float>();
							Reg.CajaDiscos[i].getVariable(Level1[k][i]);
						}
					case 1:
						for (i in 0...Reg.CantCajaLuzes)
						{
							Level1[k][i] = new List<Float>();
							Reg.CajaLuzes[i].getVariable(Level1[k][i]);
						}
					case 2:
						for (i in 0...Reg.CantCajaPixel)
						{
							Level1[k][i] = new List<Float>();
							Reg.CajaPixel[i].getVariable(Level1[k][i]);
						}
					case 3:
						for (i in 0...Reg.CantCajaLacer)
						{
							Level1[k][i] = new List<Float>();
							Reg.CajaLacer[i].getVariable(Level1[k][i]);
						}
				}
			}
			_gameSave.data.Level1 = Level1;
			_gameSave.flush();
		}
		if (FlxG.keys.justPressed.L)
		{
			Level1 = _gameSave.data.Level1;
			for (i in 0...Reg.CajaDiscos.length)
			{
				Reg.CajaDiscos[i].destroy();
			}
			for (i in 0...Reg.CajaLuzes.length)
			{
				Reg.CajaLuzes[i].destroy();
			}
			for (i in 0...Reg.CajaPixel.length)
			{
				Reg.CajaPixel[i].destroy();
			}
			for (i in 0...Reg.CajaLacer.length)
			{
				Reg.CajaLacer[i].destroy();
			}
			for (k in 0...4)
			{
				switch (k)
				{
					case 0:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaDiscos[i] = new CajaDisco();
							Reg.CajaDiscos[i].setVariable(Level1[k][i]);
						}
					case 1:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLuzes[i] = new CajaLuz();
							Reg.CajaLuzes[i].setVariable(Level1[k][i]);
						}
					case 2:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaPixel[i] = new PixelRain();
							Reg.CajaPixel[i].setVariable(Level1[k][i]);
						}
					case 3:
						for (i in 0...Level1[k].length)
						{
							Reg.CajaLacer[i] = new Laser();
							Reg.CajaLacer[i].setVariable(Level1[k][i]);
						}
				}
			}
		}
	}
}
