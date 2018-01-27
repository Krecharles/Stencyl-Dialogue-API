# Stencyl-Dialogue-API
An API that not only displays animated text but also handles inputs, such as text or multiple choice. 

![alt text](https://github.com/Krecharles/Stencyl-Dialogue-API/blob/master/Text%20Image.png)

You can view the next page or skip the current animation by pressing A. The current scene is automatically paused (if it is not transitioning). 

## Usage

Note that the API has to be used in code. 

**clone this repository to your source code.** On a Mac, this directory should now be in ~stencylworks/your-Game/Source/scripts

**import the API**
```haxe 
import scripts.dialogue.*
```

**create a dialogue instance**
```haxe 
var dialogue = new Dialogue();
```
   with an optional callback:
```haxe 
var callback = function() {
  trace("I get printed when the dialogued is closed");
}
var dialogue = new Dialogue(callback);
```
**create a Page instance**
```haxe 
var textElement = new Text("Finaly, you are awake. \nThis is a new line);
var page = new Page([textElement]);
```
**add page to the dialogue instance**
```haxe 
dialogue.addPage(page);
```
or
```haxe 
dialogue.addPages([page]);
```

---
That's it. The text should now display.

## Other Functionalities
All the following functionalities should be used like the Text functionality. This is to say:  
```haxe 
new Page([functionality1, functionality2]);
```
### Interrupt
Stops the text animation until A is pressed again.
```haxe 
var callback = function() {
  trace("I get printed when the interrupt is finished");
}
// callback is optional
new Interrupt(callback);
```

### TextArea
Asks User for Text input.
```haxe 
var callback = function(message: String) {
  trace("The user entered " + message);
}
var messageLength = 8;
// messageLength is optional, default is 8.
new TextArea(callback, messageLength);
```

### ChoiceButton
The user can choose between given options.
```haxe 
var options = ["Cat", "Dog", "Mouse", "Goat"]
var callback = function(indexOfChoice: Int) {
  trace("The user entered " + options[indexOfChoice]);
}
new ChoiceButton(options, callback);
```
