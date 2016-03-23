package Views
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class WheelItem extends Sprite
	{
		public static const availableTypes:Vector.<uint> = new Vector.<uint>();
		availableTypes.push(1);
		availableTypes.push(2);
		availableTypes.push(3);
		availableTypes.push(4);
		availableTypes.push(5);
		
		public static const itemSize:Rectangle = new Rectangle(0,0,50,50)
		private static const freeItems:Vector.<Vector.<WheelItem>> = new Vector.<Vector.<WheelItem>>();
		
		/**
		 * factory + object pool
		 */
		public static function getItem(type:int):WheelItem
		{
			if (freeItems.length < availableTypes.length)
			{
				while(freeItems.length < availableTypes.length)
				{
					freeItems.push(new Vector.<WheelItem>());
				}
			}
			
			if(freeItems[type - 1].length > 0)
			{
				return freeItems[type - 1].pop()
			}
			else
			{
				//to lazy to make it with reald graphcs
				var sprite:WheelItem = new WheelItem();
				sprite.type = type;
				
				switch(type)
				{
					case 1:
					{
						sprite.graphics.beginFill(0xd5aa30);
						sprite.graphics.drawCircle(25,25,25)
						break;
					}
					case 2:
					{
						sprite.graphics.beginFill(0xd5917e);
						sprite.graphics.drawRect(0,0,50,50);
						break;
					}
					case 3:
					{
						sprite.graphics.beginFill(0xd56db7);
						sprite.graphics.drawRoundRect(0,0,50,50,30,30);
						break;
					}
					case 4:
					{
						sprite.graphics.beginFill(0x6a31f1);
						sprite.graphics.moveTo(25,3);
						sprite.graphics.lineTo(50, 46);
						sprite.graphics.lineTo(0,46);
						break;
					}
					case 5:
					{
						sprite.graphics.beginFill(0x6a31f1);
						//43
						sprite.graphics.moveTo(0,3)
						sprite.graphics.lineTo(50,3);
						sprite.graphics.lineTo(25, 46);
						break;
					}
						
					default:
					{
						break;
					}
				}
				
				sprite.graphics.endFill();
				
				return sprite 
			}
		}
		
		public static function returnItem(item:WheelItem):void
		{
			freeItems[item.type - 1].push(item);
		}
		
		public var type:int = 0;
		public function WheelItem()
		{
			super();
		}
	}
}