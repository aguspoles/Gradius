package sprites;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Apuntador extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(16, 16);
	}
	  override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
	}
	
	public function setY(num:Float):Void
	{
		y = num;
	}
	
}