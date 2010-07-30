TODO
---
### (Perceived) Speed improvements
* See if Faye is the way the go (Could be slower than direct usage of websockets). Would also
  remove the dependency on Thin.
* Show a spinner or something when something is loading. Especially for Sass files which is 
  currently a bit too slow to be completely satisfying.

## Usage
* Read configuration files so people can easily customize

### Code cleanup
* Make this reloader a real engine when Rails is ready (or the documentation on it)
    - Remove the controller and route that serve the javascript
    - If possible remove the Rack middleware that injects the javascript
* Remove the Rack reordering hack to fix the loading of Sass files => make sure Sass reloads stylesheets itself or watch stylesheets if thats better.
