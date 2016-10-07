package;

import flixel.FlxSprite;
import flixel.text.FlxText;
class Reg
{
	static public var velPlayer:Int = 0;
	static public var jumpVelPlayer:Int = 0;
	inline static public var maxVelPlayer:Int = 400;
	inline static public var accelerationPlayer:Int = 30;
	inline static public var jumpAccelerationPlayer:Int = 20;
	inline static public var jumpMaxVelPlayer:Int = -600;
	inline static public var maxJump:Int = 2;
	inline static public var pixelVel:Int = 800;
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
		//--------Luz-------//
		static public var DelayLuz:Float = 1;
		static public var DuracionLuz:Float = 2;
		//-------DiscosFin----//
		static public var CajaLuzes:Array<CajaLuz>;
		static public var CantCajaLuzes:Int = 0;
		static public var CajaLacer:Array<Laser>;
		static public var CantCajaLacer:Int = 0;
		static public var CajaPixel:Array<PixelRain>;
		static public var CantCajaPixel:Int = 0;
		static public var pixel:Array<Pixel>;
}