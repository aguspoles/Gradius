package sprites;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Ovni extends FlxSprite
{
	private var flag:Bool = true;
	private var timer:Int = 0;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Enemigo1__png, true, 32, 32);
		animation.add("flying", [0, 1], 4, true);
		animation.play("flying");
	}
	

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		move();
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
	}
}