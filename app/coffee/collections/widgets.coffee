define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  
  common = ['about', 'social', 'reviews', 'clout', 'events', 'contact']
    
  collection =
    
    # COMPANY
    company:
      posts:
        ['checklist', 'calculator', 'matters']
      
      community:
        ['executives', 'employees']
      
      info: common
      
      extra:
        ['commerce', 'org', 'jobs']
      
    # GOV
    gov:
      posts:
        ['debates', 'bills', 'votes']
      
      community:
        ['reps', 'citizens']
        
      info: common
     
      extra:
        ['climate', 'demographics', 'financial', 'budget', 'projects', 'regions', 'purchasing', 'org']
   
    # GROUP
    group:
      posts:
        ['beliefs', 'quotes', 'timeline']
      
      community:
        ['leaders', 'members']
      
      info: common
      
      extra:
        ['org', 'donate']
    
    # SCHOOL
    school:
      posts:
        ['subjects', 'questions', 'answers']
      
      community:
        ['teachers', 'students']
      
      info: common
      
      extra:
        ['org', 'curriculum']
       
  config = (module, page) ->
    mod = collection[module]
    out = mod[page]
    
  collection