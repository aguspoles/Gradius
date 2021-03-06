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

class Ovni extends FlxSprite
{
	private var flag:Bool = true;
	private var timer:Int = 0;
	private var timer1:Int = 0;
	private var startMoving:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Enemigo1__png, true, 32, 32);
		animation.add("flying", [0, 1], 4, true);
		animation.play("flying");
		velocity.x = 0;
		Reg.grEnemyShoot = new FlxTypedGroup<EnemyShoot>();
	}
	

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		move();
    }
	
	public function shoot():Void
	{
		if (exists)
		{
			timer1++;
			if (timer1 == 60)
			{
				Reg.grEnemyShoot.add(new EnemyShoot(x + width, y + height / 2 -4));
				timer1 = 0;
				FlxG.state.add(Reg.grEnemyShoot);
			}
			startMoving = true;
		}   
	}
	
	private function move():Void
	{
		if(startMoving == true)
			velocity.x = -20;
		

		if (x <= FlxG.camera.scroll.x)
		    destroy();  
	}
}