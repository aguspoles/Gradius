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
		loadGraphic(AssetPaths.Apuntador__png, true, 16, 24);
		animation.add("flying", [0, 1], 4, true);
		animation.play("flying");
	}
	  override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		if (x < FlxG.camera.scroll.x)
		   destroy();
	}
	
	public function setY(num:Float):Void
	{
		y = num;
	}
	
}