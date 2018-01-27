/*
    Stencyl exclusively uses the Haxe programming language. 
    Haxe is similar to ActionScript and JavaScript.
    
    Want to use native code or make something reusable? Use the Extensions Framework instead.
    http://www.stencyl.com/help/view/engine-extensions/
    
    Learn more about Haxe and our APIs
    http://www.stencyl.com/help/view/haxe/
*/

package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;

interface DialogueObject {

    public function draw(g:G, showBlinkyAnimations: Bool): Void;

    public function isFinished(): Bool;

    public function finish(): Void;

    public function getHeight():Int;

    public function keyDown(key: KeyboardEvent):Void;

}