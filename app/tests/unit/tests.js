// JavaScript Document
	
/*	
test('temp', function(){
	expect(0);
});*/


module('init');
test('load', function(){
	ok(PHOURUS, 'PHOURUS NS');
	ok(PHOURUS.AUTH, 'PHOURUS.AUTH');
	ok(PHOURUS.DATA, 'PHOURUS.DATA');
	ok(PHOURUS.DISPLAY, 'PHOURUS.DISPLAY');
	ok(PHOURUS.FORMAT, 'PHOURUS.FORMAT');
	ok(PHOURUS.MESSAGES, 'PHOURUS.MESSAGES');
	ok(PHOURUS.POST, 'PHOURUS.POST');
	ok(PHOURUS.STREAM, 'PHOURUS.STREAM');
});
	
module('auth');	
test('auth', function(){
	PHOURUS.TEST= true;
	equal(PHOURUS.TEST, true);
	equal(PHOURUS.AUTH.user, null);
	equal(PHOURUS.AUTH.id, null);
	equal(PHOURUS.AUTH.type, null);
	//PHOURUS.AUTH.login('fb');
	//stop();
	//$j('#spacer').bind('user.set_user', function(e, result){ 
		//start();
		//console.log(PHOURUS.AUTH);  
	//});
	//console.log(PHOURUS.AUTH); 
	PHOURUS.AUTH.id= '1143206876';
	PHOURUS.AUTH.type= 'facebook';
	equal(PHOURUS.AUTH.id, '1143206876', 'tesetaet');
	equal(PHOURUS.AUTH.type, 'facebook', 'abergwrge');
});

module('format');
test('format_url', function(){
	
	//format_url
	equal(PHOURUS.FORMAT.format_url('phourus.com'), 'http://phourus.com', 'phourus.com');
	equal(PHOURUS.FORMAT.format_url('www.phourus.com'), 'http://www.phourus.com', 'www.phourus.com');
	equal(PHOURUS.FORMAT.format_url('http://www.phourus.com'), 'http://www.phourus.com', 'http://www.phourus.com');
	equal(PHOURUS.FORMAT.format_url('https://www.phourus.com'), 'https://www.phourus.com', 'https://www.phourus.com');
	
	//format_date
	/** REQUIRES now() **/
});

test('month_string', function(){
	//month_string
	equal(PHOURUS.FORMAT.month_string('1'), 'January', '"1"');
	equal(PHOURUS.FORMAT.month_string('7'), 'July', '"7"');
	equal(PHOURUS.FORMAT.month_string(1), 'January', '1');
	equal(PHOURUS.FORMAT.month_string(7), 'July', '7');	
	//equal(PHOURUS.FORMAT.month_string('01'), 'January', '"01"');
	//equal(PHOURUS.FORMAT.month_string('07'), 'July', '"07"');
	equal(PHOURUS.FORMAT.month_string('13'), false, '"13"');
	equal(PHOURUS.FORMAT.month_string('ABC'), false, '"ABC"');
});

test('day_string', function(){
	//day_string
	equal(PHOURUS.FORMAT.day_string('1'), 'Monday', '"1"');
	equal(PHOURUS.FORMAT.day_string('6'), 'Saturday', '"6"');
	equal(PHOURUS.FORMAT.day_string(1), 'Monday', '1');
	equal(PHOURUS.FORMAT.day_string(6), 'Satgurday', '6');	
	//equal(PHOURUS.FORMAT.day_string('01'), 'Monday', '"01"');
	//equal(PHOURUS.FORMAT.day_string('06'), 'Saturday', '"06"');
	equal(PHOURUS.FORMAT.day_string('7'), false, '"7"');
	equal(PHOURUS.FORMAT.day_string('ABC'), false, '"ABC"');
});

test('add_commas', function(){	
	//add_commas
	equal(PHOURUS.FORMAT.add_commas('45'), '45', '"45"');
	equal(PHOURUS.FORMAT.add_commas('1231'), '1,231', '"1231"');
	equal(PHOURUS.FORMAT.add_commas('4511531'), '4,511,531', '"4511531"');
	equal(PHOURUS.FORMAT.add_commas('541.40'), '541.40', '"541.40"');
	equal(PHOURUS.FORMAT.add_commas('1334.23'), '1,334.23', '"1334.23"');
	equal(PHOURUS.FORMAT.add_commas(45), '45', '45');
	equal(PHOURUS.FORMAT.add_commas(1231), '1,231', '1231');
	equal(PHOURUS.FORMAT.add_commas(4511531), '4,511,531', '4511531');
	//equal(PHOURUS.FORMAT.add_commas(541.40), '541.40', '541.40');
	equal(PHOURUS.FORMAT.add_commas(1334.23), '1,334.23', '1334.23');
});

test('url', function(){
	//url
	deepEqual(PHOURUS.FORMAT.url(), ['api', 'tests', 'tests.php']);
	equal(PHOURUS.FORMAT.url().length, 3);
});


var failed= new Array();
QUnit.log(function(details){
	if(details.result== false)
	{
		failed.push(details);
	}
});
QUnit.done(function(details){
	var data= {};
	data.user= navigator.userAgent;
	data.summary= details;
	data.failed= failed;
	console.log(data);
	call('display', 'units', data, 'phourus');
	$j('#spacer').bind('display.units', function(e, result){ console.log(e); console.log(result); });
});
