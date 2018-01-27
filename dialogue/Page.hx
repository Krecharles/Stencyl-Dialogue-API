
package scripts.dialogue;

import flash.events.KeyboardEvent;
import com.stencyl.graphics.G;
import com.stencyl.Engine;

class Page implements DialogueDisplayer {

    public var triangleColor = 0x000000;
    public var triangleAlpha = 1.0;

    public var height: Int;
    var children: Array<DialogueObject> = [];

    var framesShown = Dialogue.ANIMATING_FRAMES_ON;

    public function new(objs:  Array<DialogueObject>, ?height=200) {
        children = objs;
        this.height = height;
    }

     public function add(obj: DialogueObject) {
        children.push(obj);
    }

    public function draw(g:G) {

        framesShown++;
        if (framesShown > Dialogue.ANIMATING_FRAMES_ON) {
            framesShown = -Dialogue.ANIMATING_FRAMES_OFF;
        }

        g.fillColor = 0xFFffFF;
        g.alpha = 1;
        g.fillRect(0, 0, getSceneWidth(), height);

        var translationY = 0;

        for (child in children) {
            child.draw(g, framesShown < 0);
            if (!child.isFinished()) break;
            g.translate(0, child.getHeight());
            translationY += child.getHeight();
        }

        drawTrianlge(g, translationY);

    }

    private function drawTrianlge(g: G, translationY: Int) {

        if (framesShown < 0) return;
        if (!isReadyToSwitch()) return;

        g.translate(0, -translationY);
        g.fillColor = triangleColor;
        g.alpha = triangleAlpha;
        var size = 25; var offset = 25;
        var x = getSceneWidth() - size - offset;
        var y = height - size - offset;
        g.beginFillPolygon();
        g.addPointToPolygon(x, y);
        g.addPointToPolygon(x + size, y);
        g.addPointToPolygon(x + size/2, y + size);
        g.endDrawingPolygon();
//        g.fillRect(getSceneWidth() - 50, height - 50, 25, 25);

    }

    private function getSceneWidth(): Int {
        return Engine.screenWidth;
    }

    private function getSceneHeight(): Int {
        return Engine.screenHeight;
    }

    public function isReadyToSwitch(): Bool {

        for (child in children) {
            if (!child.isFinished()) return false;
        }

        return true;
    }

    public function makeReadyToSwitch() {

        for (child in children) {
            if (child.isFinished()) continue;
            child.finish();
            return;
        }

    }

    public function keyDown(key: KeyboardEvent) {
        for (child in children) {
            child.keyDown(key);
        }
    }

}