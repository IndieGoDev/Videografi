package com.IndieGo.soal {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.IndieGo.utils.Transforms;

	public class stats extends MovieClip {

		private var Trans:Transforms;
		public var TX:Object;
		public var TR:Object;

		public function stats(): void {

			stop();

			Trans = new Transforms( stage );
			Trans.place( this, ( stage.stageWidth + width ), y, true );
			Trans.rotate( this, -1/8 );
			
		}

		public function toLeft(): void {
			
			Trans.animPlace( this, -width, y, true, 1 );
			Trans.animRotate( this, -1/8, 1 );
			
		}

		public function toRight(): void {
			
			Trans.animPlace( this, ( stage.stageWidth + width ), y, true, 1 );
			Trans.animRotate( this, 1/8, 1 );
			
		}

		public function toShow(): void {
			
			Trans.animPlace( this, ( stage.stageWidth / 2 ), y, true, 1 );
			Trans.animRotate( this, 0, 0, 4 );

		}

		public function changeScore(): void {

		}

		public function changeList(): void {


		}

	}

}