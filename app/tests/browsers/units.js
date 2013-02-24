//https://github.com/admc/wd
function units()
{
	var webdriver = require('wd'), assert = require('assert');
	
	var session = webdriver.remote("ondemand.saucelabs.com", 80, "phourus", "f496e876-5cb9-473a-be9f-ce977940e9e0");
	
	session.on('status', function(info){
	  console.log('\x1b[36m%s\x1b[0m', info);
	  //console.log(info);
	});
	
	session.on('command', function(meth, path){
	  console.log(' > \x1b[33m%s\x1b[0m: %s', meth, path);
	  //console.log(meth, path);
	});
	
	this.test= function(url, browsers)
	{
		for(var i in browsers)
		{
			var browser= browsers[i];
			var config= {tags: ['units'], name: 'Units'};
			config.browserName= browser.browserName;
			config.version= browser.version;
			config.platform= browser.platform;
			
			/*	
			session.init(config, function() {
			  session.get(url, function() {
				  session.quit();
			   })
			})
			*/
			session
			.chain()
			.init(config)
			.get(url)
			.quit()
		}
	}
}

var browsers= new Array();
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
browsers.push({browserName: 'internet explorer', platform: 'Windows 2003', version: '6'});
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
//browsers.push({browserName: 'chrome', platform: 'Mac 10.6', version: ''});
var u= new units();
u.test('http://www.phourus.com/api/tests/unit', browsers);