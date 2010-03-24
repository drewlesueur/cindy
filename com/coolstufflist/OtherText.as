class com.coolstufflist.OtherText
{
	public var tf;
	public var t;
	public static var a;
	public function OtherText(clip,text,x,y,w,h,font,size)
	{
		this.make(clip,text,x,y,w,h,font,size);
	}
	
	public function make(clip,text,x,y,w,h,font,size)
	{
		//this.tf.color = 0x00dd00
		this.t = clip.createTextField("text_" + clip.getNextHighestDepth(), clip.getNextHighestDepth(),x,y,w,h);
		this.t.text = text
		
		this.tf = new TextFormat(font,size);
		
		this.t.setTextFormat(this.tf);
		
	}
	
	public function text(what)
	{
		this.t.text = what;
		this.t.setTextFormat(this.tf)
	
	}
	
	



}