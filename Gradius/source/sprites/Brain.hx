package sprites;
import Reg;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Brain extends FlxSprite
{
	private var flag:Bool = true;
	private var timer:Int = 0;
	private var timer1:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.brain__png, true, 32, 32);
		updateHitbox();
		animation.add("flying", [0, 1], 15, true);
		animation.play("flying");
		
	}
	

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		move();
		shoot();
    }
	
	private function shoot():Void
	{
		timer1++;
		if (timer1 == 30)
		{
		    Reg.grEnemyShoot.add(new EnemyShoot(x + width, y + height / 2 -4));
			timer1 = 0;
			FlxG.state.add(Reg.grEnemyShoot);
		}
		    
	}
	
	private function move():Void
	{
		velocity.x = -20;
		timer++;
		if (flag && timer == 30)
		{
			y -= 20;
			flag = false;
			timer = 0;
		}
		
		else if(timer == 30)
		{
			y += 20;
			flag = true;
			timer = 0;
		}
		

		if (x <= FlxG.camera.scroll.x)
		    destroy();  
	}
}