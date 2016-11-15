package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class Comic extends FlxState
{
	private var Historia:FlxSprite;
	private var boton:FlxSprite;
	private var _time:Float = 0;
	private var playstate:FlxState;
	
	override public function create():Void
	{
		super.create();
		Historia = new FlxSprite();
		Historia.loadGraphic("assets/images/Comic/Escritorio1.jpg");
		add(Historia);
		boton = new Next();
		playstate = new Level1();
		Reg.stateString = "comic";
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		Reg.cuadro++;
		switch(Reg.Hoja)
		{
			case 0:switch(Reg.cuadro)
					{
						case 35:
							Historia.loadGraphic("assets/images/Comic/Escritorio2.jpg");
						case 40:
							Historia.loadGraphic("assets/images/Comic/Escritorio3.jpg");
						case 50:
							Historia.loadGraphic("assets/images/Comic/Escritorio4.jpg");
						case 60:
							Historia.loadGraphic("assets/images/Comic/Escritorio5.jpg");
						case 70:
							Historia.loadGraphic("assets/images/Comic/Escritorio6.jpg");
						case 80:
							Historia.loadGraphic("assets/images/Comic/Escritorio7.jpg");
						case 90:
							Historia.loadGraphic("assets/images/Comic/Escritorio8.jpg");
						case 100:
							Historia.loadGraphic("assets/images/Comic/Escritorio9.jpg");
						case 110:
							Historia.loadGraphic("assets/images/Comic/Escritorio10.jpg");
						case 120:
							Historia.loadGraphic("assets/images/Comic/Escritorio11.jpg");
						case 130:
							Historia.loadGraphic("assets/images/Comic/Escritorio12.jpg");
						case 140:
							Historia.loadGraphic("assets/images/Comic/Escritorio13.jpg");
						case 150:
							Historia.loadGraphic("assets/images/Comic/Escritorio14.jpg");
						case 160:
							Historia.loadGraphic("assets/images/Comic/Escritorio15.jpg");
						case 170:
							Historia.loadGraphic("assets/images/Comic/Escritorio16.jpg");
						case 180:
							Historia.loadGraphic("assets/images/Comic/Escritorio17.jpg");
						case 190:
							Historia.loadGraphic("assets/images/Comic/Escritorio18.jpg");
						case 200:
							Historia.loadGraphic("assets/images/Comic/Escritorio19.jpg");
						case 210:
							Historia.loadGraphic("assets/images/Comic/Escritorio20.jpg");
						case 220:
							Historia.loadGraphic("assets/images/Comic/Escritorio21.jpg");
						case 230:
							Historia.loadGraphic("assets/images/Comic/Escritorio22.jpg");
						case 240:
							Historia.loadGraphic("assets/images/Comic/Escritorio23.jpg");
						case 250:
							Historia.loadGraphic("assets/images/Comic/Escritorio24.jpg");
						case 260:
							Historia.loadGraphic("assets/images/Comic/Escritorio25.jpg");
						case 270:
							Historia.loadGraphic("assets/images/Comic/Escritorio26.jpg");
						case 280:
							Historia.loadGraphic("assets/images/Comic/Escritorio27.jpg");
						case 290:
							Historia.loadGraphic("assets/images/Comic/Escritorio28.jpg");
						case 300:
							Historia.loadGraphic("assets/images/Comic/Escritorio29.jpg");
						case 310:
							Historia.loadGraphic("assets/images/Comic/Escritorio30.jpg");
						case 320:
							Historia.loadGraphic("assets/images/Comic/Escritorio31.jpg");
						case 330:
							Historia.loadGraphic("assets/images/Comic/Escritorio32.jpg");
						case 340:
							Historia.loadGraphic("assets/images/Comic/Escritorio33.jpg");
						case 350:
							Historia.loadGraphic("assets/images/Comic/Escritorio34.jpg");
						case 360:
							Historia.loadGraphic("assets/images/Comic/Escritorio35.jpg");
						case 370:
							Historia.loadGraphic("assets/images/Comic/Escritorio36.jpg");
						case 380:
							Historia.loadGraphic("assets/images/Comic/Escritorio37.jpg");
						case 390:
							Historia.loadGraphic("assets/images/Comic/Escritorio38.jpg");
						case 400:
							Historia.loadGraphic("assets/images/Comic/Escritorio39.jpg");
					}
			case 1:switch(Reg.cuadro)
					{
						case 0:
							Historia.loadGraphic("assets/images/Comic/Escritorio40.jpg");
						case 5:
							Historia.loadGraphic("assets/images/Comic/Escritorio41.jpg");
						case 10:
							Historia.loadGraphic("assets/images/Comic/Escritorio42.jpg");
						case 15:
							Historia.loadGraphic("assets/images/Comic/Escritorio43.jpg");
						case 20:
							Historia.loadGraphic("assets/images/Comic/Escritorio44.jpg");
						case 25:
							Historia.loadGraphic("assets/images/Comic/Escritorio45.jpg");
						case 30:
							Historia.loadGraphic("assets/images/Comic/Escritorio46.jpg");
						case 35:
							Historia.loadGraphic("assets/images/Comic/Escritorio47.jpg");
						case 40:
							Historia.loadGraphic("assets/images/Comic/Escritorio48.jpg");
						case 45:
							Historia.loadGraphic("assets/images/Comic/Escritorio49.jpg");
						case 50:
							Historia.loadGraphic("assets/images/Comic/Escritorio50.jpg");
						case 55:
							Historia.loadGraphic("assets/images/Comic/Escritorio51.jpg");
						case 60:
							Historia.loadGraphic("assets/images/Comic/Escritorio52.jpg");
						case 65:
							Historia.loadGraphic("assets/images/Comic/Escritorio53.jpg");
						case 70:
							Historia.loadGraphic("assets/images/Comic/Escritorio54.jpg");
						case 75:
							Historia.loadGraphic("assets/images/Comic/Escritorio55.jpg");
						case 80:
							Historia.loadGraphic("assets/images/Comic/Escritorio56.jpg");
						case 85:
							Historia.loadGraphic("assets/images/Comic/Escritorio57.jpg");
						case 90:
							Historia.loadGraphic("assets/images/Comic/Escritorio58.jpg");
						case 95:
							Historia.loadGraphic("assets/images/Comic/Escritorio59.jpg");
						case 100:
							Historia.loadGraphic("assets/images/Comic/Escritorio60.jpg");
						case 105:
							Historia.loadGraphic("assets/images/Comic/Escritorio61.jpg");
						case 110:
							Historia.loadGraphic("assets/images/Comic/Escritorio62.jpg");
						case 115:
							Historia.loadGraphic("assets/images/Comic/Escritorio63.jpg");
						case 120:
							Historia.loadGraphic("assets/images/Comic/Escritorio64.jpg");
						case 125:
							Historia.loadGraphic("assets/images/Comic/Escritorio65.jpg");
						case 130:
							Historia.loadGraphic("assets/images/Comic/Escritorio66.jpg");
						case 135:
							Historia.loadGraphic("assets/images/Comic/Escritorio67.jpg");
						case 140:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_1.jpg");
						case 145:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_2.jpg");
						case 150:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_3.jpg");
						case 155:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_4.jpg");
						case 160:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_5.jpg");
						case 165:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_6.jpg");
						case 170:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_7.jpg");
						case 175:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_8.jpg");
						case 180:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_9.jpg");
						case 185:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_10.jpg");
						case 190:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_11.jpg");
						case 195:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_12.jpg");
						case 200:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_13.jpg");
						case 205:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_14.jpg");
						case 210:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_15.jpg");
						case 215:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_16.jpg");
						case 220:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_17.jpg");
						case 225:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_18.jpg");
						case 230:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_19.jpg");
						case 235:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_20.jpg");
						case 240:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_21.jpg");
						case 245:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_22.jpg");
						case 250:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_23.jpg");
						case 255:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_24.jpg");
						case 260:
							Historia.loadGraphic("assets/images/Comic/Escritorio68_25.jpg");
						case 300:
							Historia.loadGraphic("assets/images/Comic/Escritorio68.jpg");
						case 305:
							Historia.loadGraphic("assets/images/Comic/Escritorio67.jpg");
						case 310:
							Historia.loadGraphic("assets/images/Comic/Escritorio66.jpg");
						case 315:
							Historia.loadGraphic("assets/images/Comic/Escritorio65.jpg");
						case 320:
							Historia.loadGraphic("assets/images/Comic/Escritorio64.jpg");
						case 325:
							Historia.loadGraphic("assets/images/Comic/Escritorio63.jpg");
						case 330:
							Historia.loadGraphic("assets/images/Comic/Escritorio62.jpg");
						case 335:
							Historia.loadGraphic("assets/images/Comic/Escritorio61.jpg");
						case 340:
							Historia.loadGraphic("assets/images/Comic/Escritorio60.jpg");
						case 345:
							Historia.loadGraphic("assets/images/Comic/Escritorio59.jpg");
						case 350:
							Historia.loadGraphic("assets/images/Comic/Escritorio58.jpg");
						case 355:
							Historia.loadGraphic("assets/images/Comic/Escritorio57.jpg");	
					}
			case 2:switch(Reg.cuadro)
					{
						case 1:
							Historia.loadGraphic("assets/images/Comic/Escritorio69.jpg");
						case 10:
							Historia.loadGraphic("assets/images/Comic/Escritorio70.jpg");
						case 20:
							Historia.loadGraphic("assets/images/Comic/Escritorio71.jpg");
						case 30:
							Historia.loadGraphic("assets/images/Comic/Escritorio72.jpg");
						case 40:
							Historia.loadGraphic("assets/images/Comic/Escritorio73.jpg");
						case 50:
							Historia.loadGraphic("assets/images/Comic/Escritorio74.jpg");
						case 60:
							Historia.loadGraphic("assets/images/Comic/Escritorio75.jpg");
						case 70:
							Historia.loadGraphic("assets/images/Comic/Escritorio76.jpg");
						case 80:
							Historia.loadGraphic("assets/images/Comic/Escritorio77.jpg");
						case 90:
							Historia.loadGraphic("assets/images/Comic/Escritorio78.jpg");
						case 110:
							Historia.loadGraphic("assets/images/Comic/Escritorio79.jpg");
						case 130:
							Historia.loadGraphic("assets/images/Comic/Escritorio80.jpg");
						case 150:
							Historia.loadGraphic("assets/images/Comic/Escritorio81.jpg");
						case 200:
							Historia.loadGraphic("assets/images/Comic/Escritorio82.jpg");
						case 210:
							Historia.loadGraphic("assets/images/Comic/Escritorio83.jpg");
						case 220:
							Historia.loadGraphic("assets/images/Comic/Escritorio84.jpg");
						case 230:
							Historia.loadGraphic("assets/images/Comic/Escritorio85.jpg");
						case 240:
							Historia.loadGraphic("assets/images/Comic/Escritorio86.jpg");
					}
			case 3:switch(Reg.cuadro)
					{
					case 1:
						Historia.loadGraphic("assets/images/Comic/Escritorio87.jpg");
					case 5:
						Historia.loadGraphic("assets/images/Comic/Escritorio88.jpg");
					case 10:
						Historia.loadGraphic("assets/images/Comic/Escritorio89.jpg");
					case 15:
						Historia.loadGraphic("assets/images/Comic/Escritorio90.jpg");
					case 20:
						Historia.loadGraphic("assets/images/Comic/Escritorio91.jpg");
					case 25:
						Historia.loadGraphic("assets/images/Comic/Escritorio92.jpg");
					case 30:
						Historia.loadGraphic("assets/images/Comic/Escritorio93.jpg");
					case 35:
						Historia.loadGraphic("assets/images/Comic/Escritorio94.jpg");
					case 40:
						Historia.loadGraphic("assets/images/Comic/Escritorio95.jpg");
					case 45:
						Historia.loadGraphic("assets/images/Comic/Escritorio96.jpg");
					case 60:
						Historia.loadGraphic("assets/images/Comic/Escritorio97.jpg");
					case 65:
						Historia.loadGraphic("assets/images/Comic/Escritorio98.jpg");
					case 70:
						Historia.loadGraphic("assets/images/Comic/Escritorio99.jpg");
					case 75:
						Historia.loadGraphic("assets/images/Comic/Escritorio100.jpg");
					case 80:
						Historia.loadGraphic("assets/images/Comic/Escritorio101.jpg");
					case 85:
						Historia.loadGraphic("assets/images/Comic/Escritorio102.jpg");
					case 90:
						Historia.loadGraphic("assets/images/Comic/Escritorio103.jpg");
					case 95:
						Historia.loadGraphic("assets/images/Comic/Escritorio104.jpg");	
					}
			case 4:switch(Reg.cuadro)
					{
						case 1:
							Historia.loadGraphic("assets/images/Comic/Escritorio105.jpg");
						case 10:
							Historia.loadGraphic("assets/images/Comic/Escritorio106.jpg");
						case 20:
							Historia.loadGraphic("assets/images/Comic/Escritorio107.jpg");
						case 30:
							Historia.loadGraphic("assets/images/Comic/Escritorio108.jpg");
						case 40:
							Historia.loadGraphic("assets/images/Comic/Escritorio109.jpg");
						case 50:
							Historia.loadGraphic("assets/images/Comic/Escritorio110.jpg");
						case 60:
							Historia.loadGraphic("assets/images/Comic/Escritorio111.jpg");
						case 70:
							Historia.loadGraphic("assets/images/Comic/Escritorio112.jpg");
						case 80:
							Historia.loadGraphic("assets/images/Comic/Escritorio113.jpg");
						case 90:
							Historia.loadGraphic("assets/images/Comic/Escritorio114.jpg");
						case 100:
							Historia.loadGraphic("assets/images/Comic/Escritorio115.jpg");
						case 110:
							Historia.loadGraphic("assets/images/Comic/Escritorio116.jpg");
						case 120:
							Historia.loadGraphic("assets/images/Comic/Escritorio117.jpg");
						case 130:
							Historia.loadGraphic("assets/images/Comic/Escritorio118.jpg");
					}
			case 5:switch(Reg.cuadro)
				{
					case 10:
						Historia.loadGraphic("assets/images/Comic/Escritorio119.jpg");		
					case 20:
						Historia.loadGraphic("assets/images/Comic/Escritorio120.jpg");		
					case 30:
						Historia.loadGraphic("assets/images/Comic/Escritorio121.jpg");		
					case 40:
						Historia.loadGraphic("assets/images/Comic/Escritorio122.jpg");		
					case 50:
						Historia.loadGraphic("assets/images/Comic/Escritorio123.jpg");		
					case 60:
						Historia.loadGraphic("assets/images/Comic/Escritorio124.jpg");		
					case 70:
						Historia.loadGraphic("assets/images/Comic/Escritorio125.jpg");		
					case 80:
						Historia.loadGraphic("assets/images/Comic/Escritorio126.jpg");		
					case 90:
						Historia.loadGraphic("assets/images/Comic/Escritorio127.jpg");		
					case 100:
						Historia.loadGraphic("assets/images/Comic/Escritorio128.jpg");		
					case 110:
						Historia.loadGraphic("assets/images/Comic/Escritorio129.jpg");		
					case 120:
						Historia.loadGraphic("assets/images/Comic/Escritorio130.jpg");		
					case 130:
						Historia.loadGraphic("assets/images/Comic/Escritorio131.jpg");		
					case 140:
						Historia.loadGraphic("assets/images/Comic/Escritorio132.jpg");		
					case 150:
						Historia.loadGraphic("assets/images/Comic/Escritorio133.jpg");
					case 160:
						Historia.loadGraphic("assets/images/Comic/Escritorio134.jpg");
					case 170:
						Historia.loadGraphic("assets/images/Comic/Escritorio135.jpg");
					case 180:
						Historia.loadGraphic("assets/images/Comic/Escritorio136.jpg");
						FlxG.switchState(playstate);
				}
		}
	}
}