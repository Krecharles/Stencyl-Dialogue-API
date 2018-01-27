
package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;

class Text implements DialogueObject {

    var FONT_SIZE = 30;

    var message: String;

    var animatingIndex = 0;

    public function new(message: String) {
        this.message = message;
    }

    public function draw(g:G, showBlinkyAnimations: Bool) {

        animatingIndex++;

        var lines = getLines();
        var charactersShown = 0;

        for (i in 0...lines.length) {
            var range = animatingIndex - charactersShown;
            if (range <= 0) return;
            var displayedText = lines[i].substr(0, range);
            g.drawString(displayedText, 20, FONT_SIZE/2 + i * FONT_SIZE);
            charactersShown += displayedText.length;
        }

    }

    public function isFinished(): Bool {
        return animatingIndex >= message.length;
    }

    public function finish() {
        animatingIndex = message.length;
    }

    public function getHeight():Int {
        return getLines().length * FONT_SIZE;
    }

    public function getLines(): Array<String> {
        return message.split("\n");
    }

    public function keyDown(key: KeyboardEvent) {
    }


}