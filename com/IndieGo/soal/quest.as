package com.IndieGo.soal {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.IndieGo.utils.Transforms;
	import com.IndieGo.utils.Array_Shuffle;

	public class quest extends MovieClip {

		private var Q:Object;
		private var mcCtn:Object;
		private var mcMsk:Object;
		private var mcDsk:Object;
		private var mcHdr:Object;
		private var mcHdl:Object;
		private var mcStt:Object;
		private var mcTop:Object;
		private var btStr:Object;
		private var mcNme:Object;
		private var isOpen:Boolean;
		private var Trans:Transforms;
		public var isProcess:Boolean;
		public var TX:Object;

		public function quest() {

			stop();

			mcCtn = content.ctn;
			mcMsk = content.msk;
			mcHdl = handler;
			mcHdr = header;
			mcNme = nama;
			mcDsk = desk;
			btStr = bStart;
			isOpen = false;
			isProcess = false;

			Trans = new Transforms( stage );
			Trans.place( this, ( stage.stageWidth + width ), y, true );
			Trans.place( mcCtn, mcCtn.x, -mcCtn.height, true );
			Trans.place( mcHdl, mcHdl.x, 0, true );
			Trans.scale( mcMsk, mcMsk.scaleX, 0 );
			Trans.alpha( mcHdr, 0 );

		}

		public function init( q:Object, stats:Object, topList:Object ): void {

			Q = q;
			mcStt = stats;
			mcTop = topList;
				
			mcDsk.change(Q.TT, Q.QT);

			btStr.addEventListener( MouseEvent.CLICK, function( e:MouseEvent ) {
				
				if ( !!mcNme.text() ) start();

			});
			
		}

		public function toLeft(): void {
			
			Trans.animPlace( this, -width, y, true, 1 );
			Trans.animRotate( mcHdr, -1/8, 1 );
			
		}

		public function toRight(): void {
			
			Trans.animPlace( this, ( stage.stageWidth + width ), y, true, 1 );
			Trans.animRotate( mcHdr, 1/8, 1 );
			
		}

		public function toShow(): void {
			
			Trans.animPlace( this, ( stage.stageWidth / 2 ), y, true, 1 );
			Trans.animRotate( mcHdr, 0, 0, 4 );

		}

		private function open(): void {
			
			if( isOpen ) return;

			Trans.animScale( mcMsk, mcMsk.scaleX, 1, 1, 1 );
			Trans.animPlace( mcCtn, mcCtn.x, 0, true, 1, 1 );
			Trans.animPlace( mcHdl, mcHdl.x, mcCtn.height, true, 1, 1 );
			
			isOpen = true;

		}

		private function close():void {
			
			if( !isOpen ) return;

			Trans.animScale( mcMsk, mcMsk.scaleX, 0, 1, 1 );
			Trans.animPlace( mcCtn, mcCtn.x, -mcCtn.height, true, 1, 1 );
			Trans.animPlace( mcHdl, mcHdl.x, 0, true, 1, 1 );
			
			isOpen = false;

		}

		private function start(): void {

			open();
			
			Trans.rotate( mcHdr, -1/8 );
			Trans.animAlpha( mcHdr, 1, 1 );
			Trans.animRotate( mcHdr, 0, 0, 4 );

			/*	SHUFFLE QUEST
			--------------------------------------------*/
			if ( Q.RQ ) Array_Shuffle( Q.O );
			
			isProcess = true;

		}

	}

}

