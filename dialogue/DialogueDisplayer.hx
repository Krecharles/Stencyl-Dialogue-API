package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;

interface DialogueDisplayer {

    public function draw(g: G): Void;
    public function isReadyToSwitch(): Bool;
    public function makeReadyToSwitch(): Void;
    public function keyDown(key: KeyboardEvent): Void;
    public var height: Int;

}
