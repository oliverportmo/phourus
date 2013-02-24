module.exports= function(){

  var sys = require('sys');
   
  var Client = require('mysql').Client;
  var client = new Client();
   
  client.user = 'root';
  client.password = 'admin';
 
  client.connect(function(error, results) {
    if(error) {
      //console.log('Connection Error: ' + error.message);
      //return;
      //exports.error;
    }
    //ClientConnectionReady(client);
  });
}  
//console.log('Connecting to MySQL...');
/* 
c
 
ClientConnectionReady = function(client)
{
    client.query('USE NodeSample', function(error, results) {
        if(error) {
            console.log('ClientConnectionReady Error: ' + error.message);
            client.end();
            return;
        }
        ClientReady(client);
    });
};
 
ClientReady = function(client)
{
  var values = ['Chad', 'Lung', 'Hello World'];
  client.query('INSERT INTO MyTable SET firstname = ?, lastname = ? , message = ?', values,
    function(error, results) {
      if(error) {
        console.log("ClientReady Error: " + error.message);
        client.end();
        return;
      }
      console.log('Inserted: ' + results.affectedRows + ' row.');
      console.log('Id inserted: ' + results.insertId);
    }
  );
  GetData(client);
}
 
GetData = function(client)
{
  client.query(
    'SELECT * FROM MyTable',
    function selectCb(error, results, fields) {
      if (error) {
          console.log('GetData Error: ' + error.message);
          client.end();
          return;
      }
      // Uncomment these if you want lots of feedback
      //console.log('Results:');
      //console.log(results);
      //console.log('Field metadata:');
      //console.log(fields);
      //console.log(sys.inspect(results));
       
      if(results.length > 0)
      {          
        var firstResult = results[0];
        console.log('First Name: ' + firstResult['firstname']);
        console.log('Last Name: ' + firstResult['lastname']);
        console.log('Message: ' + firstResult['message']);
      }
  });
 
  client.end();
  console.log('Connection closed');
};
**/