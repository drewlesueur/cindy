class com.coolstufflist.OtherLoader
{
	public function loadPic(movieclip,theurl,thefunc)
	{
		var my_mcl:MovieClipLoader = new MovieClipLoader();
		var mclListener:Object = new Object();
		mclListener.onLoadInit = function(target_mc:MovieClip, status:Number):Void 
		{
			thefunc();
		};
		my_mcl.addListener(mclListener);
		
		my_mcl.loadClip(theurl, movieclip);
	}
}