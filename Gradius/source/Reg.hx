package;

import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo
import flixel.FlxObject;
import sprites.Laser;
import sprites.Missile;
import sprites.Ovni;
import sprites.SpaceShip;
import sprites.Apuntador;
import sprites.EnemyShoot;

class Reg
{
	static public var vidas:Int = 2;
	static public var enemys2:FlxTypedGroup<Apuntador>;
    static public var enemys:FlxTypedGroup<Ovni>;
    static public var grlaser:FlxTypedGroup<Laser>;
	static public var grEnemyShoot:FlxTypedGroup<EnemyShoot>;
}