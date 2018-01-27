package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.Engine;
import com.stencyl.graphics.G;

class ChoiceButton implements DialogueObject {

    var options: Array<String>;
    var callback:Int->Void;
    var selectedOption = 0;
    var isChoiceFinished = false;

    public function new(options: Array<String>, callback:Int->Void) {
        this.callback = callback;
        this.options = options;
    }

    public function draw(g:G, showBlinkyAnimations: Bool) {

        g.fillColor = 0x000000;

        for(i in 0...options.length) {

            var x = i % 2 == 0 ? 50 : Engine.engine.scene.sceneWidth / 2 + 50;
            var y = Std.int(i / 2) * 30 + 30;
            g.drawString(options[i], x, y);

            if (i != selectedOption || showBlinkyAnimations) continue;

            g.fillCircle(x - 15, y + 16, 5);
        }

    }

    public function keyDown(key: KeyboardEvent) {
        switch(key.keyCode) {
            case 37: // left
                incrementSelectedOption(-1);
            case 38: // up
                incrementSelectedOption(-2);
            case 39: // right
                incrementSelectedOption(1);
            case 40: // down
                incrementSelectedOption(2);
//            case 65:
//                isChoiceFinished = true;
        }
    }

    public function incrementSelectedOption(inc: Int) {
        if (selectedOption + inc < 0) return;
        if (selectedOption + inc >= options.length) return;
        selectedOption += inc;
    }

    public function getHeight():Int {
        return (Std.int(options.length / 2) + 1) * 25;
    }

    public function isFinished():Bool {
        return isChoiceFinished;
    }

    public function finish() {
        isChoiceFinished = true;
        callback(selectedOption);
    }

}
