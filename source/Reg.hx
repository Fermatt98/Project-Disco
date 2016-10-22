package;

import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
class Reg
{
	static public var velPlayer:Int = 0;
	static public var jumpVelPlayer:Int = 0;
	inline static public var maxVelPlayer:Int = 400;
	inline static public var jumpAccelerationPlayer:Int = 20;
	inline static public var jumpMaxVelPlayer:Int = -600;
	inline static public var maxJump:Int = 2;
	inline static public var pixelVel:Int = 800;
	inline static public var cantArmas:Int = 4;
	//------Posiciones-----//
	static public var posicionEdicionOn:FlxPoint = new FlxPoint(100, 100);
	static public var posicionTiempo:FlxPoint = new FlxPoint(100, 450);
	//------Tamaño------//
	inline static public var tamanioPlayerX:Int = 64;
	inline static public var tamanioPlayerY:Int = 64;
	inline static public var tamanioPared:Int = 64;
	inline static public var tamanioCajas:Int = 64;
	inline static public var tamanioBoton:Int = 36;
	inline static public var tamanioDisco:Int = 24;
	inline static public var tamanioSongLine:Int = 64;
	inline static public var tamanioTimeLineX:Int = 16;
	inline static public var tamanioTimeLineY:Int = 64;
	
	//-----Editor----//
	static public var Consol:Array<Consola>;
	static public var BotonEditor:Array<FlxSprite>;
	static public var EdicionControl:EdicionOn;
	//--------FLXSPRITES------------//
	static public var player:FlxSprite;
	//-------Escenario-------//
	static public var piso:FlxSprite;
	static public var paredIzq:FlxSprite;
	static public var paredDer:FlxSprite;
	static public var techo:FlxSprite;
	//-------Armas------//
		//-------Discos-----//
		static public var CajaDiscos:Array<CajaDisco>;
		static public var CantCajaDiscos:Int = 0;
		static public var CantDiscos:Int = 0;
		static public var DelayDiscos:Float = 1;
		static public var VelDiscos:Float = 300;
		static public var velocidadDisco:Int = 250;
		static public var anguloDisco:Float = 0;
		static public var discos:Array<Disco>;
		//-------DiscosFin----//
		//--------Luz-------//
		static public var DelayLuz:Float = 1;
		static public var DuracionLuz:Float = 2;
		//-------LuzFin----//
		//-------PixelRain------//
		static public var PixelSpawn:Float = 0;
		static public var PixelDireccionX:Float = 1;
		static public var PixelDireccionY:Float = 1;
		static public var PixelDistancia:Float = 10;
		static public var PixelVelocidad:Float = 30;
		//-------PixelRainFin---//
		//-------Lacer------//
		static public var LacerVertical:Bool = false;
		static public var LacerVerticalN:Float = 0;
		static public var LacerDireccion:Bool = false;
		static public var LacerDireccionN:Float = 0;
		static public var LacerVelocidad:Float = 0;
		static public var LacerCambio:Float = 0;
		static public var LacerIntervalo:Float = 0;
		//-----FinLacer----//
		static public var CajaLuzes:Array<CajaLuz>;
		static public var CantCajaLuzes:Int = 0;
		static public var CajaLacer:Array<Laser>;
		static public var CantCajaLacer:Int = 0;
		static public var CajaPixel:Array<PixelRain>;
		static public var CantCajaPixel:Int = 0;
		static public var pixel:Array<Pixel>;
	//-------Editor------//
		static public var timeline:FlxSprite;
		static public var songLine:FlxSprite;
		static public var pixelTime:Float;
		static public var getTime:Float;
		static public var time:Float;
}