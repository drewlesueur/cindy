class com.coolstufflist.OtherClip
{
	
	public function OtherText(clip)
	{
		return clip.createEmptyMovieClip("clip_" + clip.getNextHighestDepth(),clip.getNextHighestDepth())		
	}
	
	

}