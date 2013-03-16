(function() {
window.fireflyAPI = {};
fireflyAPI.token = "513d5a84857000265c0c2143";
var script = document.createElement("script");
script.type = "text/javascript";
script.src = "https://firefly-071591.s3.amazonaws.com/scripts/loaders/loader.js";
script.async = true;
var firstScript = document.getElementsByTagName("script")[0];
firstScript.parentNode.insertBefore(script, firstScript);
})();