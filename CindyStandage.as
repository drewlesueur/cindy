//compile like
//s cindystandage

import flash.filters.*
import flash.geom.Matrix;
import flash.external.ExternalInterface;


import de.alex_uhlmann.animationpackage.*;
import de.alex_uhlmann.animationpackage.animation.*;
import de.alex_uhlmann.animationpackage.drawing.*;
import de.alex_uhlmann.animationpackage.utility.*;
import com.robertpenner.easing.*;


import flash.display.BitmapData;

/*
import mx.transitions.Tween;
import mx.transitions.easing.*; 
import com.robertpenner.easing.*;
*/






class CindyStandage {

	static var app : CindyStandage;
	
		private var video:Video;
	private var nc:NetConnection;
	private var ns:NetStream;
	


	function CindyStandage()
	{
        
        var top_button_index = 0;
        var ds_;
        ds_ = new DropShadowFilter();
		ds_.blurX= 8;
		ds_.blurY= 8;
		ds_.distance = 3;
	
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
var so = SharedObject.getLocal("cindy");



//need these for animation
APCore.initialize();
var myListener:Object = new Object();
APCore.addListener(myListener);



	
	
	
	// Create a NetConnection object
		nc = new NetConnection();
		// Create a local streaming connection
		nc.connect(null);
		ns = new NetStream(nc);
    


	var the_ns = ns
	var the_nc = nc;
	var the_video = video;
	
	 
	var music1 = _root.createEmptyMovieClip("music1",_root.getNextHighestDepth())
	
	var videoSound = new Sound(_root.music1);

	_root.music1.attachAudio(ns);
		

var bg_music = ["music/1.flv","music/2.flv","music/3.flv","music/4.flv"];

var bg_music_index;



	var get_saved_music_index = function()
    {
      //return so.data.bg_music_index  
      return ExternalInterface.call("get_music_index")
    }
    
    var save_music_index = function()
    {
       //so.data.bg_music_index =  bg_music_index
       ExternalInterface.call("save_music_index",bg_music_index);
    }
    
    

//var bg_music_index = so.data.bg_music_index || 0;
//so.data.bg_music_index =  bg_music_index






ExternalInterface.addCallback("saveMusic",null,function(){

  //var the_music_index = bg_music_index + 1;
  //if (the_music_index >= bg_music.length)
  //{
  //  the_music_index = 4 - bg_music_index;
  //}
  //so.data.bg_music_index = 3
  
});


ns.setBufferTime(15);
    
  //ns.play(bg_music[bg_music_index])     //, 300 * 30 || so.data.song_pos || 0);
  //look for the default state
  
  
  
  //ExternalInterface.call("alert",so.data.song_pos);
  //ns.seek(so.data.song_pos);
  
  //videoSound.setVolume(0);
  
  ExternalInterface.addCallback("volumeUp",null,function(){videoSound.setVolume(100);});
  ExternalInterface.addCallback("mainsong",null,function(){the_ns.play("music/1.flv")});
  
  
  
  var _status;
  
   //ExternalInterface.call("log",":|:|")
   
   var flushed = false
   
  ns.onStatus = function(infoObject:Object) {
            _status =  (infoObject.code);
            if (infoObject.code == "NetStream.Play.Stop")
            {
               bg_music_index++
              
                if(bg_music_index == bg_music.length)
                {
                  bg_music_index = 0;
                }
                //so.data.bg_music_index =  bg_music_index
                save_music_index();
                
                the_ns.play(bg_music[bg_music_index]);
             
            }
             if (_status == "NetStream.Seek.Notify")
             {
                //ExternalInterface.call("alert",the_ns.time)
             }
             
            //ExternalInterface.call("titlee",_status)
            //ExternalInterface.call("log",_status + the_ns.time)
            
            if (_status == "NetStream.Buffer.Flush")
             {
                if (flushed == false)
                 {
                 //the_ns.seek(so.data.song_pos);
                 flushed = true;
                 }
             }

        }
  
  
//see bottom
   
   









	
		//some globals
		var menu_len = 7;
		var page;
		
      var put = "";
		
		
		
		var prevpage = "";
		
		var ticks = 0;// the global couter;
		var bgrounds = ["home.jpg","about.jpg","music.jpg","photos.jpg","tours.jpg","press.jpg","contact.jpg"]
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
		navplace.home = [317,120];
		navplace.music = [610,140];
		navplace.tours = [610,140];
		navplace.press = [35,140];
		navplace.about = [610,140];
		navplace.photos = [610,140];
		navplace.contact = [35,140];



		var headerplace = {}
		headerplace.home = [377,-40];
		headerplace.music = [645,-20];
		headerplace.tours = [645,-20];
		headerplace.press = [250,-20];
		headerplace.about = [645,-20];
		headerplace.photos = [645,-20];
		headerplace.contact = [250,-20];
		
		
				var bloggerplace = {}
		bloggerplace.home = [50,750];
		bloggerplace.music = [50,750];
		bloggerplace.tours = [10,750];
		bloggerplace.press = [50,750];
		bloggerplace.about = [50,750];
		bloggerplace.photos = [50,750];
		bloggerplace.contact = [50,750];
		
				var myspaceplace = {}
		myspaceplace.home = [172,750];
		myspaceplace.music = [172,750];
		myspaceplace.tours = [122,750];
		myspaceplace.press = [172,750];
		myspaceplace.about = [172,750];
		myspaceplace.photos = [172,750];
		myspaceplace.contact = [172,750];
		

				var fisherplace = {}
		fisherplace.home = [320,729];
		fisherplace.music = [320,729];
		fisherplace.tours = [390,729];
		fisherplace.press = [320,729];
		fisherplace.about = [320,729];
		fisherplace.photos = [320,729];
		fisherplace.contact = [320,729];
		
		
		
		var purchaseplace = {}
		purchaseplace.home = [0,0];
		purchaseplace.music = [0,0];
		purchaseplace.tours = [0,0];
		purchaseplace.press = [0,0];
		purchaseplace.about = [0,0];
		purchaseplace.photos = [0,0];
		purchaseplace.contact = [0,0];
		
		
		var mailingplace = {}
		mailingplace.home = [0,0];
		mailingplace.music = [0,0];
		mailingplace.tours = [0,0];
		mailingplace.press = [0,0];
		mailingplace.about = [0,0];
		mailingplace.photos = [0,0];
		mailingplace.contact = [0,0];
		




		
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
		bground.cacheAsBitmap= true;
		
		//bground.loadMovie(bground_path + "home.jpg");
		
		
		
		
			
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
		
		
		
		
		
		
		
		var blogger = _root.createEmptyMovieClip("blogger",_root.getNextHighestDepth());
		
		
var myspace = _root.createEmptyMovieClip("myspace",_root.getNextHighestDepth());
var fisher = _root.createEmptyMovieClip("fisher",_root.getNextHighestDepth());
		
		
blogger._x = 50;
  blogger._y = 750;
    myspace._x = 172;
  myspace._y = 750;  
    fisher._x = 320;
  fisher._y = 750;
  		
		
		
		
		
		
		/*
  _                    _           
 | |                  | |          
 | |__   ___  __ _  __| | ___ _ __ 
 | '_ \ / _ \/ _` |/ _` |/ _ \ '__|
 | | | |  __/ (_| | (_| |  __/ |   
 |_| |_|\___|\__,_|\__,_|\___|_|   
                                   
*/



		var header_fmt = new TextFormat("novita", 70);
		header_fmt.color=0xffffff;
		header_fmt.align = "center";
		
		var header_mc = _root.createEmptyMovieClip("header",_root.getNextHighestDepth());
		
		var header_txt = header_mc.createTextField("header",header_mc.getNextHighestDepth(),0,0,500,300);			
		header_txt.text = "\nCindy Standage";
		//header_txt.autoSize = true;
			
		header_txt.setTextFormat(header_fmt);
	
		
		//only when you are using font with swfmill
		header_txt.embedFonts = true;
		
		var ds = new DropShadowFilter();
		ds.blurX= 5;
		ds.blurY= 5;
		header_mc.filters = [ds];

		header_mc._x = headerplace.home[0];
		header_mc._y = headerplace.home[1];
		
		
		
		
		
		
		
		var go_home = function()
		{
      //the_ns.play("music/1.flv");
		}
		
		
		
		/*
  _____  _           _             
 |  __ \| |         | |            
 | |__) | |__   ___ | |_  ___  ___ 
 |  ___/| '_ \ / _ \| __|/ _ \/ __|
 | |    | | | | (_) | |_| (_) \__ \
 |_|    |_| |_|\___/ \__|\___/|___/
		*/
		
		//photos

var photos = _root.createEmptyMovieClip("photos",_root.getNextHighestDepth());

photos._y = 80
photos._x = 30
//photos._width = 100;
//photos._height = 100;


var go_photo = function(){
if (page == "photos")
{

var photos2 = photos.createEmptyMovieClip("photos2",photos.getNextHighestDepth());
		
		
var my_mcl3:MovieClipLoader = new MovieClipLoader();
		// Create listener object:
		var mclListener3:Object = new Object();
				
		mclListener3.onLoadComplete = function(target_mc:MovieClip, status:Number):Void {
			 						
		//_root._xscale = (1000/1250) * 100;
		//_root._yscale = (600/800) * 100;
		
		Stage.scaleMode = "scale";
		Stage.align = "TL"
		_root.scaleMode = "scale";
		_root.align = "TL"
				

		
		};
		
		my_mcl3.addListener(mclListener3);
		//uncomment this to load the clip
		my_mcl3.loadClip("viewer.swf", photos2);		
		
		//photos.loadMovie("header.swf");

		
		

		}
	
}
		
		
		















/*
           _                 _   
     /\   | |               | |  
    /  \  | |__   ___  _   _| |_ 
   / /\ \ | '_ \ / _ \| | | | __|
  / ____ \| |_) | (_) | |_| | |_ 
 /_/    \_\_.__/ \___/ \__,_|\__|
                                 
                                 


*/

 var about = _root.createEmptyMovieClip("about",_root.getNextHighestDepth());
 about._x = 700
 about._y = 200
 
 var about_index;
 
 
 var abouts = [
 "        <font size = '26' color = '#ffffff'>Cindy knows and loves the feel of walking on a stage.  The lights are low and the crowd cheers.  When she hears her name and the music starts to play, anything and everything was worth the moment.  It only takes one look at her fiery red hair, huge smile and the groove of the music to feel just like she does.  You are certain she is loving it.....it shows in every note she sings and every move she makes.  She has a lifelong love of country music, never misses a chance to do a smooth love song and loves to rock the house down.  Whether it’s an acoustic set with a softer feel or the whole band is on the stage, you know a lot about her through her songs.  She has emerged as a songwriter in recent years and she writes of her personal life freely.  You feel the passion as she tells you about her \"sweet husband\".  She usually points him out in the crowd and he shyly smiles and looks proudly at her.  As they interact, the songs explain themselves.  She puts on a show that you are most likely never to forget.</font> "
,
"<font size = '26' color = '#ffffff'>Cindy has worked with incredible artists.  She will always tell you that the bigger the artist, the nicer they are…..and they are always nice to her.  Randy Travis, Merle Haggard, George Jones, Clay Walker, Neal McCoy, Luke Bryan and Steve Holy to name a few.  She also enjoys the festivals and the headliners that go along with them.  The crowds are big and the atmosphere is made for her.  At every show, she takes more time selling and signing CD’s than she spends performing on the stage.  Everyone feels they know her when they go home."  
+ "\n\n" +
"        Her humanitarian spirit comes through at every performance as she tells about why she gives 20% of the profit from her CD <a href = 'http://cdbaby.com/cd/cindystandage'><font size = '26'color = '#78292c'>Same Red Hair</font></a> to the Fisher House. These homes provide everything a person, or family, needs while their loved one, coming back from the war is cared for in the nearby Veterans Hospital.</font>"
,
"<font size = '26' color = '#ffffff'> She has taken her band to Hawaii twice to do benefit concerts at the Tripler Army Medical Center and has grown to appreciate all the Fisher House stands for. "
+ "\n\n" +
 "        As a young girl, she made the trip to Nashville.  She knocked on the right door at the right time, and found herself in the office of Shelby Singleton, owner of Sun Records.  The next morning she found herself performing on the “Ralph Emery Morning Show”.  And the rest is history..... </font>" 
 ]
 
 
 
var go_about = function(){
//_root._xscale = 70;
   
   var can_click_next = false;
		var can_click_prev = false;
		if (about_index < abouts.length - 1)
		{
      can_click_next = true;
		}
		if (about_index > 0)
		{
      can_click_prev = true;
		}
   
   
    //purchase.loadMovie("purchase.png");
		
	
		var about_txt = about.createTextField("about_txt",about.getNextHighestDepth(),20,0,450,520);
		about_txt.html = true;

		
		var about_fmt = new TextFormat("eaves");
		//about_fmt.color=0xffffff;
		about_fmt.align = "left";
		
		var about_fmt_2 = new TextFormat("eaves", 26);
		about_fmt_2.color=0xffdc58;
		about_fmt_2.align = "left";
		
		
		var about_fmt_gray = new TextFormat("eaves", 26);
		about_fmt_gray.color=0x555555;
		about_fmt_gray.align = "left";
		
		
		about_txt.wordWrap = true
		
		about_txt.htmlText = abouts[about_index]
		//header_txt.autoSize = true;
			
		about_txt.setTextFormat(about_fmt);
	

		//only when you are using font with swfmill
		about_txt.embedFonts = true;
		
		
		
		
		var about_next = about.createEmptyMovieClip("about_next",about.getNextHighestDepth())
		about_next._y = 500;
		about_next._x = 400;
		var about_next_txt = about_next.createTextField("about_next_txt",about_next.getNextHighestDepth(),0,0,50,20);
					
		about_next_txt.text = "Next";
					
		if (can_click_next == true)
		{
      about_next_txt.setTextFormat(about_fmt_2);
      
      
      
    }
    else
    {
      about_next_txt.setTextFormat(about_fmt_gray);
    }
		//only when you are using font with swfmill
		about_next_txt.embedFonts = true;
		
		
		
		
				var about_prev = about.createEmptyMovieClip("about_prev",about.getNextHighestDepth())
		about_prev._y = 500;
		about_prev._x = 0;
		var about_prev_txt = about_prev.createTextField("about_prev_txt",about_prev.getNextHighestDepth(),0,0,70,25);
					
		about_prev_txt.text = "Previous";
		
		if (can_click_prev == true)
		{			
		about_prev_txt.setTextFormat(about_fmt_2);
    }
    else
    {
      about_prev_txt.setTextFormat(about_fmt_gray);
    }
    
    
		//only when you are using font with swfmill
		about_prev_txt.embedFonts = true;
		
	
		
		
		
		
		
		
		about_next.onPress= function()
		{
      if (can_click_next == true)
      {
        can_click_prev = true;
      about_index++;
      so.data.about_index = about_index;
      
      about_txt.htmlText = abouts[about_index];
      about_txt.setTextFormat(about_fmt);
      
      about_prev_txt.setTextFormat(about_fmt_2);
      
      if (about_index >= abouts.length - 1)
      {
        about_next_txt.setTextFormat(about_fmt_gray);
        can_click_next = false;
        about_index = abouts.length - 1;
        so.data.about_index = about_index;
      }
      }
		}
		
		
		about_prev.onPress= function()
		{
      
      if (can_click_prev == true)
      {
        can_click_next = true;
      about_index--;
      so.data.about_index = about_index;
      about_txt.htmlText = abouts[about_index];
      about_txt.setTextFormat(about_fmt);
      
      about_next_txt.setTextFormat(about_fmt_2);
      if (about_index < 1)
      {
        about_index = 0;
        so.data.about_index = about_index;
        about_prev_txt.setTextFormat(about_fmt_gray);
        can_click_prev = false;
      }
      }
		}
		

}
		
		
	
	
	
	
	
	
	
	
	
	
	
/*
  _______                   
 |__   __|                  
    | | ___  _   _ _ __ ___ 
    | |/ _ \| | | | '__/ __|
    | | (_) | |_| | |  \__ \
    |_|\___/ \__,_|_|  |___/
                            
                            

*/
 var tours = _root.createEmptyMovieClip("tours",_root.getNextHighestDepth());
 tours._x = 700
 tours._y = 200
 
 var tours_index;


 
 
 var tourss = [
 
 
  "August 15, 2009\nOld Tucson Movie Studio with Darryl Worley\nTime – TBA\n\n" +
  
 "July 15, 2009\nOpening with George Jones\nCelebrity Theatre-Doors Open 7:00 p.m.\nPhoenix, AZ\n\n" +
 

"July 4, 2009\nRilito Park with Tracy Lawrence, Pat Green & Gloriana\nGates open at 5:00pm\nFireworks after the show\n\n"+
 
"July 3, 2009\nCliff Castle Casino with Dwight Yoakam & Emerson Drive\nVenue opens at 6:00pm\nFireworks after the show\n\n"+  
 
 

 
 "",
 
 
 "<font color = '#889aaf'>Previous Events:</font>\n\n" +


"June 17, 2009\nOpening with Loretta Lynn\nCelebrity Theatre-Doors Open 7:00 p.m\nPhoenix, AZ\n\n" +
 
"March 25, 2009 \n Celebrity Hall Of Fame Game Ho-Ho-Kam Stadium \n Mesa, Arizona \n\n" + 


"April 22, 2009\nToby Keith's New Bar\n202 and Dobson\nMesa, Arizona \n\n" +

"Nov 2008 \nHonolulu, Hawaii\nTripler Army Medical Center\n\n" +
  
"",

 


"November 8, 2008\nUS Airways Center - Star Spangled Banner\nPhoenix, Arizona\n\n" +
 
"Sep 20, 2008\nKIIM Country Music Festival, Tucson, AZ\nCindy Standage, Steve Holy, Clay Walker, Jake Owen,\nHeidi Newfield\n\n" +


"Jul 18, 2008\nCountry Thunder USA, Wisconsin\n\n" +


"Jul 15, 2008\nMary Wilson and the Supremes\nPrivate Party - Kansas City\n\n" +

"",



"May 2, 2008\nOpening with George Jones\n\n" +

"Apr 18, 2008\nCountry Thunder USA, Arizona\nGraham Central Station\n\n" +

"Apr 18, 2008\nCountry Thunder USA, Arizona\nMain Stage\n\n" +


"Mar 28, 2008\nHall of Fame Cubs Game\nHohokam Stadium\n\n" +

"",



"Feb 17, 2008\n Sara Evans\nMesa Performing Arts Center\n\n" +



"Feb 10, 2008\nAlan Jackson\nTim's Toyota Center\n\n" +

"Nov 9, 2007\nTripler Army Medical Center\nHonolulu, Hawaii\n\n" +

"Nov 10, 2007\nBYU Hawaii - Concert Series\n\n" +

"",

"Sep 28, 2007\nTrisha Yearwood\nMesa Arts Center\n\n" + 
"Sep 22, 2007\nKIIM Country Music Festival\nCindy Standage, Neal McCoy, Clay Walker,\nTrent Tomlinson, and Luke Bryan\nTucson Electric Park\n\n" +

"Sep 21, 2007\nNeal McCoy\nKNIX at Westgate\n\n" +

"Aug 24, 2007\nOpening for Donny Osmond\nCelebrity Theatre\n\n" +


"Aug 3, 2007\nTim McGraw and Faith Hill\nJobing.com Arena\n"
]
 
 /*
 var tourss = [
 "<font size = '25' color = '#ffffff'>" + 
"<font size = \"30\">The 2007 KIIM-FM Country Music Festival</font>" + "\n" + 
"<font color = \"#dddd99\">2007</font>" + "\n\n" +
//"<a href = \"http://www.kiimfm.com/Article.asp?id=451810\"><font color = \"#0000ff\">Read the Article</font></a>" +


"<font size = '30'>Country Thunder</font>" + "\n" + 
"<font color = \"#dddd99\">April 17, 2008</font>" + "\n" + 
"<a href = \"http://www.countrythunder.com/ct_2003/assets/08web/az/azLineup.html\" ><font color = \"#0000ff\">See me on the lineup</font></a>" + "\n\n" + 

"<font size = '30'>US Airways Center - Star Spangled Banner</font>" + "\n" +
"<font color = \"#dddd99\">November 8, 2008" + "\n" + 
"Phoenix, Arizona</font>" + "\n\n" + 

"<font size = '30'>All Star Baseball Game Ho-Ho-Kam Stadium</font>" + "\n" +
"<font color = \"#dddd99\">March 25, 2009 5:00 PM" + "\n" + 
"Mesa, Arizona</font>" + "\n\n" ,


"<font size = '30'>Chosa Harley Davidson w/Charlie Daniels</font>" + "\n" +
"<font color = \"#dddd99\">March 27, 2009 05:00 PM" + "\n"+
"Mesa, Arizona</font>" + "\n\n" + 


"<font size = '30'>Toby Keith's New Bar</font>"     + "\n"+
"<font color = \"#dddd99\">April 7, 2009 08:00 PM" + "\n"+
"202 Freeway and Dobson, Mesa, Arizona</font>" + "\n"
 ]
 */
 
 
var go_tours = function(){

  var can_click_next = false;
  var can_click_prev = false;
		if (tours_index < tourss.length - 1)
		{
      can_click_next = true;
		}
		if (tours_index > 0)
		{
      can_click_prev = true;
		}

   
    //purchase.loadMovie("purchase.png");
		
	
		var tours_txt = tours.createTextField("tours_txt",tours.getNextHighestDepth(),20,0,450,520);
    tours_txt.html = true; //comment this html try
		
		
		
		var tours_css:TextField.StyleSheet = new TextField.StyleSheet();
    tours_css.onLoad = function(success:Boolean) {
    if (success) {
        tours_txt.styleSheet = tours_css;
        //tours_txt.htmlText = newsText;
    }
    };
    //tours_css.load("styles.css");
		
		
		
		
		
		
		
		
		
		
		var tours_fmt = new TextFormat("eaves",22); //change to eaves
		//tours_fmt.color=0xffffff;
		tours_fmt.align = "left";
		
		var tours_fmt2 = new TextFormat("eaves", 26); 
		tours_fmt2.color=0xffdc58;
		tours_fmt2.align = "left";
		
		
		var tours_fmt_gray = new TextFormat("eaves", 26);
		tours_fmt_gray.color=0x555555;
		tours_fmt_gray.align = "left";
		
		
		tours_txt.wordWrap = true
		
		tours_txt.htmlText =  "<font color = '#ffffff'>" + tourss[tours_index] + "</font>"
		//header_txt.autoSize = true;
			
		tours_txt.setTextFormat(tours_fmt);
	

		//only when you are using font with swfmill
		tours_txt.embedFonts = true;  //uncomment this html try
		
		
		
		
		var tours_next = tours.createEmptyMovieClip("tours_next",tours.getNextHighestDepth())
		tours_next._y = 500;
		tours_next._x = 400;
		var tours_next_txt = tours_next.createTextField("tours_next_txt",tours_next.getNextHighestDepth(),0,0,50,20);
					
		tours_next_txt.text = "Next";
					
		if (can_click_next == true)
		{
		tours_next_txt.setTextFormat(tours_fmt2);
    }
    else
    {
      tours_next_txt.setTextFormat(tours_fmt_gray);
    }
    
		//only when you are using font with swfmill
		tours_next_txt.embedFonts = true;
		
		
		
		
				var tours_prev = tours.createEmptyMovieClip("tours_prev",tours.getNextHighestDepth())
		tours_prev._y = 500;
		tours_prev._x = 0;
		var tours_prev_txt = tours_prev.createTextField("tours_prev_txt",tours_prev.getNextHighestDepth(),0,0,70,25);
					
		tours_prev_txt.text = "Previous";
		
		
		if (can_click_prev == true)	
		{
		tours_prev_txt.setTextFormat(tours_fmt2);
		}
		else
		{		
		tours_prev_txt.setTextFormat(tours_fmt_gray);
    }
		//only when you are using font with swfmill
		tours_prev_txt.embedFonts = true;
		
	
		
	
		
		tours_next.onPress= function()
		{
      if (can_click_next == true)
      {
        can_click_prev = true;
      tours_index++;
      so.data.tours_index = tours_index;
      tours_txt.htmlText = "<font color = '#ffffff'>" + tourss[tours_index] + "</font>"
      tours_txt.setTextFormat(tours_fmt);
      
      tours_prev_txt.setTextFormat(tours_fmt2);
      
      if (tours_index >= tourss.length - 1)
      {
        tours_next_txt.setTextFormat(tours_fmt_gray);
        can_click_next = false;
        tours_index = tourss.length - 1;
        so.data.tours_index = tours_index;
        
        
      }
      }
		}
		
		
		tours_prev.onPress= function()
		{
      
      if (can_click_prev == true)
      {
        can_click_next = true;
      tours_index--;
      so.data.tours_index = tours_index;
      tours_txt.htmlText = "<font color = '#ffffff'>" + tourss[tours_index] + "</font>"
      tours_txt.setTextFormat(tours_fmt);
      
      tours_next_txt.setTextFormat(tours_fmt2);
      if (tours_index < 1)
      {
        tours_index = 0;
        so.data.tours_index = tours_index;
        tours_prev_txt.setTextFormat(tours_fmt_gray);
        can_click_prev = false;
      }
      }
		}
		

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
/*
  _____                   
 |  __ \                  
 | |__) |_ __ ___ ___ ___ 
 |  ___/| '__/ _ | __/ __|
 | |    | | |  __|__ \__ \
 |_|    |_|  \___|___/___/
                           

*/
 var press = _root.createEmptyMovieClip("press",_root.getNextHighestDepth());
 press._x = 50
 press._y = 200
 
 var press_index;
 			
 
 
 
 var click_link = "<font size = '22' color = '#dddd11'> &nbsp;&nbsp;click</font></a>";
 var presss = [
 
 "<font face =  'eaves' color = '#ffffff' size = '25'>" + 
 
"- <a href = 'http://cindystandage.com/sfh.html'>Cindy and Loretta Lynn Raise $14,000 For The Fisher House" + click_link+"</a>\n\n" +
 
"- <a href = 'http://cindystandage.com/airplay.html'>Cindy Standage #1 on Roots Airplay Top 50" + "\n" +
"April 9, 2009" + click_link + "</a>\n\n" +
 
 "- <a href = 'http://regulus2.azstarnet.com/blogs/mycountry/11488/a-twang-filled-end-to-su'> A twang-filled end to summer '08" + "\n" +
"\"The show also marked the return of Phoenix standout Cindy Standage, who wowed Tucson at last year's festival\"" + "\n" +
"September 21, 2008" + click_link + "</a>\n\n" +


"- <a href = 'http://www.pvtrib.com/main.asp?Search=1&ArticleID=47599&SectionID=74&SubSectionID=404&S=1'>Cindy Standage brings family experience to her music" + "\n" +
"April 30, 2008" + click_link + "</a>\n\n" +


"- <a href = '202677.php'>Country fans soak it in as festival ends long 'drought'" + "\n" +
"September 23, 2007" + click_link + "</a>\n\n" + 

"- <a href = 'http://newsroom.byuh.edu/node/1450/print'>Rising country star part of Performance Series" + "\n" +
"October 29, 2007" + click_link + "</a>\n\n" +



 "" +
 "- <a href = 'http://www.kiimfm.com/Article.asp?id=451810'>The 2007 KIIM-FM Country Music Festival" +  click_link + "\n" +
"2007</a>" + "\n\n" +



"</font>"
 ]
 
 
 
var go_press = function(){

/*
  press.createEmptyMovieClip("grid", press.getNextHighestDepth())
			press.grid.beginFill(0x333333, 100);
			press.grid.moveTo(0, 0);
			press.grid.lineTo(500, 0);
			press.grid.lineTo(500, 500);
			press.grid.lineTo(0, 500);
			press.grid.endFill();
		press.grid._alpha = 75;
   */
   
   
   

var can_click_next = false;
		var can_click_prev = false;
		if (press_index < presss.length - 1)
		{
      can_click_next = true;
		}
		if (press_index > 0)
		{
      can_click_prev = true;
		}
  
	
		var press_txt = press.createTextField("press_txt",press.getNextHighestDepth(),20,0,450,520);
    press_txt.html = true; //comment this html try
		
		var press_fmt = new TextFormat(); //change to eaves
		//press_fmt.color=0xffffff;
		
		press_fmt.align = "left";
		
		var press_fmt2 = new TextFormat("eaves", 26); 
		press_fmt2.color=0xffdc58;
		press_fmt2.align = "left";
		
		
		var press_fmt_gray = new TextFormat("eaves", 26);
		press_fmt_gray.color=0x555555;
		press_fmt_gray.align = "left";
		
		
		press_txt.wordWrap = true
		
		press_txt.htmlText =  presss[press_index]
		//header_txt.autoSize = true;
			
		press_txt.setTextFormat(press_fmt);
	

		//only when you are using font with swfmill
		press_txt.embedFonts = true;  //uncomment this html try
		
		
		
		
		var press_next = press.createEmptyMovieClip("press_next",press.getNextHighestDepth())
		press_next._y = 500;
		press_next._x = 400;
		var press_next_txt = press_next.createTextField("press_next_txt",press_next.getNextHighestDepth(),0,0,50,20);
					
		//press_next_txt.text = "Next";
		
		if (can_click_next == true)
		{
      press_next_txt.setTextFormat(press_fmt2); 
		}
		else
		{			
      press_next_txt.setTextFormat(press_fmt_gray); 
    }
    
		//only when you are using font with swfmill
		press_next_txt.embedFonts = true;
		
		
		
		
				var press_prev = press.createEmptyMovieClip("press_prev",press.getNextHighestDepth())
		press_prev._y = 500;
		press_prev._x = 0;
		var press_prev_txt = press_prev.createTextField("press_prev_txt",press_prev.getNextHighestDepth(),0,0,70,25);
					
		//press_prev_txt.text = "Previous";
					
		if (can_click_prev == true)
		{
      press_prev_txt.setTextFormat(press_fmt2); 
		}
		else
		{			
      press_prev_txt.setTextFormat(press_fmt_gray); 
    }
	
		//only when you are using font with swfmill
		press_prev_txt.embedFonts = true;
		
	
		
	
		
		  var ds_nav = new DropShadowFilter();
		ds_nav.blurX= 8;
		ds_nav.blurY= 8;
		ds_nav.distance = 3;
		press.filters = [ds_nav,ds_nav,ds_nav];
		
		
		
		press_next.onPress= function()
		{
      if (can_click_next == true)
      {
        can_click_prev = true;
      press_index++;
      so.data.press_index = press_index;
      press_txt.htmlText = presss[press_index];
      press_txt.setTextFormat(press_fmt2);
      
      press_prev_txt.setTextFormat(press_fmt2);
      
      if (press_index >= presss.length - 1)
      {
        press_next_txt.setTextFormat(press_fmt_gray);
        can_click_next = false;
        press_index = presss.length - 1;
        so.data.press_index = press_index;
        
      }
      }
		}
		
		
		press_prev.onPress= function()
		{
      
      if (can_click_prev == true)
      {
        can_click_next = true;
      press_index--;
      so.data.press_index = press_index;
      press_txt.htmlText = presss[press_index];
      press_txt.setTextFormat(press_fmt);
      
      press_next_txt.setTextFormat(press_fmt2);
      if (press_index < 1)
      {
        press_index = 0;
        so.data.press_index = press_index;
        press_prev_txt.setTextFormat(press_fmt_gray);
        can_click_prev = false;
      }
      }
		}
		

}
	
	
	
	
	
	
	/*
	var music2 = _root.createEmptyMovieClip("music2",_root.getNextHighestDepth())
	var music3 = _root.createEmptyMovieClip("music3",_root.getNextHighestDepth())
	
	var sound2 = new Sound(_root.music2)
	var sound3 = new Sound(_root.music3)
	
	
	sound2.loadSound("music/cindystandage-01.mp3",false);
	sound2.onLoad = function()
	{
    sound2.start();
	}
	
	sound3.loadSound("music/cindystandage-02.mp3",false);
		sound3.onLoad = function()
	{
    sound3.start();
	}
	
	sound2.setVolume(50);
	sound3.setVolume(100);
	*/
	
	
	
/*
  __  __           _      
 |  \/  |         (_)     
 | \  / |_   _ ___ _  ___ 
 | |\/| | | | / __| |/ __|
 | |  | | |_| \__ \ | (__ 
 |_|  |_|\__,_|___/_|\___|
                          
*/
	
	
	var songs = ["cindystandage-01.mp3",
	"cindystandage-02.mp3",
	"cindystandage-03.mp3",
	"cindystandage-04.mp3",
	"cindystandage-05.mp3",
	"cindystandage-06.mp3",
	"cindystandage-07.mp3",
	"cindystandage-08.mp3",
	"cindystandage-09.mp3",
	"cindystandage-10.mp3",
	"cindystandage-11.mp3",
	"cindystandage-12.mp3",
	"cindystandage-13.mp3"	]
	
	
	var songs_2 = [
        "2/1.mp3",
        "2/2.mp3",
        "2/3.mp3",
        "2/4.mp3",
        "2/5.mp3",
        "2/6.mp3",
        "2/7.mp3",
        "2/8.mp3",
        "2/9.mp3",
        "2/10.mp3",
        "2/11.mp3",
        "2/12.mp3",
        "2/13.mp3"
    ]
	
	var titles = ["Deeper Blue",
	"Did He Mention My Name?",
	"You Already Moved Someone In",
	 "You Never Cared",
	 "Washed In The Blood",
	 "My Heart's Broken Too",
	  "Never Met A Man",
	  "My 2 Girls",
	  "You Don't Own Me",
	  "Fun Getting Over You",
	  "Boulder To Birmingham",
	  "Did You Think To Pray?",
    "Bonus Track - Honky Tonk Mama"
	]
	
	
	
	var titles_2 = [
        "It's Off",
        "Save Yourself",
        "Loved By You",
        "Can't Just Kiss You",
        "The Party",
       "Redneck With Too Much Money",
       "People Like Me",
       "Brand New Key",
       "Red Dress",
       "The Baptism of Jesse Taylor",
       "Jimmy, Don't Let Our Rose Die",
       "Don't Touch Me",
       "Everytime I Roll The Dice"
	]
	
	
	var music = _root.createEmptyMovieClip("music",_root.getNextHighestDepth())
var music_lines = new Array(songs.length);	
var music_lines_2 = new Array(titles_2.length);
	var demo_sound = new Sound(_root.sound_demo);

var alert = function(x) {
    ExternalInterface.call("alert",x);
}



var make_button = function(url, text, putx, puty, width, height, font, elem) {

     elem = elem || _root
     top_button_index++;
     font = font || 27
     var purchase = elem.createEmptyMovieClip("top_button_" + top_button_index,elem.getNextHighestDepth());
    //purchase.loadMovie("purchase.png");
    var purchase_matrix = new Matrix()
	purchase_matrix.createGradientBox(150, 35, Math.PI/2, 0, 0)
    var myRoundRectangle = new RoundRectangle(purchase,putx,puty,width,height);
     myRoundRectangle.setRegistrationPoint({x:0, y:0})
			myRoundRectangle.setCornerRadius(3);
			myRoundRectangle.gradientStyle("linear",[0xffffff,0x8698ad],[100,100],[0,0xFF], purchase_matrix);
			myRoundRectangle.draw();	
		 var purchase_txt = purchase.createTextField("purchase_txt",purchase.getNextHighestDepth(),6,4,width,height);
		var purchase_fmt = new TextFormat("eaves", font);
		purchase_fmt.color=0x000000;
		purchase_fmt.align = "left";
		purchase_txt.text = text;
		purchase_txt.setTextFormat(purchase_fmt);
		//only when you are using font with swfmill
		purchase_txt.embedFonts = true;
		purchase.useHandCursor = true;
			purchase.mouseChildren = false;
			purchase.onPress = function(){
                getURL(url)//firefox doesn't like blank //,"_blank");
            }
		purchase.filters = [ds_]		
		 var theglow = new GlowFilter();
		theglow.color = 0xffffff;
		theglow.blurX = 10;
		theglow.blurY = 10;
		theglow.alpha = .4;
		purchase.onRollOver = function(){
				this.filters = [theglow]
			};
			purchase.onRollOut = function(){
					this.filters = [ds_]				
			}
		return purchase;
}	

	
var go_music = function()
{
    
    var last_clicked_index = -1;
			
			//dont delete. this is temporary
			/*
			var music_pic = music.createEmptyMovieClip("music_pic",music.getNextHighestDepth())
			music_pic.loadMovie("images/62_.jpg");
            music_pic._Y = 190;
            */
		
		//I am useing _root.createEmpty.. because doing music was overwriting it.
		//who knows!
		//var music_pic_2 =  _root.createEmptyMovieClip("music_pic_2",_root.getNextHighestDepth())
		//music_pic_2.loadMovie("images/vollii-small.png");
		
		//music_pic_2._Y = 190;
		//music_pic_2._X = 1050;
		
		
		var music_pic_2 =  music.createEmptyMovieClip("music_pic_2",music.getNextHighestDepth())
		music_pic_2.loadMovie("images/vollii-small.png");
		
		var uk_small = music.createEmptyMovieClip("uk_small",music.getNextHighestDepth())
		uk_small.loadMovie("uk-small.png");
		uk_small._X = 137;
		uk_small._Y = 523; 
		
		var cd2_x = 170
		music_pic_2._Y = 205;
		music_pic_2._X = cd2_x;
		
		
		//Dont delete. this is temporary
		/*
		music.createEmptyMovieClip("grid", 999)
			music.grid.beginFill(0xFF0000, 0);
			music.grid.moveTo(0, 0 +190);
			music.grid.lineTo(190, 0 + 190);
			music.grid.lineTo(190, 196 + 190);
			music.grid.lineTo(0, 196 + 190);
			music.grid.endFill();
			
			music.grid.onPress = function()
			{
        getURL("http://cdbaby.com/cd/cindystandage");
			}
		*/
		
		
		//click area for second cd
		music.createEmptyMovieClip("go", 1000)
			music.go.beginFill(0xFF0000, 0);
			music.go.moveTo(cd2_x + 0, 0 +190);
			music.go.lineTo(cd2_x + 190, 0 + 190);
			music.go.lineTo(cd2_x + 190, 196 + 190);
			music.go.lineTo(cd2_x + 0, 196 + 190);
			music.go.endFill();
			
			music.go.onPress = function()
			{
                //getURL("http://cindystandage.ultraentertainment.com/estore/storeproducts.aspx");
                getURL("http://www.cdbaby.com/cd/CindyStandage1");
			}
		
		
		
		music._x = 725
		music._y = 0
		
		
	var music_fmt = new TextFormat("eaves",23); //change to eaves
      music_fmt.color=0xffffff;
      music_fmt.align = "left";
      
      var music_fmt_over = new TextFormat("eaves", 23);
      music_fmt_over.color=0x2244CC//0x2f4052;
      music_fmt_over.align = "left";	
      
       var ds_nav = new DropShadowFilter();
		ds_nav.blurX= 8;
		ds_nav.blurY= 8;
		ds_nav.distance = 3;
      
   
	
	//commenting out the first cd for now		
    //for (var i = 0; i < songs.length; i++)
    for (var i = 0; i < 0; i++)
    {
      music_lines[i] = music.createEmptyMovieClip("song_" + i, music.getNextHighestDepth());
      music_lines[i].createTextField("music_txt",music_lines[i].getNextHighestDepth(),0,i * 24 + 400,280,100);
      music_lines[i].music_txt.wordWrap = true
      music_lines[i].music_txt.text =  titles[i]
      //header_txt.autoSize = true;
      music_lines[i].music_txt.setTextFormat(music_fmt);
      music_lines[i].music_txt.embedFonts = true;  //uncomment this html try
      music_lines[i].filters = [ds_nav,ds_nav]
      music_lines[i].onRollOver = function(){
				this.music_txt.setTextFormat(music_fmt_over);
			};
			music_lines[i].onRollOut = function(){
          if (this.playing == false)
          {
            this.music_txt.setTextFormat(music_fmt);
           }
      }
      music_lines[i].myIndex = i;
      music_lines[i].playing = false;
      var demo_playing = "";
      music_lines[i].onPress = function()
      {
          //_root.alert.text = songs[this.myIndex]
          this.playing = !this.playing;
          if (this.playing == true)
          {
             for(var ii = 0; ii < music_lines.length; ii ++)
             {
                if (this != music_lines[ii])
                {
                  music_lines[ii].playing = false;
                   music_lines[ii].music_txt.setTextFormat(music_fmt);
                }
             }
             
             //make the other one not blue
             for(var ii = 0; ii < music_lines_2.length; ii ++)
             {
                  music_lines_2[ii].playing = false;
                   music_lines_2[ii].music_txt_2.setTextFormat(music_fmt);
             }
             
             demo_sound.loadSound("music/" + songs[this.myIndex],true);
            this.music_txt.setTextFormat(music_fmt_over);
          }
          else
          {
             demo_sound.stop();
            this.music_txt.setTextFormat(music_fmt);
          }
          demo_sound.setVolume(100);
          last_clicked_index = this.myIndex;	   
      }
    }
    
    for (var i = 0; i < songs_2.length; i++)
    {
      music_lines_2[i] = music.createEmptyMovieClip("song_2_" + i, music.getNextHighestDepth());
      music_lines_2[i].createTextField("music_txt_2",music_lines_2[i].getNextHighestDepth(),cd2_x,i * 24 + 400,280,100);
      music_lines_2[i].music_txt_2.wordWrap = true
      music_lines_2[i].music_txt_2.text =  titles_2[i]
      //header_txt.autoSize = true;
      music_lines_2[i].music_txt_2.setTextFormat(music_fmt);
      music_lines_2[i].music_txt_2.embedFonts = true;  //uncomment this html try
      music_lines_2[i].filters = [ds_nav,ds_nav]
      music_lines_2[i].onRollOver = function(){
				this.music_txt_2.setTextFormat(music_fmt_over);
			};
			music_lines_2[i].onRollOut = function(){
          if (this.playing == false)
          {
            this.music_txt_2.setTextFormat(music_fmt);
           }
      }
      music_lines_2[i].myIndex = i;
      music_lines_2[i].playing = false;
      var demo_playing = "";
      music_lines_2[i].onPress = function()
      {
          //_root.alert.text = songs[this.myIndex]
          this.playing = !this.playing;
          if (this.playing == true)
          {
             for(var ii = 0; ii < music_lines_2.length; ii ++)
             {
                if (this != music_lines_2[ii])
                {
                  music_lines_2[ii].playing = false;
                   music_lines_2[ii].music_txt_2.setTextFormat(music_fmt);
                }
             }
             
             //make the other one not blue
             for(var ii = 0; ii < music_lines.length; ii ++)
             {
                  music_lines[ii].playing = false;
                   music_lines[ii].music_txt.setTextFormat(music_fmt);
             }
             demo_sound.loadSound("music/" + songs_2[this.myIndex],true);
            this.music_txt_2.setTextFormat(music_fmt_over);
          }
          else
          {
             demo_sound.stop();
            this.music_txt_2.setTextFormat(music_fmt);
          }
          demo_sound.setVolume(100);
          last_clicked_index = this.myIndex;	   
      }
    }
    
    //var purchase = make_button("http://cindystandage.ultraentertainment.com/estore/storeproducts.aspx?categoryid=3", "Purchase CD or individual songs", cd2_x, 725, 245, 35 , 24, music);		
   var purchase = make_button("http://www.cdbaby.com/cd/CindyStandage1", "Purchase CD or individual songs", cd2_x, 725, 245, 35 , 24, music);		

}
	
	
	
	
	
	
	
	
	
//CONTACT
	var contact = _root.createEmptyMovieClip("contact",_root.getNextHighestDepth())	
	contact._x = 50;
	contact._y = 230;
	var go_contact = function()
	{
      //contact.loadMovie("contact.swf");
      
      
      		
		var contact_box = contact.createEmptyMovieClip("contact_box",contact.getNextHighestDepth())	
		contact_box.loadMovie("box.swf");
		contact_box._x = 5;
		contact_box._y = -12;
      
     var contact2 = contact.createEmptyMovieClip("contact2",contact.getNextHighestDepth())	
      var contact_txt = contact2.createTextField("contact2",contact_box.getNextHighestDepth(),20,0,450,520);
		contact_txt.html = true;

		
		var contact_fmt = new TextFormat("eaves",30);
		contact_fmt.color=0xffffff;
		contact_fmt.align = "left";
		
		
		contact_txt.wordWrap = true
		
		contact_txt.htmlText = "Email: cindy@cindystandage.com\n\nContact: Ed Standage\n480.215.7248\n\nP.O. BOX 20462\nMesa, AZ 85277";
		//header_txt.autoSize = true;
			
		contact_txt.setTextFormat(contact_fmt);
	

		//only when you are using font with swfmill
		contact_txt.embedFonts = true;
		contact2.filters = [ds_,ds_,ds_]

		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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
		var navtext = ["Home","About","Music","Photos","Tours","Press","Contact"];
		var nav_tf = new Array(menu_len);
		
		var nav_fmt = new TextFormat("eaves", 35);
		nav_fmt.color=0xffffff//0x78292C;
		nav_fmt.align = "center";
		
		var nav_fmt_over = new TextFormat("eaves", 35);
		nav_fmt_over.color=0x78292C//0x2f4052;
		nav_fmt_over.align = "center";


		var nav_width = 90
		var nav_height = 50
		
		var ds_nav = new DropShadowFilter();
		ds_nav.blurX= 8;
		ds_nav.blurY= 8;
		ds_nav.distance = 1;
		//ds_nav.color = 0xFFFFFF;
		
		
		
		

        
        
        
		var navpress = function(){
		
        
				//this.navtext.text = this.navtext.text.toLowerCase();
				//bg_fade = true;
				//bg_fade_length = 14;
				
				bg_fade_to = bground_path + this.navtext.text.toLowerCase() + ".jpg"
				
				
				
				//previous page
				if (page == "photos")
				{
            photos.unloadMovie(photos);
				}
				if (page == "about" && this.navtext.text.toLowerCase() != "about")
				{
            about.unloadMovie(about);
				}
        if (page == "tours" && this.navtext.text.toLowerCase() != "tours")
				{
            tours.unloadMovie(tours);
				}
				if (page == "press" && this.navtext.text.toLowerCase() != "press")
				{
            press.unloadMovie(press);
				}
				if (page == "contact" && this.navtext.text.toLowerCase() != "contact")
				{
            contact.unloadMovie(contact);
				}
				
				if (page == "music" && this.navtext.text.toLowerCase() != "music")
				{
				
          var myVolume:Volume = new Volume(videoSound);
            myVolume.animationStyle(1000,Quad.easeIn);
            myVolume.run(100);
            
            
            
              //videoSound.setVolume(100);
            the_ns.seek(the_ns.time);
            music.unloadMovie(music);
            
             demo_sound.stop();
				}
				
				prevpage = page;
				page = this.navtext.text.toLowerCase();
				
				
				
				
				for (var ii = 0; ii < menu_len; ii++)
				{
          if (nav[ii].navtext.text.toLowerCase() != page)
          {
          nav[ii].navtext.setTextFormat(nav_fmt);
          }
				}
				
				
				//bg_fade_count = 0;

					var myAlpha:Alpha = new Alpha(bground,0,500,Linear.easeInOut,"fadedOut");
					myAlpha.run()
				
				var myMove:Move = new Move(nav_wrapper,navplace[page][0], navplace[page][1], 1000, Quad.easeInOut, "");
				myMove.run();
				
				var myMove2:Move = new Move(header_mc,headerplace[page][0], headerplace[page][1], 1500, Quad.easeInOut, "");
				myMove2.run();
				
				
				
				var myMove3:Move = new Move(blogger,bloggerplace[page][0], bloggerplace[page][1], 500, Quad.easeInOut, "");
				myMove3.run();
				var myMove4:Move = new Move(myspace,myspaceplace[page][0], myspaceplace[page][1], 500, Quad.easeInOut, "");
				myMove4.run();
				var myMove5:Move = new Move(fisher,fisherplace[page][0], fisherplace[page][1], 500, Quad.easeInOut, "");
				myMove5.run();
				
							
        /*
        var myMove3:Move = new Move(mailinglist,mailingplace[page][0], mailingplace[page][1], 1000, Quad.easeInOut, "");
				myMove2.run();
				*/
			

        
			  if (page == "home")
        {
          
          if (prevpage != "home"){
            //getURL("#home");
            //getURL("home_.php","iframey");
            //ExternalInterface.call("changeFrame","home_.php");
            
         }
        }
			
        if (page == "photos")
        {
          
          if (prevpage != "photo")
          { 
            go_photo();
            //getURL("#photos");
            //getURL("photos_.php","iframey");
            //ExternalInterface.call("changeFrame","photos_.php");
         }
        }
        
        if (page == "about")
        {
         
          about_index = 0//so.data.about_index || 0;
         if (prevpage != "about"){ 
         go_about();
         //getURL("#about");
         //getURL("about_.php","iframey");
        // ExternalInterface.call("changeFrame","about_.php");
         }
        }
        
        if (page == "tours")
        {
         
          tours_index = 0//so.data.tours_index || 0;
          if (prevpage != "tours"){ 
          go_tours();
          //getURL("#tours");
          //getURL("home_.php","iframey");
          
          }
        }
        
        if (page == "press")
        {
         
          press_index = 0//so.data.press_index || 0;
          if (prevpage != "press"){ 
          go_press();
          //getURL("#press");
          //getURL("press_.php","iframey");
          
          }
        }
        
        if (page == "contact")
        {
         
          if (prevpage != "contact"){ 
          go_contact();
          //getURL("#contact");
          //getURL("contact_.php","iframey");
          
          }
          
        }
        
        if (page == "music")
        {
        
         var myVolume:Volume = new Volume(videoSound);
            myVolume.animationStyle(1000,Quad.easeIn);
            myVolume.run(0);
         
         
         
          if (prevpage != "music"){ 
          go_music();
          //getURL("#music");
          //getURL("music_.php","iframey");
          }
        }
				
				
				
				//write a "flash cookie for what page you are on"
				so.data.page = page;
				
				
				
				this.navtext.setTextFormat(nav_fmt_over)
				
			
				
			}//endnavpress
		
		
		for (var i = 0; i < bground_mcs.length; i++)
		{
			nav[i] = nav_wrapper.createEmptyMovieClip("nav_" + i, nav_wrapper.getNextHighestDepth());
			nav[i]._x = i * nav_width;
			nav[i]._y = 0;
			nav[i].tabEnabled = false;
			
				
				//nav shadow
				nav[i].filters = [ds_nav];
			
						
			nav_tf[i] = nav[i].createTextField("navtext",nav[i].getNextHighestDepth(),0,0,nav_width,nav_height);			
			nav_tf[i].text = navtext[i];
			
			 		
			nav_tf[i].setTextFormat(nav_fmt);
			//nav_tf[i].setTextFormat(nav_fmt_over);
			
			//only when you are using font with swfmill
			nav_tf[i].embedFonts = true;
			
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
			
			 ////////////////////////////////////////////;//old end nav onpress
			

				
			nav[i].onPress = function(){
        //navpress.apply(this)
        //ExternalInterface.call("changeFrame",this.navtext.text.toLowerCase() + "_.php");
        //old way     
        
        //getURL('#' + this.navtext.text.toLowerCase());
        ExternalInterface.call("named_anchor",this.navtext.text.toLowerCase());
			};
			
					
			
			
			
			
		/*
				        ExternalInterface.addCallback("home_",null,function(){go_home()});  
        ExternalInterface.addCallback("go_music",null,function(){go_music()});
        ExternalInterface.addCallback("go_photos",null,function(){go_photo()});
        ExternalInterface.addCallback("go_press",null,function(){go_press()});
        ExternalInterface.addCallback("go_about",null,function(){go_about()});
        ExternalInterface.addCallback("go_tours",null,function(){go_tours()});
        ExternalInterface.addCallback("go_contact",null,function(){go_contact()});
			*/
      
			
			nav[i].onRollOver = function(){
				this.navtext.setTextFormat(nav_fmt_over);
			};
			nav[i].onRollOut = function(){
				if (page != this.navtext.text.toLowerCase())
				{
            this.navtext.setTextFormat(nav_fmt);
				}
				
				
			};
		}
		
		
	
    
		
	var song_playing;
	
	ExternalInterface.addCallback("click_this",null,function(the_page){
	
	
          var saf = ExternalInterface.call("is_saf")
          if (saf == true)
          {
            ExternalInterface.call("titlee","Cindy Standage :: Back")
          }
          
          
          
          song_playing = ExternalInterface.call("is_song_playing")
          if (song_playing != true)
          {
              bg_music_index = get_saved_music_index() || 0;
              
               bg_music_index++
              
                if(bg_music_index == bg_music.length)
                {
                  bg_music_index = 0; //hmmo test
                }
                
                  if (the_page == "myModuleDefaultState")
                  {
                    bg_music_index = 0;
                    
                  }
               
                save_music_index();
                                 
                the_ns.play(bg_music[bg_music_index]) ;
                
                ExternalInterface.call("song_is_playing");
          }
          
           if (the_page == "myModuleDefaultState")
           {
               the_page = "home"; //test--
           }
          
          
         
          
          
          for (var i = 0; i < nav.length; i++)
          {
            if (navtext[i].toLowerCase() == the_page)
            {
              navpress.apply(nav[i])
              //videoSound.setVolume(100); //hmmm
            }
          }
          })
          
          
          
          
          
          /*
          
         ExternalInterface.addCallback("browserURLChange",null,function(the_page){
          			ExternalInterface.call("titlee","the page is " + the_page)
          for (var i = 0; i < nav.length; i++)
          {
            if (navtext[i].toLowerCase() == the_page)
            {
              navpress.apply(nav[i])
              videoSound.setVolume(100); //hmmm
            }
          }
          
          })
          */
          
          
          
          
          
          
          
		
		
		
		//flash cookie
	
  
		var clickedpage = so.data.page || "home";
		
		//only remember tours and press
    
    if (_level0.r != 1)
    {
      clickedpage = "home";
    }
       
    
    /*if (clickedpage != "press")
    {
      clickedpage = "home"
    }*/
        
		
		for (var i = 0; i < nav.length; i++)
		{
      put = nav[i].navtext.text.toLowerCase() + " = " + clickedpage
      if (nav[i].navtext.text.toLowerCase() == clickedpage)
      {
         //bground.loadMovie(bground_path + clickedpage + ".jpg");
         bg_fade_to =  bground_path + clickedpage + ".jpg"
         myListener.fadedOut();
         
        navpress.apply(nav[i]) //using apply to simualte a click becuase of the "this" //i think 'this' should be fixed!
        break;
      }
      
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
//var tween:Tween = new Tween(nav_wrapper, "_rotation", Quad.easeOut, 0, 360, 3, true);
//var tween = new Tween(nav_wrapper, "_rotation", Quad.easeOut, 0, 100, 1, true);		
	/*
var myMove:Move = new Move(nav_wrapper);
			myMove.animationStyle(2000,Circ.easeOut,"onCallback");
			myMove.run(650,nav_wrapper._y);
*/
		









/*                       _                    
                      | |                   
  _ __  _   _ _ __ ___| |__   __ _ ___  ___ 
 | '_ \| | | | '__/ __| '_ \ / _` / __|/ _ \
 | |_) | |_| | | | (__| | | | (_| \__ \  __/
 | .__/ \__,_|_|  \___|_| |_|\__,_|___/\___|
 | |                                        
 |_|                                        

*/
//purchase

var purchase = _root.createEmptyMovieClip("purchase",_root.getNextHighestDepth());
    //purchase.loadMovie("purchase.png");


var purchase_matrix = new Matrix()
	purchase_matrix.createGradientBox(150, 35, Math.PI/2, 0, 0)

		

var myRoundRectangle:RoundRectangle = new RoundRectangle(purchase,-10000,10,150,35);
     
     myRoundRectangle.setRegistrationPoint({x:0, y:0})
			myRoundRectangle.setCornerRadius(3);
			//myRoundRectangle.lineStyle(0,0xff0000,100);
			//myRoundRectangle.fillStyle(0xffffff,100);
			myRoundRectangle.gradientStyle("linear",[0xffffff,0x8698ad],[100,100],[0,0xFF], purchase_matrix);
			
			myRoundRectangle.draw();	
		
	
		var purchase_txt = purchase.createTextField("purchase_txt",purchase.getNextHighestDepth(),6,4,150,35);
		
		var purchase_fmt = new TextFormat("eaves", 27);
		purchase_fmt.color=0x000000;
		purchase_fmt.align = "left";
		
		purchase_txt.text = "Purchase Music";
		//header_txt.autoSize = true;
			
		purchase_txt.setTextFormat(purchase_fmt);
	
		
		//only when you are using font with swfmill
		purchase_txt.embedFonts = true;
		
		
		
		
		purchase.useHandCursor = true;
			
			purchase.mouseChildren = false;
			

			
			purchase.onPress = function(){
          getURL("http://cdbaby.com/cd/cindystandage")//firefox doesn't like blank //,"_blank");
          //getURL(_level0.purchase,"_blank");
          //getURL("javascript:window.open('http://cdbaby.com/cd/cindystandage','cool');void(0);");
				}
		
		

	/*
		var newBlurFilter0:BlurFilter = new BlurFilter();
			newBlurFilter0.blurX = 1;
			
			purchase.filters = [newBlurFilter0];
							
		var newBlurFilter:BlurFilter = new BlurFilter();
			newBlurFilter.blurX = 30;
			
		var myInstance:Blur = new Blur(purchase, newBlurFilter, 1000, Linear.easeOut, "none");

		
		var pAlpha:Alpha = new Alpha(purchase,100,2000,Linear.easeInOut,"fadedIn");
			pAlpha.run()
		*/
		
		
		
		purchase.filters = [ds_]		
		
		var theglow = new GlowFilter();
		theglow.color = 0xffffff;
		theglow.blurX = 10;
		theglow.blurY = 10;
		theglow.alpha = .4;
		
		purchase.onRollOver = function(){
				this.filters = [theglow]
			};
			purchase.onRollOut = function(){
					this.filters = [ds_]				
			}
		
		/*
		var ds = new DropShadowFilter();
		ds.blurX= 5;
		ds.blurY= 5;
		header_mc.filters = [ds];

		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
/*                                        
 _______            ____        _   _                  
|__   __|          |  _ \      | | | |                 
   | | ___  _ __   | |_) |_   _| |_| |_ ___  _ __  ___ 
   | |/ _ \| '_ \  |  _ <| | | | __| __/ _ \| '_ \/ __|
   | | (_) | |_) | | |_) | |_| | |_| || (_) | | | \__ \
   |_|\___/| .__/  |____/ \__,_|\__|\__\___/|_| |_|___/
           | |                                         
           |_|                           

*/
//top button

	
		
				
//make_button("http://cindystandage.ultraentertainment.com/estore/storeproducts.aspx", "      Get Cindy's New CD", 10, 10, 245, 35);	    	
make_button("#nav=music", "      Get Cindy's New CD", 10, 10, 245, 35);	    	
//var cal = make_top_button("http://cindystandage.ultraentertainment.com/estore/storeproducts.aspx?categoryid=3", ".                    If Coach \"Cal\" sent you,\n                                   click here.", 10, 65, 245, 45 , 20);		
var cal = make_button("#nav=music", ".                    If Coach \"Cal\" sent you,\n                                   click here.", 10, 65, 245, 45 , 20);		
var uk = cal.createEmptyMovieClip("uk", cal.getNextHighestDepth())
uk.loadMovie("uk-35.png");
uk._X = 5;
uk._Y = 6;
		
		
	
		
		/*
                  _ _ _               _ _     _   
                 (_) (_)             | (_)   | |  
  _ __ ___   __ _ _| |_ _ __   __ _  | |_ ___| |_ 
 | '_ ` _ \ / _` | | | | '_ \ / _` | | | / __| __|
 | | | | | | (_| | | | | | | | (_| | | | \__ \ |_ 
 |_| |_| |_|\__,_|_|_|_|_| |_|\__, | |_|_|___/\__|
                               __/ |              
                              |___/               

*/

/*

var mailinglist = _root.createEmptyMovieClip("mailinglist",_root.getNextHighestDepth());
mailinglist.loadMovie("emailform.swf");
mailinglist._x = 859;
mailinglist._y = 0;
*/




//mailinglist

var mailinglist = _root.createEmptyMovieClip("mailinglist",_root.getNextHighestDepth());
    //mailinglist.loadMovie("mailinglist.png");


var mailinglist_matrix = new Matrix()
	mailinglist_matrix.createGradientBox(150, 35, Math.PI/2, 0, 0)

		

var myround_mail_Rectangle:RoundRectangle = new RoundRectangle(mailinglist,1090,10,150,35);
     
     myround_mail_Rectangle.setRegistrationPoint({x:0, y:0})
			myround_mail_Rectangle.setCornerRadius(3);
			//myround_mail_Rectangle.lineStyle(0,0xff0000,100);
			//myround_mail_Rectangle.fillStyle(0xffffff,100);
			myround_mail_Rectangle.gradientStyle("linear",[0xffffff,0x8698ad],[100,100],[0,0xFF], mailinglist_matrix);
			
			myround_mail_Rectangle.draw();	
		
	
		var mailinglist_txt = mailinglist.createTextField("mailinglist_txt",mailinglist.getNextHighestDepth(),6,4,150,35);
		
		var mailinglist_fmt = new TextFormat("eaves", 27);
		mailinglist_fmt.color=0x000000;
		mailinglist_fmt.align = "left";
		
		mailinglist_txt.text = "Join Mailing List";
		//header_txt.autoSize = true;
			
		mailinglist_txt.setTextFormat(mailinglist_fmt);
	
		
		//only when you are using font with swfmill
		mailinglist_txt.embedFonts = true;
		
		
		
		
		mailinglist.useHandCursor = true;
			
			mailinglist.mouseChildren = false;
			

			//a good function to simulate and event
			/*
			mailinglist.onPress = function(){
          navpress.apply(nav[6])
				}
		*/
		
		
		var mailingslide = _root.createEmptyMovieClip("mailingslide",_root.getNextHighestDepth());
      mailingslide.open = false
      mailingslide._y = -140;
      mailingslide._x = 900;
      mailingslide.loadMovie("join.swf");
      mailingslide.filters = [ds_,ds_]
      
      mailingslide.thename.onSetFocus = function()
      {
        if (this.text == "Thank you!")
         {
            this.text = "";
         }
      }
      
      
		var joinpress = function(){
		
        mailingslide.open = !mailingslide.open;
        
        
          if (mailingslide.open == true)
          {
            var mailingMove:Move = new Move(mailingslide,mailingslide._x, 50, 500, Quad.easeInOut, "");
            mailingMove.run();
          }
          if (mailingslide.open == false)
          {
              _root.sendMailing2();
            var mailingMove2:Move = new Move(mailingslide,mailingslide._x, -140, 500, Quad.easeInOut, "");
            mailingMove2.run();
          }
		
			}
			
			
			//the join.swf should call the justSlide function when it is done.
			_root.justSlide = function()
			{
        mailingslide.open = false
        var mailingMove2:Move = new Move(mailingslide,mailingslide._x, -140, 500, Quad.easeInOut, "");
            mailingMove2.run();
			}
			
			
			mailinglist.onPress = function(){joinpress.apply(mailinglist);}
			_root.joinpress = joinpress;
			


		
		
		
		mailinglist.filters = [ds_]		
		
		
		mailinglist.onRollOver = function(){
				this.filters = [theglow]
			};
			mailinglist.onRollOut = function(){
					this.filters = [ds_]				
			}
		























		


















/*

		var mailinglist = _root.createEmptyMovieClip("mailinglist",_root.getNextHighestDepth());
    //purchase.loadMovie("purchase.png");



mailinglist._x = 600;
mailinglist._y = 20;

var mailing_matrix = new Matrix()
mailing_matrix.createGradientBox(150, 35, Math.PI/2, 0, 0)

		

var myRoundRectangle2:RoundRectangle = new RoundRectangle(mailinglist,1100,10,150,20);
     
     myRoundRectangle2.setRegistrationPoint({x:0, y:0})
			myRoundRectangle2.setCornerRadius(3);
			//myRoundRectangle2.lineStyle(0,0xff0000,100);
			//myRoundRectangle2.fillStyle(0xffffff,100);
			myRoundRectangle2.gradientStyle("linear",[0xffffff,0xffffff],[100,100],[0,0xFF], mailing_matrix);
			
			myRoundRectangle2.draw();	
		
	
		var mailing_txt = mailinglist.createTextField("mailing_txt",mailinglist.getNextHighestDepth(),-190,-4,180,35);
		
		var mailing_fmt = new TextFormat("eaves", 27);
		mailing_fmt.color=0xffffff;
		mailing_fmt.align = "left";
		
		mailing_txt.text = "Join our Mailing List";
		//header_txt.autoSize = true;
			
		mailing_txt.setTextFormat(mailing_fmt);
	
		
		//only when you are using font with swfmill
		mailing_txt.embedFonts = true;
		
		
		
		
		mailinglist.useHandCursor = true;
			
			mailinglist.mouseChildren = false;
		
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
/*
  _     _                             
 | |   | |                            
 | |__ | | ___   __ _  __ _  ___ _ __ 
 | '_ \| |/ _ \ / _` |/ _` |/ _ \ '__|
 | |_) | | (_) | (_| | (_| |  __/ |   
 |_.__/|_|\___/ \__, |\__, |\___|_|   
                 __/ | __/ |          
                |___/ |___/           


*/
		var images = ["blogger.png","myspace.jpg","fisher_house.jpg"]
		var bitmaps = new Array(images.length);
		var images_index = 0;




		

var bottom_links = function(){

  blogger.attachBitmap(bitmaps[0],1)
  blogger.onPress = function(){
    getURL("http://cindybackstage.blogspot.com")
  }
  blogger.filters = [ds_]
  
  

  myspace.attachBitmap(bitmaps[1],1)
  myspace.onPress = function(){
    getURL("http://myspace.com/cindystandage")
  }
  myspace.filters = [ds_]



  fisher.attachBitmap(bitmaps[2],1)
  fisher.onPress = function(){
    getURL("http://www.armyfisherhouses.org")
  }
  fisher.filters = [ds_]
}




	var image_loader = _root.createEmptyMovieClip("image_loader",_root.getNextHighestDepth());
	//image_loader.loadMovie("blogger.png");
	
	image_loader._alpha = 0;
	
	var my_mcl2:MovieClipLoader = new MovieClipLoader();
		// Create listener object:
		var mclListener2:Object = new Object();
				
		mclListener2.onLoadInit = function(target_mc:MovieClip, status:Number):Void {
			 						
				bitmaps[images_index] = new BitmapData(image_loader._width, image_loader._height, true, 0x00ffff);
				bitmaps[images_index].draw(image_loader);
				
				images_index++;
				if (images_index < images.length)
				{
          my_mcl2.loadClip(images[images_index], image_loader);

				}
          else
				{
          bottom_links()
				}
				//blogger_bd.draw(blogger);
				//_root.unoadMovie(blogger);
				//blogger.attachBitmap(blogger_bd, 1);	
				
				
		};
		
		my_mcl2.addListener(mclListener2);
		//uncomment this to load the clip
		my_mcl2.loadClip(images[0], image_loader);

			

		
		

		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
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
			
			var myAlpha:Alpha = new Alpha(bground,100,1000,Linear.easeInOut,"fadedIn");
			myAlpha.run()
			
			
			
			gradient_fade.clear();
			if (page == "about" || page == "tours")
				{
					fadesome();
				}

				
		}
		
		
		myListener.fadedIn = function()
		{
			//_root.alert.text = page;
				
				//double check!

		}
		
		myListener.soundFadedOut = function()
		{
      the_ns.pause(true);
      videoSound.setVolume(100);
      
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
		//original fade in
		bground._alpha = 0;
		var my_initial_Alpha:Alpha = new Alpha(bground,100,2000,Linear.easeInOut);
			my_initial_Alpha.run()
		*/ //not doing that anymore becuase it is done with simulated nav click
		
		
		
		
		
		/*
		     _           _     _              _   _                
     /\   | |         | |   | |            | | | |               
    /  \  | | ___ _ __| |_  | |_  _____  __| |_| |__   ___ __  __
   / /\ \ | |/ _ \ '__| __| | __|/ _ \ \/ /| __| '_ \ / _ \\ \/ /
  / ____ \| |  __/ |  | |_  | |_|  __/>  < | |_| |_) | (_) |>  < 
 /_/    \_\_|\___|_|   \__|  \__|\___/_/\_\ \__|_.__/ \___//_/\_\
                                                                 
          */                                                       


		
		//Alert text box!
		_root.createTextField("alert",_root.getNextHighestDepth(),0,400,0,0);
		_root.alert.textColor = 0xffffff;		
		//_root.alert.text = "go ninja go"
		
    //_root.alert.alpha = 0;
		
		
		
		
		
		
		
		
		
		
		
		//this bg-fade stuff is old code!
		
		
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
		
		
		
	//	var test = music.createEmptyMovieClip("test",_root.getNextHighestDepth())
		
	//	test.loadMovie("testform.swf");
		
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
		
		//ExternalInterface.call("initSave");
		ExternalInterface.call("loaded");
		 
		   var sound = new Sound()
  // sound.loadSound("music/1.mp3",true);
  
		 

    var thens = ns;
    var count_pound = 0;
    
    
    var naver = {};
    naver.home = 0;
    naver.about = 1;
    naver.music = 2;
    naver.photos = 3;
    naver.tours = 4;
    naver.press = 5;
    naver.contact = 6;
    
    
    
		_root.onEnterFrame = function()
		{
		
      /*if (_root.scaleMode != "scale")
      {
        _root.scaleMode = "scale";
      }*/
      
      
      if (Stage.scaleMode != "scale")
      {
        Stage.scaleMode = "scale";
      }
      
      
      
      
      count_pound++
      if (count_pound == 5)
      {
        count_pound = 0;
        //ExternalInterface.call("titlee","the music index is " + bg_music_index);
        
        //var pound = ExternalInterface.call("get_pound");

        /*
        var loc = ExternalInterface.call("window.location.toString");
        var p = loc.indexOf("#");
        
        if (p != -1)
        {
        pound = loc.substr(p + 1);
        }
        else
        {
          pound = "no page"
        }
        */
        
        
        
        
        //ExternalInterface.call("titlee","the page is " + pound);
        
        /*
        if (page != pound && pound != "no page")
        {
          navpress.apply(nav[naver[pound]]);
        }
        */
        
      }
      
       ExternalInterface.call("flash_loaded");    
      
      
      
      //_root.alert.text = sound.getBytesLoaded();
		
		
			//checkfade(ticks);
			//ticks++;
			
			
			
       //_root.alert.text = thens.bufferLength + "\n" + _status + "\n" + clickedpage + "\n" + put + "\n" + videoSound.getVolume();
       //if (thens.bufferLenght < 10)
      // {
          
       //}
		
       // ExternalInterface.call("titlee",the_ns.currentFps +  " " + bg_music_index);
        //ExternalInterface.call("titlee",the_ns.bytesLoaded + "/" + the_ns.bytesTotal)
		}
	
	}
	
	
    //// entry point
    static function main(mc) 
    {
		app = new CindyStandage();
    }

}