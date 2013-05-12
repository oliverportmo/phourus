define([
'../../modules/standard/router',
'../../modules/stream/router',
'../../modules/govs/router',
'../../modules/companies/router',
'../../modules/schools/router',
'../../modules/groups/router'], 
	function(standard, stream, govs, companies, schools, groups){
		var routers= {
			standard: standard,
			stream: stream,
			govs: govs,
			companies: companies,
			schools: schools,
			groups: groups
		}	
		return routers;
});