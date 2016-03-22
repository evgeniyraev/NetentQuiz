package wheels
{
	/**
	* VO stands for Value Object
	* 
	* the only thing that this object have to do is to holds data 
	**/
	public class WheelVO implements IWheelItem
	{
		private var _id:int;
		private var _name:String;
		
		public function WheelVO(id:int, name:String)
		{
			_id = id;
			_name = name;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
	}
}