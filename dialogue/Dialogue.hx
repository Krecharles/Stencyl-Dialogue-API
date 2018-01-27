/*
    Stencyl exclusively uses the Haxe programming language. 
    Haxe is similar to ActionScript and JavaScript.
    
    Want to use native code or make something reusable? Use the Extensions Framework instead.
    http://www.stencyl.com/help/view/engine-extensions/
    
    Learn more about Haxe and our APIs
    http://www.stencyl.com/help/view/haxe/


*/

package scripts.dialogue;

import com.stencyl.graphics.G;
import com.stencyl.Engine;

// controles input
class Dialogue {

    public static var ANIMATING_FRAMES_ON = 25;
    public static var ANIMATING_FRAMES_OFF = 15;

    var dialogueDisplayer: Array<DialogueDisplayer> = [];

    var callback: Void-> Void;

    public function new(?callback:Void->Void) {
        Engine.engine.whenDrawingListeners.push(draw);
        Engine.engine.whenAnyKeyPressedListeners.push(keyDown);
        trace("[Info]: Scene '" + Engine.engine.scene.name + "' is about to be paused.");
        //transition has to be finished to pause the engine.
        Engine.engine.pause();
        this.callback = callback;
    }

    public function delete() {
        if (callback != null)
            callback();
        trace("[Info]: Scene '" + Engine.engine.scene.name + "' is about to be resumed.");
        Engine.engine.unpause();
        Engine.engine.whenDrawingListeners.remove(draw);
        Engine.engine.whenAnyKeyPressedListeners.remove(keyDown);
    }

    public function addPage(page: DialogueDisplayer) {
        dialogueDisplayer.push(page);
    }

    public function addPages(pages: Array<DialogueDisplayer>) {

   	   for (page in pages) {
   	   	addPage(page);
   	   }
    	  
    }

    function next() {
        if (dialogueDisplayer.length > 0) {
            dialogueDisplayer.splice(0, 1);
        }

        if (dialogueDisplayer.length == 0) {
            delete();
        }
    }

    public function draw(g:G, x:Float, y:Float, list:Array<Dynamic>) {

        var g = Engine.engine.g;

        g.translate(0, Engine.screenHeight - getCurrentPage().height);

        getCurrentPage().draw(g);

    }

    public function getCurrentPage(): DialogueDisplayer {
        return dialogueDisplayer[0];
    }

    public function keyDown(key: Dynamic, list:Array<Dynamic>) {

        getCurrentPage().keyDown(key);

        if (key.keyCode != 65) { // a = 65
            return;
        }

        if (!getCurrentPage().isReadyToSwitch()) {
            getCurrentPage().makeReadyToSwitch();
            return;
        }

        next();

    }

}










