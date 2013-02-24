//https://github.com/admc/wd
var SCREENSHOOTER= SCREENSHOOTER || {};	
(function(){
	SCREENSHOOTER.webdriver= require('wd'), assert = require('assert');
	SCREENSHOOTER.screenshots= 'screenshots';
	SCREENSHOOTER.i= 0;
	SCREENSHOOTER.url= '';
	SCREENSHOOTER.page= '';
	SCREENSHOOTER.wait= 2000;
	SCREENSHOOTER.browsers= new Array();
	SCREENSHOOTER.session = SCREENSHOOTER.webdriver.remote("ondemand.saucelabs.com", 80, "phourus", "f496e876-5cb9-473a-be9f-ce977940e9e0");
	
	SCREENSHOOTER.session.on('status', function(info){
	  console.log('\x1b[36m%s\x1b[0m', info);
	});
	
	SCREENSHOOTER.session.on('command', function(meth, path){
	  console.log(' > \x1b[33m%s\x1b[0m: %s', meth, path);
	});
	
	SCREENSHOOTER.save_screenshot= function(browser, screenshot){
		var dataBuffer = new Buffer(screenshot, 'base64');
		
		var path= SCREENSHOOTER.screenshots+'/'+SCREENSHOOTER.timestamp()+'/'+SCREENSHOOTER.page+'/';
		var filename= path+browser.browserName+browser.version+browser.platform+'.png';
		//console.log(filename);
		
		SCREENSHOOTER.directory(path);
		require("fs").writeFile(filename, dataBuffer, function(err) {
		  if(err)
			{
				console.log('Save Error: '+err);  
				return false;
			}else{
				console.log('Save Successful');	
				return true;
			}
		});
	}
	
	SCREENSHOOTER.directory= function(dirPath){
		var fs = require('fs');
		var path = require('path');
		 
		 //console.log(dirPath);
		fs.mkdirParent = function(dirPath, mode, callback) {
		  //Call the standard fs.mkdir
		  fs.mkdir(dirPath, mode, function(error) {
			//When it fail in this way, do the custom steps
			
			if(error && error.errno !== 47) {
				console.log(error);
			}
			if (error && error.errno === 34) {
			  //Create all the parents recursively
			  fs.mkdirParent(path.dirname(dirPath), mode, callback);
			  //And then the directory
			  fs.mkdirParent(dirPath, mode, callback);
			}
			//Manually run the callback since we used our own callback to do all these
			callback && callback(error);
		  });
		};
		fs.mkdirParent(dirPath); 
	}
	
	SCREENSHOOTER.timestamp= function(){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yy = today.getFullYear().toString(10).substring(2, 4);
		if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm}
		return yy+mm+dd;
	}
})();

SCREENSHOOTER.init= function(url, page, browsers)
{
	SCREENSHOOTER.url= url;
	SCREENSHOOTER.page= page;	
	SCREENSHOOTER.browsers= browsers;
}
	
SCREENSHOOTER.shoot= function()
{
	if(browsers.length=== SCREENSHOOTER.i+1)
	{
		console.log('Screenshooter finished');
		return true;	
	}
	var browser= browsers[SCREENSHOOTER.i];
	console.log(SCREENSHOOTER.i+'- '+SCREENSHOOTER.url);
	console.log(browser);
	var config= {tags: ['screenshot'], name: 'Screenshooter'};
	config.browserName= browser.browserName;
	config.version= browser.version;
	config.platform= browser.platform;	
	
	SCREENSHOOTER.session.init(config, function() {
	  SCREENSHOOTER.session.get(SCREENSHOOTER.url, function() {
		  SCREENSHOOTER.session.takeScreenshot(function(err, screenshot) {
			if(err)
			{
				console.log('Screenshot Error: '+err);  
				return false;
			}else{
				console.log('Screenshot Successful');	
			}
			var saved= SCREENSHOOTER.save_screenshot(config, screenshot);
			//if(saved == true){ 
				SCREENSHOOTER.session.quit(function(){ SCREENSHOOTER.i++; SCREENSHOOTER.shoot(); });
			//}else{
				//session.quit(); return false; 
			//}
		  })
	   })
	})
}



/** EXECUTION **/
var browsers= new Array();
browsers.push({browserName: 'internet explorer', platform: 'Windows 2003', version: '6', enabled: true});
browsers.push({browserName: 'internet explorer', platform: 'Windows 2003', version: '7', enabled: true});
browsers.push({browserName: 'internet explorer', platform: 'Windows 2003', version: '8', enabled: true});
browsers.push({browserName: 'internet explorer', platform: 'Windows 2008', version: '9', enabled: true});
browsers.push({browserName: 'internet explorer', platform: 'Windows 2012', version: '10', enabled: true});

SCREENSHOOTER.init('http://www.phourus.com/stream#BLO-120704-002-A', 'phourus:blog', browsers);
SCREENSHOOTER.shoot();