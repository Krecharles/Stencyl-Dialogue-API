package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;
class Interrupt implements DialogueObject {

    var isInterruptFinished = false;
    var callback:Void->Void;

    public function new(?callback:Void->Void) {
        this.callback = callback;
    }

    public function draw(g:G,s: Bool): Void {

    }

    public function isFinished():Bool {
        return isInterruptFinished;
    }

    public function finish() {
        isInterruptFinished = true;
        callback();
    }

    public function getHeight():Int {
        return 0;
    }

    public function keyDown(key: KeyboardEvent):Void {

    }

}
