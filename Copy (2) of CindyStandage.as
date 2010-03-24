import flash.filters.DropShadowFilter;
import flash.geom.Matrix;


import de.alex_uhlmann.animationpackage.*;
import de.alex_uhlmann.animationpackage.animation.*;
import de.alex_uhlmann.animationpackage.drawing.*;
import de.alex_uhlmann.animationpackage.utility.*;
import com.robertpenner.easing.*;




/*
import mx.transitions.Tween;
import mx.transitions.easing.*; 
import com.robertpenner.easing.*;
*/






class CindyStandage {

	static var app : CindyStandage;
	function CindyStandage()
	{
	
	
	
/*
        _       _           _     
       | |     | |         | |    
   __ _| | ___ | |__   __ _| |___ 
  / _` | |/ _ \| '_ \ / _` | / __|
 | (_| | | (_) | |_) | (_| | \__ \
  \__, |_|\___/|_.__/ \__,_|_|___/
   __/ |                          
  |___/                           

*/


//need these for animation
APCore.initialize();
var myListener:Object = new Object();
APCore.addListener(myListener);

	
		//some globals
		var menu_len = 6;
		
		var page = "home";
		
		var ticks = 0;// the global couter;
		var bgrounds = ["home.jpg","music.jpg","tours.jpg","press.jpg","bio.jpg","contact.jpg"]
		var bground_index = 0;
		var bground_path = "backgrounds/";
		var bground_mcs = new Array(menu_len);
		
		
		for (var i = 0; i < bground_mcs.length; i++)
		{
			bground_mcs[i] = _root.createEmptyMovieClip("bground_" + i, _root.getNextHighestDepth());
			bground_mcs[i]._alpha = 0;
			//make them hidden for now
		}
		
		
		
		
		//old stuff except global fade to
		var bg_fade = false;
		var bg_fade_length = 30;
		var bg_fade_to;
		var bg_fade_count = 0;

		//no json in as2
		var navplace = {};
		navplace.home = [320,100];
		navplace.music = [10,100];
		navplace.tours = [10,100];
		navplace.press = [10,100];
		navplace.bio = [10,100];
		navplace.contact = [10,100];

		var headerplace = {}
		headerplace.home = [200,0];
		headerplace.music = [10,0];
		headerplace.tours = [10,0];
		headerplace.press = [10,0];
		headerplace.bio = [10,0];
		headerplace.contact = [50,0];


		
/*
  _______       _       
 |__   __|     | |      
    | | ___ ___| |_ ___ 
    | |/ _ | __| __/ __|
    | |  __|__ \ |_\__ \
    |_|\___|___/\__|___/
        

*/
		
		//these tests work
		//var test = _root.createEmptyMovieClip("test",_root.getNextHighestDepth())	
		//test.loadMovie("backgrounds/home.jpg");
		//bground_mcs[0].loadMovie("backgrounds/tours.jpg");
		
		
		
		
		
		
		_root.createEmptyMovieClip("grid", _root.getNextHighestDepth());
		//_root.grid._x = 0
		//_root.grid._y = 0;
		
		//	_root.grid._width = 160
		//_root.grid._height = 600;


//black background
_root.grid.beginFill(0x000000, 100);
_root.grid.moveTo(0, 0);
_root.grid.lineTo(1280, 0);
_root.grid.lineTo(1280, 800);
_root.grid.lineTo(0, 800);
_root.grid.endFill();

		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
/*

                  _         _                                     _ 
                 (_)       | |                                   | |
  _ __ ___   __ _ _ _ __   | |__   __ _ _ __ ___  _   _ _ __   __| |
 | '_ ` _ \ / _` | | '_ \  | '_ \ / _` | '__/ _ \| | | | '_ \ / _` |
 | | | | | | (_| | | | | | | |_) | (_| | | | (_) | |_| | | | | (_| |
 |_| |_| |_|\__,_|_|_| |_| |_.__/ \__, |_|  \___/ \__,_|_| |_|\__,_|
                                   __/ |                            
                                  |___/                             

*/


		var bground = _root.createEmptyMovieClip("bground", _root.getNextHighestDepth());
			//this is the main background	
		
		
		bground.loadMovie(bground_path + "home.jpg");
		
		
		
		
			
		/*
                      _ _            _      __          _      
                     | (_)          | |    / _|        | |     
   __ _ _ __ __ _  __| |_  ___ _ __ | |_  | |_ __ _  __| | ___ 
  / _` | '__/ _` |/ _` | |/ _ \ '_ \| __| |  _/ _` |/ _` |/ _ \
 | (_| | | | (_| | (_| | |  __/ | | | |_  | || (_| | (_| |  __/
  \__, |_|  \__,_|\__,_|_|\___|_| |_|\__| |_| \__,_|\__,_|\___|
   __/ |                                                       
  |___/                                                        
*/

var gradient_fade = _root.createEmptyMovieClip("gradient_fade", _root.getNextHighestDepth())

var fadesome = function()
{
	
	//gradient_fade.beginFill(0x000000, 100);

	var the_matrix = new Matrix()
	the_matrix.createGradientBox(40, 1, 0, 600, 0)

	gradient_fade.beginGradientFill("linear",[0x000000,0x000000],[0,100],[0,0xFF], the_matrix);

	//gradient_fade._x = 100;
	//gradient_fade._y = 300;
	//gradient_fade._width = 80;

	//gradient_fade.beginFill(0x000000, 100);
	gradient_fade.moveTo(0, 0);
	gradient_fade.lineTo(1280, 0);
	gradient_fade.lineTo(1280, 800);
	gradient_fade.lineTo(0, 800);
	gradient_fade.endFill();
}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
  _                    _           
 | |                  | |          
 | |__   ___  __ _  __| | ___ _ __ 
 | '_ \ / _ \/ _` |/ _` |/ _ \ '__|
 | | | |  __/ (_| | (_| |  __/ |   
 |_| |_|\___|\__,_|\__,_|\___|_|   
                                   
*/



		var header_fmt = new TextFormat("Georgia", 40);
		header_fmt.color=0xffffff;
		header_fmt.align = "center";
		
		var header_mc = _root.createEmptyMovieClip("header",_root.getNextHighestDepth());
		
		var header_txt = header_mc.createTextField("header",header_mc.getNextHighestDepth(),300,0,0,0);			
		header_txt.text = "Cindy Standage";
		header_txt.autoSize = true;
		
		header_txt.setTextFormat(header_fmt);
		
		var ds = new DropShadowFilter();
		ds.blurX= 5;
		ds.blurY= 5;
		header_mc.filters = [ds];

		header_mc._x = headerplace.home[0];
		header_mc._y = headerplace.home[1];
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
                    
                    
  _ __   __ ___   __
 | '_ \ / _` \ \ / /
 | | | | (_| |\ V / 
 |_| |_|\__,_| \_/  
                    
                    

*/
		
		var nav_wrapper = _root.createEmptyMovieClip("nav_wrapper",_root.getNextHighestDepth());
		
		nav_wrapper._x = navplace.home[0];
		nav_wrapper._y = navplace.home[1];
		
		var nav = new Array(menu_len) //6 main menu items;
		var navtext = ["Home","Music","Tours","Press","Bio","Contact"];
		var nav_tf = new Array(menu_len);
		
		var nav_fmt = new TextFormat("Georgia", 16);
		nav_fmt.color=0xdd3311;
		nav_fmt.align = "center";
		
		var nav_fmt_over = new TextFormat("Georgia", 18);
		nav_fmt_over.color=0xff6611;
		nav_fmt_over.align = "center";


		var nav_width = 100
		var nav_height = 50
		for (var i = 0; i < bground_mcs.length; i++)
		{
			nav[i] = nav_wrapper.createEmptyMovieClip("nav_" + i, nav_wrapper.getNextHighestDepth());
			nav[i]._x = i * nav_width;
			nav[i]._y = 0;
			
						
			nav_tf[i] = nav[i].createTextField("navtext",nav[i].getNextHighestDepth(),0,0,nav_width,nav_height);			
			nav_tf[i].text = navtext[i];
			nav_tf[i].setTextFormat(nav_fmt);
			
			
			nav[i].useHandCursor = true;
			
			nav[i].mouseChildren = false;
			
			/*
			nav[i].createEmptyMovieClip("grid", 999)
			nav[i].grid.beginFill(0xFF0000, 100);
			nav[i].grid.moveTo(0, 0);
			nav[i].grid.lineTo(nav_width, 0);
			nav[i].grid.lineTo(nav_width, nav_height);
			nav[i].grid.lineTo(0, nav_height);
			nav[i].grid.endFill();
			*/
			
			nav[i].onPress = function(){
				//this.navtext.text = this.navtext.text.toLowerCase();
				//bg_fade = true;
				//bg_fade_length = 14;
				
				bg_fade_to = bground_path + this.navtext.text.toLowerCase() + ".jpg"
				
				page = this.navtext.text.toLowerCase();
				
				
				//bg_fade_count = 0;

					var myAlpha:Alpha = new Alpha(bground,0,500,Linear.easeInOut,"fadedOut");
					myAlpha.run()
				
				var myMove:Move = new Move(nav_wrapper,navplace[page][0], navplace[page][1], 1000, Quad.easeInOut, "");
				myMove.run();
				
				var myMove2:Move = new Move(header_mc,headerplace[page][0], headerplace[page][1], 1500, Quad.easeInOut, "");
				myMove2.run();
							
			
				
				
			};
			
			nav[i].onRollOver = function(){
				this.navtext.setTextFormat(nav_fmt_over);
			};
			nav[i].onRollOut = function(){
				this.navtext.setTextFormat(nav_fmt);
			};
		}
		
		
		
		








		
		
//var tween:Tween = new Tween(nav_wrapper, "_rotation", Quad.easeOut, 0, 360, 3, true);
//var tween = new Tween(nav_wrapper, "_rotation", Quad.easeOut, 0, 100, 1, true);		
	/*
var myMove:Move = new Move(nav_wrapper);
			myMove.animationStyle(2000,Circ.easeOut,"onCallback");
			myMove.run(650,nav_wrapper._y);
*/
		



		
		
		
		
		
		
		/*
                  _      _     _                        
                 | |    (_)   | |                       
  _ __ ___  _   _| |     _ ___| |_  ___ _ __   ___ _ __ 
 | '_ ` _ \| | | | |    | / __| __|/ _ \ '_ \ / _ \ '__|
 | | | | | | |_| | |____| \__ \ |_|  __/ | | |  __/ |   
 |_| |_| |_|\__, |______|_|___/\__|\___|_| |_|\___|_|   
             __/ |                                      
            |___/                                       


		*/
		
		myListener.fadedOut = function(){
			bground.loadMovie(bg_fade_to);
			
			var myAlpha:Alpha = new Alpha(bground,100,500,Linear.easeInOut,"fadedIn");
			myAlpha.run()
			
			
			
			gradient_fade.clear();
			if (page == "bio" || page == "tours")
				{
					fadesome();
				}

				
		}
		
		
		myListener.fadedIn = function()
		{
			//_root.alert.text = page;
				
				//double check!

		}
		
		
		
		
		
		
		/*
  _____           _                 _ _               _                _                                    _     
 |  __ \         | |               | (_)             | |              | |                                  | |    
 | |__) |_ __ ___| | ___   __ _  __| |_ _ __   __ _  | |__   __ _  ___| | __ __ _ _ __ ___  _   _ _ __   __| |___ 
 |  ___/| '__/ _ \ |/ _ \ / _` |/ _` | | '_ \ / _` | | '_ \ / _` |/ __| |/ // _` | '__/ _ \| | | | '_ \ / _` / __|
 | |    | | |  __/ | (_) | (_| | (_| | | | | | (_| | | |_) | (_| | (__|   <| (_| | | | (_) | |_| | | | | (_| \__ \
 |_|    |_|  \___|_|\___/ \__,_|\__,_|_|_| |_|\__, | |_.__/ \__,_|\___|_|\_\\__, |_|  \___/ \__,_|_| |_|\__,_|___/
                                               __/ |                         __/ |                                
                                              |___/                         |___/                                 


		*/
		//PRELOADING BACKGROUNDS
		
			//you may need this in the future!
		var my_mcl:MovieClipLoader = new MovieClipLoader();
		// Create listener object:
		var mclListener:Object = new Object();
				
		mclListener.onLoadInit = function(target_mc:MovieClip, status:Number):Void {
			 //_root.alert.text = (_root.littleguy_mc._width + " " + _root.littleguy_mc._width);
								
				//littleguy_bitmaps[littleguy_index] = new BitmapData(_root.littleguy_mc._width, _root.littleguy_mc._height, true, 0x00ffff);
				//littleguy_bitmaps[littleguy_index].draw(_root.littleguy_mc);
				
				//_root.littleguy_mc2.attachBitmap(littleguy_bitmaps[littleguy_index], 1);
				bground_index++;
				
				if (bground_index < bground_mcs.length)
				{my_mcl.loadClip(bground_path + bgrounds[bground_index],bground_mcs[bground_index]);}
				else
				{
					 //_root.littleguy_mc2._alpha = 0;
					 //_root.littleguy_mc._alpha = 0;
				}
				
		};
		
		my_mcl.addListener(mclListener);
		//uncomment this to load the clip
		my_mcl.loadClip(bground_path + bgrounds[0], bground_mcs[0]);

		
		
		
		/*
		     _           _     _              _   _                
     /\   | |         | |   | |            | | | |               
    /  \  | | ___ _ __| |_  | |_  _____  __| |_| |__   ___ __  __
   / /\ \ | |/ _ \ '__| __| | __|/ _ \ \/ /| __| '_ \ / _ \\ \/ /
  / ____ \| |  __/ |  | |_  | |_|  __/>  < | |_| |_) | (_) |>  < 
 /_/    \_\_|\___|_|   \__|  \__|\___/_/\_\ \__|_.__/ \___//_/\_\
                                                                 
          */                                                       


		
		//Alert text box!
		_root.createTextField("alert",_root.getNextHighestDepth(),0,0,200,50);
		_root.alert.textColor = 0x000000;		
		_root.alert.text = "YES"

		
		
		
		
		
		var bg_fade_inc
		var checkfade = function(ticker)
		{
			if (bg_fade == true)
			{
				bg_fade_inc = 100 / (bg_fade_length / 2)
				
				if (bg_fade_count < (bg_fade_length / 2))
				{
					bground._alpha -= bg_fade_inc;
				}
				
				//fade length must be even
				if (bg_fade_count == (bg_fade_length / 2))
				{
					bground._alpha = 0;
					bground.loadMovie(bg_fade_to);
					bground._alpha = 0;
				}
				
				if (bg_fade_count > (bg_fade_length / 2))
				{
					
					
					
					bground._alpha += bg_fade_inc;
				}
				
				bg_fade_count++;
				
				if (bg_fade_count == bg_fade_length)
				{
					bg_fade = false;
					bground._alpha = 100;
				}
			}
			
		
		
		
		}
		
		
		
		
/*		
	
                  _         _                   
                 (_)       | |                  
  _ __ ___   __ _ _ _ __   | | ___   ___  _ __  
 | '_ ` _ \ / _` | | '_ \  | |/ _ \ / _ \| '_ \ 
 | | | | | | (_| | | | | | | | (_) | (_) | |_) |
 |_| |_| |_|\__,_|_|_| |_| |_|\___/ \___/| .__/ 
                                         | |    
                                         |_|    
*/
		
		 


		_root.onEnterFrame = function()
		{
			checkfade(ticks);
			ticks++;
		
		
		}
	
	}
	
	
    //// entry point
    static function main(mc) 
    {
		app = new CindyStandage();
	}

}