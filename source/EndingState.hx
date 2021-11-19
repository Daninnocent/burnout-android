package;
import flixel.*;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author bbpanzu
 */
class EndingState extends FlxState
{

	var _goodEnding:Bool = false;
	
	public function new(goodEnding:Bool = true) 
	{
		super();
		_goodEnding = goodEnding;
		
	}
	
	override public function create():Void 
	{
		trace(PlayState.storyWeek);
		super.create();	
		var end:FlxSprite = new FlxSprite(0, 0);
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);
		if (PlayState.storyWeek == 0)		
			end.loadGraphic(Paths.image("ending"));
		add(end);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		#if mobile
		var justTouched:Bool = false;

		for (touch in FlxG.touches.list)
		{
			justTouched = false;

			if (touch.justPressed){
				justTouched = true;
			}
		}
		#end

		if(FlxG.keys.justPressed.ANY #if mobile || justTouched #end){
			endIt();
		}
		
	}
	
	
	public function endIt(e:FlxTimer=null){
		trace("ENDING");
		FlxG.switchState(new CreditsState());
	}
	
}