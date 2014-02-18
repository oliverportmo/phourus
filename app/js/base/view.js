// Generated by CoffeeScript 1.6.2
var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

define(["jquery", "backbone", "underscore", "js/collections/widgets"], function($, Backbone, _, cWidgets) {
  var view;

  view = Backbone.View.extend({
    /* CLEAR
    */

    destroy: function() {
      /*
      @$el.removeData().unbind()
      @remove()
      Backbone.View.prototype.remove.call(this)
      */

    },
    clear: function() {
      return $(this.el).empty();
    },
    format_date: function(input, mode) {
      var date, day, hour, month, now, out, post, year;

      if (input === '0000-00-00 00:00:00' || input === null || input === '') {
        return 0;
      }
      if (mode === 'absolute') {
        return input;
      }
      if (mode === 'relative') {
        now = new Date();
        out = '';
        post = new Date(input);
        day = post.getDay();
        date = post.getDate();
        month = post.getMonth() + 1;
        year = post.getFullYear();
        if (month === now.getMonth() + 1 && year === now.getFullYear()) {
          if (date === now.getDate()) {
            hour = post.getHours();
            if (now.getHours() - hour > 1) {
              out = now.getHours() - hour + ' hours ago';
            } else {
              out = now.getMinutes() - post.getMinutes() + ' minutes ago';
            }
          } else if (date + 1 === now.getDate()) {
            out = 'Yesterday';
          } else if (now.getDate() - 7 < date) {
            out = this.day_string(post.getDay());
          } else {
            out = this.month_string(month) + ' ' + date;
          }
        } else if (year === now.getFullYear()) {
          out = this.month_string(month) + ' ' + date;
        } else {
          out = this.month_string(month) + ' ' + date + ', ' + year;
        }
      }
      return out;
    },
    month_string: function(input) {
      var months;

      input = input.toString();
      months = {
        '1': 'January',
        '2': 'February',
        '3': 'March',
        '4': 'April',
        '5': 'May',
        '6': 'June',
        '7': 'July',
        '8': 'August',
        '9': 'September',
        '10': 'October',
        '11': 'November',
        '12': 'December'
      };
      return months[input];
    },
    day_string: function(input) {
      var days;

      input = input.toString();
      days = {
        "0": "Sunday",
        "1": "Monday",
        "2": "Tuesday",
        "3": "Wednesday",
        "4": "Thursday",
        "5": "Friday",
        "6": "Saturday"
      };
      return days[input];
      /*  
      format_url: (input) ->
      
      		http = input.search new RegExp(/^http:\/\//i)		
      		https= input.search(new RegExp(/^https:\/\//i));
      		if !http or !https
      			input
      		else
      		    'http://'+input;
      	
      	
      
      	add_commas: (nStr, decimals) ->
      
      		decimals = decimals || 2
      		nStr += ''
      		x = nStr.split('.')
      		x1 = x[0]
      		x2 = x.length > 1 ? '.' + x[1] : ''
      		var rgx = /(\d+)(\d{3})/
      		while rgx.test(x1) 
      			x1 = x1.replace(rgx, '$1' + ',' + '$2')
      		result= x1 + x2
      		result;	
      	
      	decimals: -> (n, decimals) 
      		sep = "."
      		decimals = decimals || 2 
      	
      		if typeof n == 'string' 
      		  n= parseFloat(n)
      		
      		n.toLocaleString().split(sep)[0] + sep + n.toFixed(decimals).split(sep)[1];
      
      
        	url: ->
        		path= window.location.pathname
        		url= path.split('/')
        		url.shift()
        		url
      */

    },
    /* SUBVIEWS
    */

    subviews: function(selector, view) {
      var selectors;

      selectors = void 0;
      if (_.isObject(selector)) {
        selectors = selector;
      } else {
        selectors = {};
        selectors[selector] = view;
      }
      if (!selectors) {
        return;
      }
      return _.each(selectors, (function(view, selector) {
        return view.setElement(this.$(selector)).render();
      }), this);
    },
    /* PAGES
    */

    page: function(params) {
      var module, page, posts, self, users;

      params.el = "#widgets";
      page = params.page;
      self = this;
      if (page === 'extras') {
        require(["js/modules/orgs/views/extras"], function(view) {
          var v;

          return v = new view(params);
        });
      } else {
        posts = ['posts', 'checklist', 'calculator', 'matters', 'subjects', 'questions', 'answers', 'debates', 'bills', 'votes', 'beliefs', 'quotes', 'timeline'];
        users = ['users', 'employees', 'executives', 'teachers', 'students', 'citizens', 'reps', 'leaders', 'members'];
        if (__indexOf.call(users, page) >= 0) {
          page = 'users';
        }
        module = "js/modules/orgs/shared/" + page;
        if (__indexOf.call(posts, page) >= 0) {
          module = "js/modules/stream/views/stream";
        }
        require([module], function(view) {
          var v;

          v = new view(params);
          return v.render();
        });
      }
      return page;
    },
    extra: function(page) {
      var extras, module;

      module = 'gov';
      extras = cWidgets[module];
      if (__indexOf.call(extras, page) >= 0) {
        return true;
      } else {
        return false;
      }
    },
    pic: function(type, id, ext) {
      return '/assets/pics/' + type + '/' + id + '.' + ext;
    }
  });
  return view;
});
