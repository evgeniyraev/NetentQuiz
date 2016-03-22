package wheels
{
	public interface IWheelView
	{
		function get wheel():IWheel;
		
		function spin(fromIndex:uint, toIndex:uint, numberOfSpins:uint):void
	}
}