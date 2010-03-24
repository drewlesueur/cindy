import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Matrix;
import flash.geom.ColorTransform;


class Audiad {

	static var app : Audiad;

	function Audiad() {
	
		var r = _root;
		
		
		
		var m = function(thename)
		{
			_root.createEmptyMovieClip(thename,1);
			return _root[thename];
		}
		
		
	
			
		
		// creates a 'tf' TextField size 800x600 at pos 0,0
		_root.createTextField("tf",0,0,0,800,600);
		// write some text into it
		_root.tf.text = "Hello world !";
		_root.tf.onRollOver = function(e){_root.tf.text = "yo!"; getURL("http://usedvwaudi.com","_blank")}
		
	
		_root.createEmptyMovieClip("grid", 1);
		
		
		
		
		with (_root.grid)
		{
			
			beginFill(0x0000cc, 100);
			moveTo(0, 0);
			lineTo(_root._width, 0);
			lineTo(_root._width, _root._height);
			lineTo(0, _root._height);
			
			// notice that the shape will be filled automatically
			// without having to draw the last line
			endFill();
		}
		
		
		
		

		_root.grid.onPress = function () {
			_root.tf.text = "yo!"; getURL(_level0.clicktag,"_blank");
			for (var x in _level0)
			{
				_root.tf.text +=  x + ":, " + _level0[x];
			}
		}




		_root.createEmptyMovieClip("img_mc", 2);
		
			
		
		with(_root.img_mc)
		{
			beginFill(0x0000cc, 100);
			moveTo(0,0);
			lineTo(_root._width,0);
			lineTo(_root._width,_root._height);
			lineTo(0,_root_root._height);
			endFill();
		}
				
		
		
		
		
		
		
		
		//_root.img_mc.loadMovie("file:///C:/Documents%20and%20Settings/lcc3/Desktop/mtasc/y.gif");
		
		
		
		
		_root.createEmptyMovieClip("img_mc", 999);
		
		
		
		var my_mcl:MovieClipLoader = new MovieClipLoader();
		// Create listener object:
		
		var mclListener:Object = new Object();

		
		mclListener.onLoadInit = function(target_mc:MovieClip, status:Number):Void {
			 _root.tf.text = ("onLoadComplete: " + target_mc + " " + _root.img_mc._width );
								
				var bd = new BitmapData(200, 200, false, 0x00ffff);
				bd.draw(_root.img_mc);
								
				
					var width:Number = 100//_root.img_mc._width;
				  var height:Number = 100//_root.img_mc._height;
				  var transparent:Boolean = true;
				  var fillColor:Number = 0x00FFFFFF;
				
				  var myBitmapData:BitmapData = new BitmapData(width, height,
				transparent,
				 fillColor);
				  myBitmapData.draw(_root.img_mc, new Matrix(), new ColorTransform());
				
				  _root.createEmptyMovieClip("copy_mc", 4);
				  _root.copy_mc._x = 20;
				  _root.copy_mc._y = 30;
				  _root.copy_mc.attachBitmap(myBitmapData, 0);
				
				  _root.img_mc._alpha = 20;

				
		
		};

		my_mcl.addListener(mclListener);
		
		//uncomment this to load the clip
		my_mcl.loadClip("file:///C:/Documents%20and%20Settings/lcc3/Desktop/mtasc/a4small.png", _root.img_mc);
		
		
		
		
	
	
	
		
	}
	
	
	
	
	
	
	
	
	
	
	

	//// entry point
	static function main(mc) {
		app = new Audiad();
	}
}
	