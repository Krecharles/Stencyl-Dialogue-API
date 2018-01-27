package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;

class TextArea implements DialogueObject {

    var keys = new Map<Int, String>();
    var inputMessage = "";
    var messageLength = 8;
    var callback: String-> Void;
    var isTextEditingFinished = false;

    public function new(callback:String->Void, ?messageLength=8) {
        initKeys();
        this.callback = callback;
        this.messageLength = messageLength;
    }

    public function draw(g:G, showBlinkyAnimations: Bool): Void {

        var displayedString = inputMessage;

        if (showBlinkyAnimations && !isTextEditingFinished) {
            var underScoresToAdd = messageLength - displayedString.length;
            while (underScoresToAdd > 0) {
                displayedString += "_";
                underScoresToAdd--;
            }
        }

        g.drawString(formatText(displayedString), 20, 30);

    }

    private function formatText(text: String): String {
        var out = "";
        for (i in 0...text.length) {
            out += text.charAt(i) + " ";
        }
        return out;
    }

    public function getHeight():Int {
        return 60;
    }

    public function isFinished():Bool {
        return isTextEditingFinished;
    }

    public function finish() {
        // is not reacting to outer keypress
    }

    public function keyDown(key: KeyboardEvent) {

	   if (isTextEditingFinished) return;
		

        switch (key.charCode) {
            case 8: // delete
                inputMessage = inputMessage.substr(0, inputMessage.length - 1);
                return;
            case 13: // enter
                finishTextEditing();
                return;

        }

        if (inputMessage.length >= messageLength) {
            return;
        }

        if (keys.exists(key.charCode)) {
            inputMessage += keys.get(key.charCode);
        }

    }

    public function finishTextEditing() {
        isTextEditingFinished = true;
        callback(inputMessage);
    }

    public function initKeys() {
        keys.set(65 ,   "A");
        keys.set(66	,   "B");
        keys.set(67	,   "C");
        keys.set(68	,   "D");
        keys.set(69	,   "E");
        keys.set(70	,   "F");
        keys.set(71	,   "G");
        keys.set(72	,   "H");
        keys.set(73	,   "I");
        keys.set(74	,   "J");
        keys.set(75	,   "K");
        keys.set(76	,   "L");
        keys.set(77	,   "M");
        keys.set(78	,   "N");
        keys.set(79	,   "O");
        keys.set(80	,   "P");
        keys.set(81	,   "Q");
        keys.set(82	,   "R");
        keys.set(83	,   "S");
        keys.set(84	,   "T");
        keys.set(85	,   "U");
        keys.set(86	,   "V");
        keys.set(87	,   "W");
        keys.set(88	,   "X");
        keys.set(89	,   "Y");
        keys.set(90	,   "Z");
        keys.set(97	,   "a");
        keys.set(98	,   "b");
        keys.set(99	,   "c");
        keys.set(100,  	"d");
        keys.set(101,  	"e");
        keys.set(102,  	"f");
        keys.set(103,  	"g");
        keys.set(104,  	"h");
        keys.set(105,  	"i");
        keys.set(106,  	"j");
        keys.set(107,  	"k");
        keys.set(108,  	"l");
        keys.set(109,  	"m");
        keys.set(110,  	"n");
        keys.set(111,  	"o");
        keys.set(112,  	"p");
        keys.set(113,  	"q");
        keys.set(114,  	"r");
        keys.set(115,  	"s");
        keys.set(116,  	"t");
        keys.set(117,  	"u");
        keys.set(118,  	"v");
        keys.set(119,  	"w");
        keys.set(120,  	"x");
        keys.set(121,  	"y");
        keys.set(122,  	"z");
    }

}
