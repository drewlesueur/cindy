import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.geom.Matrix;
import flash.geom.ColorTransform;

class AudiAd4 extends MovieClip
{
	var tfMessage:TextField;
	
	var sW:Number = null; 	// Stage width
	var sH:Number = null;	// Stage height 	
		
	private function AudiAd4 (  )
	{	
	
	var load = function(mc, file, onloadfunction)
	{
		//_root.img_mc.loadMovie("file:///C:/Documents%20and%20Settings/lcc3/Desktop/mtasc/y.gif");

		var my_mcl:MovieClipLoader = new MovieClipLoader();
		
		var mclListener:Object = new Object();
		
		mclListener.onLoadInit = function(target_mc:MovieClip, status:Number):Void {
			 												
				  var transparent:Boolean = true;
				  var fillColor:Number = 0x00FFFFFF;
				
				  var myBitmapData:BitmapData = new BitmapData(mc._width, mc._height, false, 0x00ffff);
				  myBitmapData.draw(mc, new Matrix(), new ColorTransform());
				
				/*
				  _root.createEmptyMovieClip("copy_mc", 4);
				  _root.copy_mc._x = 20;
				  _root.copy_mc._y = 30;
				  _root.copy_mc.attachBitmap(myBitmapData, 0);
				
				  _root.img_mc._alpha = 20;
				  */	
		
		};

		my_mcl.addListener(mclListener);
		
		//uncomment this to load the clip
		my_mcl.loadClip(file, mc);
		
	}
		

		
		_root.createMovieClip("mcc",1);
		load(_root.mcc,"file:///C:/Documents%20and%20Settings/lcc3/Desktop/mtasc/a4small.jpg",function(){})
		//_root.mcc.loadMovie("file:///C:/Documents%20and%20Settings/lcc3/Desktop/mtasc/a4small.jpg");
		_root.mc._x = 0;
		_root.mc._y = 0;
		_root.mc._width = 100;
		_root.mc._height = 100;
		
		
		/*
		var textf=new TextFormat("serpentine", 10);
     textf.color=0xff0000;
     _root.createEmptyMovieClip("textmc", _root.getNextHighestDepth());
     _root.createTextField("text",_root.getNextHighestDepth(),5,40,100,100);
     _root["text"].text = "TEST";
     _root["text"].setTextFormat(textf);
     _root["text"].embedFonts = true;
     _root["text"]._alpha=50;
       
		*/
		
		
	}
	
	static function main ()
	{
		// Create a AudiAd4 instance and 
		// have is assimilate _root.
		var test:AudiAd4 = new AudiAd4( );
	}
}