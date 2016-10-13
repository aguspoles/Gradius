package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import sprites.Laser;
import flixel.math.FlxRandom;
import states.PlayState;

class SpaceShip extends FlxSprite
{
	private var velocidadY:Int = 120;
	private var velocidadX:Int = 120;
	private var misil:Missile;
	private var timer:Int = 0;
	private var timer1:Int = 0;
	private var flag:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
		
		Reg.grlaser = new FlxTypedGroup<Laser>();
	}
	
	override public function update(elapsed:Float):Void
	{	
		super.update(elapsed);
		
		movePlayer();
		
		disparo();
		
		pickMissile(misil);
	}
		
	private function movePlayer():Void { 
		velocity.x = 50;
		velocity.y = 0;
        if (FlxG.keys.pressed.LEFT && x > FlxG.camera.scroll.x)         
		    velocity.x -= velocidadX;
        if (FlxG.keys.pressed.RIGHT && x < FlxG.camera.scroll.x + FlxG.width - width)         
		    velocity.x += velocidadY;
        if (FlxG.keys.pressed.UP && y > 0)        
		    velocity.y -= velocidadY;
		if (FlxG.keys.pressed.DOWN && y < FlxG.height - height)        
		    velocity.y += velocidadY;
	}
	
	private function disparo():Void
	{
		timer++;
		if ((FlxG.keys.pressed.SPACE || FlxG.keys.justPressed.SPACE) && timer >= 15 && !flag)
		{ 
			Reg.grlaser.add(new sprites.Laser(x + width, y + height / 2 -4));
			timer = 0;
			FlxG.state.add(Reg.grlaser);
		}
		else if((FlxG.keys.pressed.SPACE || FlxG.keys.justPressed.SPACE) && timer1 <= 30 && flag)
		{
			timer1++;
			Reg.grlaser.add(new sprites.Laser(x + width, y + height / 2 -4));
			timer = 0;
			FlxG.state.add(Reg.grlaser);
			if (timer1 >= 30)
			{
			   flag = false;
			   timer1 = 0;
			}
		}
	}
	
	public function death():Void
	{
		Reg.vidas--;
		if(Reg.vidas > -1)
			FlxG.switchState(new PlayState());
		else
			destroy();
	}
	
	public function interact(ovni:Ovni):Void
	{
		for (i in 0...Reg.grlaser.length)
		{
		if (Reg.grlaser.members[i] != null && FlxG.overlap(ovni, Reg.grlaser.members[i]))
		{
			var r:FlxRandom = new FlxRandom();
			var j:Int = r.int(0, 2);
			if (j == 2)
			{
	            misil = new Missile(Reg.grlaser.members[i].x, Reg.grlaser.members[i].y);
	            FlxG.state.add(misil); 
			}
			Reg.grlaser.members[i].destroy();
			ovni.destroy();
		}
		}
	}
	
	private function pickMissile(misil:Missile):Void
	{
		if (misil != null && FlxG.overlap(misil, this))
		{
			flag = true;
		}
	}

	public function getY():Float
	{
		return y;
	}
}