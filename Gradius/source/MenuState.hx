package;

import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo

class MenuState extends FlxState
{
	private var spaceShip:SpaceShip;
	private var tileMap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	
	override public function create():Void
	{
		FlxG.cameras.bgColor = FlxColor.BLUE;

		loader = new FlxOgmoLoader(AssetPaths.nivel__oel);
		tileMap = loader.loadTilemap(AssetPaths.rocas__png, 16, 16, "tilesets");
		tileMap.follow();
        tileMap.setTileProperties(1, FlxObject.ANY);
        tileMap.setTileProperties(2, FlxObject.ANY);
		tileMap.setTileProperties(3, FlxObject.ANY);
		tileMap.setTileProperties(4, FlxObject.ANY);
		tileMap.setTileProperties(5, FlxObject.NONE);
		
		spaceShip = new SpaceShip();
		
		loader.loadEntities(placeEntities, "entities");
		
		add(tileMap);
		add(spaceShip);
		
		FlxG.camera.follow(spaceShip, FlxCameraFollowStyle.PLATFORMER);
		FlxG.camera.setScrollBoundsRect(0, 0, tileMap.width, tileMap.height, true);
	
		super.create();
	}
	
	private function placeEntities(entityName:String, entityData:Xml):Void
    {
        var x:Int = Std.parseInt(entityData.get("x"));
        var y:Int = Std.parseInt(entityData.get("y"));
        if (entityName == "player")
        {
            spaceShip.x = x;
            spaceShip.y = y;
        }
    }
 
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//FlxG.collide(spaceShip, tileMap);
	}
}
