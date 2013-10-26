#!/bin/bash
coffee --compile --bare --output app/js/ app/coffee/
lessc app/css/style.less > app/css/style.css
#node r.js -o build/config.js
echo 'Phourus build complete'