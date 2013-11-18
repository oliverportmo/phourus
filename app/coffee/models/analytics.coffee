define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  _gaq = _gaq || []
  if window
    window._gaq = _gaq
  _gaq.push(['_setAccount', 'UA-23918330-1']);
  _gaq.push(['_setDomainName', 'phourus.com']);
  _gaq.push(['_setAllowLinker', true]);


  ga = document.createElement('script') 
  ga.type = 'text/javascript' 
  ga.async = true
  protocol = 'http://www'
  if 'https:' is document.location.protocol  
    protocol = 'https://ssl'
     
  url = protocol + '.google-analytics.com/ga.js'
  ga.src = url
  s = document.getElementsByTagName('script')[0] 
  s.parentNode.insertBefore(ga, s)
  ga