package com.IndieGo.soal {

	import flash.utils.setTimeout;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.IndieGo.soal.quest.InitQuest;
	import com.IndieGo.media.Music;
	import com.IndieGo.utils.Transforms;

	public class init {

		private var root:Object;
		private var stage:Object;
		private var mcQst:Object;
		private var mcStt:Object;
		private var mcTop:Object;
		private var mcTit:Object;
		private var mcTip:Object;
		private var mcPsn:Object;
		private var btHom:Object;
		private var btQst:Object;
		private var btStt:Object;
		private var btTop:Object;
		private var btBg:Object;
		private var mcBg:Object;
		private var Trans:Transforms;
		private var music:Music;
		private var isMode:uint;

		public function init( _this:Object ): void {

			root = _this;
			stage = root.stage;
			mcQst = root.quest;
			mcStt = root.stats;
			mcTop = root.topList;
			mcTit = root.title;
			mcTip = root.tooltip;
			mcPsn = root.pesan;
			btHom = root.bHome;
			btQst = root.bQuest;
			btStt = root.bStats;
			btTop = root.bTopList;
			btBg  = root.bBg;
			mcBg  = root.bg;

			Trans = new Transforms( stage );
			music = new Music([

				'res/audio/Soal_1.mp3',
				'res/audio/Soal_2.mp3',
				'res/audio/Soal_3.mp3',
				'res/audio/Soal_4.mp3'

			], 'all', true );

			isMode = 0;

			root.stop();
			stage.align = 'top';
			stage.scaleMode = 'showAll';

			music.play();
			
			initPesan();
			
			initBtn( btHom, 1, 'Home' );
			initBtn( btQst, 2, 'Soal Latihan' );
			initBtn( btStt, 3, 'Statistik' );
			initBtn( btTop, 4, 'Top List' );
			
			Trans.scale( btHom, 0, 0);
			Trans.scale( btQst, 0, 0);
			Trans.scale( btStt, 0, 0);
			Trans.scale( btTop, 0, 0);
			Trans.scale( mcTit, 1.5, 1.5 );
			Trans.place( mcTit, 1/2, 1/10 );
			Trans.place( mcTip, .5, .5 );
			Trans.place( btHom, .5, .5 );
			Trans.place( btQst, .5, .5 );
			Trans.place( btStt, .5, .5 );
			Trans.place( btTop, .5, .5 );
			Trans.place( btBg, .5, 1.1 );
			
			mcBg.Show();
			
			setTimeout( show, 2000 );

			new InitQuest( 'res/xml/soal.xml', function( Q:Object ) {

				mcQst.init( Q, mcStt, mcTop );

			});
		}

		private function show(): void {
			
			setTimeout( mcTit.anim, 100, 'Soal' );
			setTimeout( Trans.animPlace, 200, btHom, 3.3/8, 3/8 );
			setTimeout( Trans.animPlace, 300, btQst, 4.7/8, 3/8 );
			setTimeout( Trans.animPlace, 400, btStt, 3.3/8, 5/8 );
			setTimeout( Trans.animPlace, 500, btTop, 4.7/8, 5/8 );
			setTimeout( Trans.animScale, 200, btHom, 1, 1 );
			setTimeout( Trans.animScale, 300, btQst, 1, 1 );
			setTimeout( Trans.animScale, 400, btStt, 1, 1 );
			setTimeout( Trans.animScale, 500, btTop, 1, 1 );
			
		}

		private function hide(): void {
			
			mcBg.Hide();
			
			if( isMode === 2 ) mcQst.toRight();
			
			setTimeout( Trans.animPlace, 100, mcTit, 1/2, -0.1 );
			setTimeout( Trans.animPlace, 100, btHom, 7/17, 1.1 );
			setTimeout( Trans.animPlace, 200, btQst, 8/17, 1.1 );
			setTimeout( Trans.animPlace, 300, btStt, 9/17, 1.1 );
			setTimeout( Trans.animPlace, 400, btTop, 10/17, 1.1 );
			setTimeout( Trans.animPlace, 500, btBg, .5, 1.1 );
			
		}

		private function goto( go:Number, scene:String = '' ): void {
			
			if ( scene !== '' ) {
							
				hide();

				if ( isMode === 2 ) mcQst.toRight();
				if ( isMode === 3 ) mcStt.toRight();
				if ( isMode === 4 ) mcTop.toRight();

				setTimeout( music.stop, 2000 );
				setTimeout( root.gotoAndStop, 2000, 1, scene );
				
				return;
				
			} else if ( isMode === 0 && go !== 1 ) {
				
				Trans.animPlace( mcTit, .5, 0 );
				Trans.animScale( mcTit, 1, 1 );
				Trans.animPlace( btBg, .5, 1, false, 1 );
				Trans.animScale( mcTip, .7, .7 );
				
				setTimeout( Trans.animPlace, 100, btHom, 7/17, .95 );
				setTimeout( Trans.animPlace, 200, btQst, 8/17, .95 );
				setTimeout( Trans.animPlace, 300, btStt, 9/17, .95 );
				setTimeout( Trans.animPlace, 400, btTop, 10/17, .95 );
				setTimeout( Trans.animScale, 100, btHom, .5, .5 );
				setTimeout( Trans.animScale, 200, btQst, .5, .5 );
				setTimeout( Trans.animScale, 300, btStt, .5, .5 );
				setTimeout( Trans.animScale, 400, btTop, .5, .5 );
				
			}
			
			if( go === isMode ) return;
				
			else if ( go === 1 ) {
							
				if ( mcQst.isProcess ) Trans.animPlace( mcPsn, .5, .5 );
				
				else goto( 0, 'Intro' );
				
			} else if ( go === 2 ) {
				
				mcTit.anim( 'Soal Latihan' );
				
				if ( isMode === 3 ) mcStt.toRight();
				if ( isMode === 4 ) mcStt.toRight(), mcTop.toRight();

				mcQst.toShow();

				isMode = go;
				
			} else if ( go === 3 ) {
				
				mcTit.anim( 'Statistik' );
				
				if ( isMode === 0 || isMode === 2 ) mcQst.toLeft();
				if ( isMode === 4 ) mcTop.toRight();
				
				mcStt.toShow();

				isMode = go;
				
			} else if ( go === 4 ) {
				
				mcTit.anim('Top List');
				
				if ( isMode === 0 || isMode === 2 ) mcQst.toLeft();
				if ( isMode === 0 || isMode === 2 || isMode === 3 ) mcStt.toLeft();
							
				mcTop.toShow();

				isMode = go;
				
			}
			
		}

		private function initBtn( b:Object, go:Number, tip:String ): void {
			
			var isDown:Boolean = false;
			
			b.addEventListener( MouseEvent.MOUSE_OVER, function( e:MouseEvent ): void {
				
				mcTip.show( tip );

				Trans.animPlace( mcTip, b.x, (b.y - b.height / 2), true, 1, 1 );
				Trans.animRotate( b.ico, 1/36, 0, 1 );
				Trans.animScale( b.bg, 1.1, 1.1, 1, 1 );
				Trans.animScale( btBg, 1.05, 1, 1, 1 );
				
			});
			
			b.addEventListener( MouseEvent.MOUSE_OUT,  function( e:MouseEvent ): void {
				
				mcTip.hide();
				
				Trans.animRotate( b.ico, 0, 0, 1 );
				Trans.animScale( b.bg, 1, 1, 1, 1 );
				Trans.animScale( btBg, 1, 1, 1, 1 );
				
				if( isDown ) isDown = false;
				
			});
			
			b.addEventListener( MouseEvent.MOUSE_DOWN,  function( e:MouseEvent ): void {
				
				Trans.animRotate( b.ico, -1/36, 0, 1 );
				
				isDown = true;
				
			});
			
			b.addEventListener( MouseEvent.MOUSE_UP,  function( e:MouseEvent ): void {
				
				if( isDown ) {
					
					Trans.animRotate( b.ico, 1/36, 0, 1 );			
					
					isDown = false;
					
				}
				
			});
			
			b.addEventListener( MouseEvent.CLICK, function( e:MouseEvent ): void {
				
				goto( go );
				
			});
			
		}

		private function initPesan(): void {
			
			Trans.place( mcPsn, .5, 1.2 );
			
			mcPsn.b1.alpha = mcPsn.b2.alpha = .7;
			
			function over( e:MouseEvent ): void {

				Trans.animAlpha( e.target, 1, .2 );
							
			}
			
			function out( e:MouseEvent ): void {
				
				Trans.animAlpha( e.target, .7, .2 );
				
			}
			
			function click( e:MouseEvent ): void {
				
				Trans.animPlace( mcPsn, .5, 1.2 );
				
			}
			
			function confirm( e:MouseEvent ): void {
				
				goto( 0, 'Intro' );
				
			}
			
			mcPsn.b1.addEventListener( MouseEvent.MOUSE_OVER, over );
			mcPsn.b1.addEventListener( MouseEvent.MOUSE_OUT, out );
			mcPsn.b1.addEventListener( MouseEvent.CLICK, click );
			mcPsn.b1.addEventListener( MouseEvent.CLICK, confirm );
			mcPsn.b2.addEventListener( MouseEvent.MOUSE_OVER, over );
			mcPsn.b2.addEventListener( MouseEvent.MOUSE_OUT, out );
			mcPsn.b2.addEventListener( MouseEvent.CLICK, click );
			
		}

	}

}