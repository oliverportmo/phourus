define ["jquery", "underscore", "backbone"], ($) ->
  mTypes = Backbone.Model.extend(
    initialize: ->
      core = {}
      core.blogs = "Blogs"
      core.links = "Links"
      core.ideas = "Ideas"
      core.events = "Events"
      earth = {}
      earth.calculator = "Calculator"
      earth.checklist = "Checklist"
      earth.matters = "Matters"
      #earth.companies = "Companies"
      
      #earth.stores= 'Stores';
      mind = {}
      mind.subjects = "Subjects"
      mind.questions = "Questions"
      mind.answers = "Answers"
      #mind.schools = "Schools"
      
      #mind.scores= 'Scores';
      voice = {}
      voice.debates = "Debates"
      voice.bills = "Bills"
      voice.votes = "Votes"
      #voice.govs = "Govs"
      
      #voice.budget= 'Budget';
      self = {}
      self.beliefs = "Beliefs"
      self.quotes = "Quotes"
      self.timeline = "Timeline"
      #self.groups = "Groups"
      
      #self.ranks= 'Ranks';
      CORE =
        element: "core"
        sections: core

      EARTH =
        element: "earth"
        sections: earth
        description: "Phourus Earth is about maintaining the balance between the economy & the environment"

      MIND =
        element: "mind"
        sections: mind
        description: "Phourus Mind is focused on improving education and the school system"

      VOICE =
        element: "voice"
        sections: voice
        description: "Phourus Voice is about using the most powerful democratic tool available for Government; the Internet"

      SELF =
        element: "self"
        sections: self
        description: "Phourus Self is centered around belief systems such as religion, philosophy, and spirituality"

      @set [CORE, EARTH, MIND, VOICE, SELF]

    get_parent: (child) ->
      parent = ""
      _.each @attributes, (element) ->
        keys = _.keys(element.sections)
        _.each keys, (key) ->
          parent = element.element  if key is child


      parent

    validate_terms: (value, form) ->
      err = 
        type: 'terms',
        message: 'You must accept the Terms & Conditions if you would like to create an account'
      err unless value is true

    validate_handle: (value, form) ->
      pattern = /^[a-zA-Z0-9]{4,16}$/
      result = pattern.test value   
      err = 
        type: 'handles'
        message: 'Usernames & Shortnames should be alphanumeric and 4-16 characters long'
      err unless result is true
      
    schema: (type) ->
      schema = {}
      required = {type: "Text", validators: ['required']}
      email = {type: "Text", validators: ['required', 'email']}
      handle = {type: "Text", validators: [@validate_handle]}
      terms = {type: "Checkbox", help: "Click to accept the terms & conditions", validators: [@validate_terms]}
      if type is 'contact'
        schema.first = required
        schema.last = required
        schema.email = email
        schema.subject = {type: "Select", options: ["General information", "Report an issue", "Tell us what you think", "Join the Phourus Team", "Other"]}
        schema.message = {type: "TextArea", validators: ['required']}
      if type is 'signuporg'
        schema.name = required
        schema.shortname = handle
        schema.email = email
        schema.type =  {type: "Select", options: ["Gov", "Company", "School", "Group"]}
        schema.terms = terms
      if type is 'signup'
        schema.username = handle
        schema.first = required
        schema.last = required
        schema.email = email
        schema.terms = terms
      if type is 'short-signup'
        schema.username = _.extend(handle, {editorAttrs: {'placeholder': 'desired username'}})
        schema.email = _.extend(email, {editorAttrs: {'placeholder': 'your email address'}})
        
      element = {type: "Select", options: ["Earth", "Mind", "Voice", "Self"]}
      privacy = {type: "Select", options: ["Public", "Phourus", "Friends", "Following", "Followers", "Private"]}
      switch type
        
        when "blogs"
          schema.title = "Text"
          schema.element = element
          schema.category = "Text"
          schema.privacy = privacy
          schema.content = "TextArea"
        when "links"
          schema.url = "Text"
          schema.element = element
          schema.category = "Text"
          schema.privacy = privacy
          schema.content = "TextArea"
        when "ideas"
          schema.title = "Text"
          schema.element = element
          schema.category = "Text"
          schema.privacy = privacy
          schema.content = "TextArea"
        when "events"
          schema.title = "Text"
          schema.element = element
          schema.category = "Text"
          schema.privacy = privacy
          schema.date = "Date"
          schema.content = "TextArea"
          #schema.address= {type: 'NestedModel', model: Address };
        when "calculator", "checklist", "matters"
          schema.title = "Text"
          schema.category = "Text"
          schema.privacy = privacy
          schema.positive = "Checkbox"
        when "subjects"
          schema.title = "Text"
          schema.category = "Text"
          schema.subcategory = "Text"
          schema.privacy = privacy
          schema.difficulty = "Text"
          schema.content = "TextArea"
        when "questions"
          schema.title = "Text"
          schema.category = "Text"
          schema.subcategory = "Text"
          schema.privacy = privacy
          schema.difficulty = "Text"
          schema.content = "TextArea"  
        when "answers"
          schema.question = "Text"
          schema.content = "TextArea"
        when "debates"
          schema.title = "Text"
          schema.category = "Text"
          schema.privacy = privacy
          schema.scope = {type: "Select", options: ["Local", "State", "National"]}
          schema.zip = "Text"
          schema.content = "TextArea"
        when "votes"
          schema.vote = "Text"
          schema.source = "Text"
          schema.content = "TextArea"
        when "bills"
          schema.debate = "Text"
          schema.rep = "Text"
          schema.question = "Text"
          schema.deadline = "DateTime"
          schema.content = "TextArea"
        when "beliefs"
          schema.title = "Text"
          schema.category = "Text"
          schema.privacy = privacy
          schema.content = "TextArea"
        when "timeline"
          schema.title = "Text"
          schema.category = "Text"
          schema.privacy = privacy
          schema.date = "Date"
          #schema.time = "Time"
          schema.content = "TextArea"        
          #schema.address= {type: 'NestedModel', model: Address };		
        when "quotes"
          schema.quote = "Text"
          schema.source = "Text"
          schema.content = "TextArea"
        when "orgs"
          schema.name = "Text"
          schema.type = "Text"
          schema.shortname = "Text"
          schema.video = "Text"
          schema.channel = "Text"
          schema.email = "Text"
          schema.phone = "Text"
          schema.address = "Text"
          schema.about = "TextArea"
          schema.contact = "TextArea"
        else
      schema

    description: (type) ->
      if _.isUndefined(@descriptions[type])
        ""
      else
        @descriptions[type]

    descriptions:
      #Contact
      contact: "We want to hear from you! Let us know what you think whether it be ways to improve Phourus, things you like or dislike, or any issues you've encountered. We appreciate the feedback!"
      #Core
      blogs: "Blogs are the most basic post on Phourus, and can be used to write about virtually any topic, as long as it's relevant to the 4 Elements of Phourus, meaning they should somewhat relate to the Environment, Education, Politics or Religion in one way or another."
      links: "Links are about finding the best resources on the Internet and bookmarking them on Phourus. Links can be articles, images, podcasts or videos, but should relate to one of the 4 Elements of Phourus (Earth, Mind, Voice and Faith)."
      ideas: "Ideas are structured very similarly to Blogs, but should be used to share Ideas for solving simple or complex problems that individuals, organizations or even the world faces, and give them the exposure they deserve using the 'Influence' rank."
      events: "Events are a great way to share an upcoming seminar, conference or meetup with the Phourus community. Phourus encourages it's members to take it's virtual discussions into the real world, and has built the events section to do just that."
      
      #Earth
      checklist: "The Checklist is a simple yet powerful tool to reduce your negative impact on the Environment. Simply check off list items that you feel you meet the requirements for, save your results, and improve your results over time. Increase your Influence rank, decrease your consumption."
      calculator: "A Carbon Calculator is used to estimate how much Carbon Dioxide an individual creates throughout the year. With the Phourus Earth Carbon Calculator, you can save your results, compare them with other members, and even compare them to the Phourus community as a whole."
      matters: "Matters are a way to report both the good, the bad, and the ugly to the Phourus Community. Catch an organization doing wrong? Create a Matter. Catch somebody doing good? Create a Matter. Don't let anybody get away with anything, good or bad, and boost your Influence in return."
      companies: "Phourus has given environmentally-friendly Companies a chance to share their products, services and vision with a community that is passionate about the Environment. Qualified organizations can register as a Phourus Earth 'Company' to contribute to the Phourus Earth community."
      
      #Mind
      subjects: "The Subjects section is a place to learn, and a place to teach. Teachers, students and experts alike can create educational articles on subjects such as math, science and history. By using the Influence rank, the best educational materials will get the most visibility and thus rise to the top."
      questions: "Questions are an essential part of the learning process, and questions gone unanswered hinder comprehension. Phourus Mind 'Questions' exists to remove these obstacles by giving members an opportunity to ask the community any question holding them back."
      answers: "Questions need Answers, so to have one without the other would not be very useful on Phourus. Answers are for teachers, professors and experts to share their knowledge, answer other member's questions, and improve their own Influence all at the same time. "
      schools: "Schools gives educators a chance to contribute to the Phourus community as a regular member. Only individuals are allowed to sign up for Phourus, but Phourus Mind created the 'Courses' section for schools, universities and other educational institutions to contribute and become a part of Phourus."
      scores: "With Scores, members can create multiple-choice questions on a specific subject for other members to answer. The more questions answered correctly, the more points the member will have in that particular subject, which will improve their overall Influence rank."
      
      #Voice
      debates: "Debates are created by Phourus members for a local, state or national matter, and are automatically filtered by the user's zip code. This way, users only need to participate in Debates within their city, county and state, and cannot be influenced by users outside of that jurisdiction."
      bills: "Bills are Debates that have been sponsored by official Phourus Voice Representatives, called 'Reps'. Reps are actual politicians, either active or inactive, who believe in the Phourus vision and want to better connect with citizens through the Phourus Voice platform."
      votes: "When Debates are sponsored by Reps, they become a Bill, and an unofficial Vote is held on the matter. Citizens on Phourus living within that jurisdiction can review the Vote, read the commentary of the Rep sponsoring the Vote, and choose a simple Yes/No on the matter."
      govs: "Phourus users can apply for 'Representative' status, meaning that they are currently in office, or will be running for office in the near future. Approved Reps can elevate Debates into Votes, and can upgrade their account even further through add-ons such as video, contact forms and more."
      budgets: "Budgets are perhaps the most challenging part of a Government's job. A large budget puts too much of a burden on taxpayers, yet too small of a budget means giving up some of the benefits citizens take for granted. With Phourus Voice Budgets, you decide how to spend the money."
      
      #Self
      beliefs: "Beliefs are deep-rooted thoughts that can have a hard time finding their way into casual conversation. As a result, Phourus has created a dedicated place to share these thoughts. If you are an atheist, tell us why. If you are a Christian, tell us why. If you think the world is run by aliens, tell us why."
      quotes: "We aren't all great writers or poets. Sometimes it's best to let others do the talking for us. Phourus Self 'Quotes' is a place where you can post the Quotes that resonate most with you, and truly define your World View. Great for times when you need a little motivation too."
      timeline: "The Phourus Self Timeline is used to track the significant life experiences that led you to your current belief system. With the Phourus Self Timeline, you can share these experiences so others can see how these events made you the person you are today."
      groups: "Groups is a way to match members based on similar or dissimilar beliefs. By using Ranks, Phourus can get a good idea how a user and the Phourus community as a whole views the world. From there, individual users can be matched up based on this data using Phourus Faith Searching."
      ranks: "Ranks is an easy way to get a snapshot of a person's viewpoints and how they view the world. Each member can create up to 4 different Rank topics, such as 'Belief in a Higher Power', and select a number from -5 to +5 to describe how strongly they agree or disagree with the statement."

    states:  
      AK: "Alaska"
      AL: "Alabama"
      AR: "Arkansas"
      AZ: "Arizona"
      CA: "California"
      CO: "Colorado"
      CT: "Connecticut"
      DE: "Delaware"
      DC: "District of Columbia"
      FL: "Florida"
      GA: "Georgia"
      HI: "Hawaii"
      IA: "Iowa"
      ID: "Idaho"
      IL: "Illinois"
      IN: "Indiana"
      KS: "Kansas"
      KY: "Kentucky"
      LA: "Louisiana"
      MA: "Massachusetts"
      MD: "Maryland"
      ME: "Maine"
      MI: "Michigan"
      MN: "Minnesota"
      MS: "Mississippi"
      MO: "Missouri"
      MT: "Montana"
      NC: "North Carolina"
      ND: "North Dakota"
      NE: "Nebraska"
      NH: "New Hampshire"
      NJ: "New Jersey"
      NM: "New Mexico"
      NV: "Nevada"
      NY: "New York"
      OH: "Ohio"
      OK: "Oklahoma"
      OR: "Oregon"
      PA: "Pennsylvania"
      RI: "Rhode Island"
      SC: "South Carolina"
      SD: "South Dakota"
      TN: "Tennessee"
      TX: "Texas"
      UT: "Utah"
      VA: "Virginia"
      VT: "Vermont"
      WA: "Washington"
      WI: "Wisconsin"
      WV: "West Virginia"
      WY: "Wyoming"
      
    dropdown: (type, category) ->
      output = ""
      switch type
        when "privacy"
          output += "<select name=\"select_privacy\">"
          output += "<option value=\"0\">Only Me</option>"
          output += "<option value=\"1\">Friends Only</option>"
          output += "<option value=\"2\">Everyone</option>"
          output += "<option value=\"3\">Publish</option>"
          output += "</select>"
        when "scope"
          output += "<select name=\"select_scope\">"
          output += "<option value=\"local\">Local (City/Town)</option>"
          output += "<option value=\"state\">State</option>"
          output += "<option value=\"national\">National</option>"
          output += "</select>"
        when "difficulty"
          output += "<select name=\"select_difficulty\">"
          output += "<option value=\"easy\">Easy</option>"
          output += "<option value=\"medium\">Medium</option>"
          output += "<option value=\"hard\">Hard</option>"
          output += "</select>"
        when "date"
          output += "<select name=\"select_date\">"
          output += "<option value=\"2012\">2012</option>"
          output += "<option value=\"2011\">2011</option>"
          output += "<option value=\"2010\">2010</option>"
          output += "</select>"
        when "category"
          output += "<select name=\"select_category\">"
          output += "</select>"
        else
          output += "<select name=\"select_element\">"
          output += "<option value=\"earth\">Earth</option>"
          output += "<option value=\"voice\">Voice</option>"
          output += "<option value=\"mind\">Mind</option>"
          output += "<option value=\"faith\">Faith</option>"
          output += "</select>"
      output

    calculator: ->
      output = undefined
      output += "<table>"
      output += "<tr><td colspan=\"2\"><h2>Step 1. Basic</h2></td></tr>"
      output += "<tr><td><label>Individual</label></td><td><div class=\"checkbox\"></div></td></tr>"
      output += "<tr><td><label>Household</label></td><td><input type=\"text\" /></td></tr>"
      output += "<tr><td colspan=\"2\"><h2>Step 2. Electric</h2>"
      output += "<tr><td><label>Average Electric Bill</label></td><td><input type=\"text\" /></td></tr>"
      output += "<tr><td><label>Kilowatt Hour</label></td><td><input type=\"\" /></td></tr>"
      output += "<tr><td colspan=\"2\"><h2>Step 3. Heat</h2>"
      output += "<tr><td><label>Average Electric Bill</label></td><td><input type=\"text\" /></td></tr>"
      output += "<tr><td><label>Kilowatt Hour</label></td><td><input type=\"text\" /></td></tr>"
      output += "<tr><td colspan=\"2\"><h2>Step 4. Car</h2></td></tr>"
      output += "<tr><td><label>MPG</label></td><td><select><option>No Car</option><option>Less than 20 (Large)</option><option>20-30 (Mid-size)</option><option>30-40 (Small)</option><option>40+ (Hybrid)</option></select></td></tr>"
      output += "<tr><td><label>Average Annual Miles</label></td><td><input type=\"text\" /></td></tr>"
      output += "<tr><td colspan=\"2\"><h2>Step 5. Air</h2></td></tr>"
      output += "<tr><td><label>Hours of Flight</label></td><td><input type=\"text\" /></td></tr>"
      
      #output+= '<tr><td colspan="2"><h2>Step 6. Recycling</h2></td></tr>';
      output += "</table>"
      output

    
    #facebook('comments');
    checklist: ->
      list = new Array()
      list.push "Compost waste"
      list.push "Recycle paper and plastic"
      list.push "Properly dispose of electronic waste (TV, Computer, Batteries etc.)"
      list.push "Drive 25 MPG or higher vehicle"
      list.push "Drive 35 MPG or higher vehicle"
      list.push "Replace Incandescent Light Bulbs with CFLs (Compact Fluorescent Lamp)"
      list.push "Use Cold Water to wash clothes when possible"
      list.push "Purchase local meat, eggs and dairy"
      list.push "Minimize bottled water purchases by using reusable containers and purified tap water"
      list.push "Install a wind, solar or geothermal system"
      list.push "Make your own cleaning products"
      list.push "Plant a garden"
      list.push "Stop using reusable bags"
      list.push "Minimize time artificial light is on, use natural light"
      list.push "Pay as many bills online as possible"
      list.push "Unsubscribe to as much solicited or unsolicited mail as possible"
      list.push "Consider second-hand products from Craigslist, GiGoIt or Freecycle before buying new"
      list.push "Use a clothesline to dry your clothes instead of a dryer"
      list.push "Use cloth instead of paper towels and napkins"
      list.push "Use smart power strips"
      list.push "Minimize printing"
      list.push "Eliminate or reduce work commute"
      list.push "Be conservative with heat and air conditioning"
      list.push "Install low-flow faucets"
      list.push "Install low-flow shower heads"
      list.push "Install low-flow toilets"
      list.push "Use library instead of buying books and DVDs"
      list.push "Purchase and return Give Certificates™"
      list.push "Use native plants for landscaping"
      list.push "Turn car off if idle for more than 1 minute"
      list.push "Repurpose plastic containers, glass jars and other packaging"
      list.push "Neutralize your carbon footprint"
      list.push "Buy eco-friendly products"
      list.push "Buy eco-friendly appliances"
      output = undefined
      output += "<table id=\"checklist\">"
      output += "<colgroup><col style=\"background-color:#eee; border-right: solid 8px #aaa;\"></col><col style=\"background-color: #fff;\" /></colgroup>"
      output += "<tfoot><tr><td colspan=\"2\"></td></tr></tfoot>"
      i = 0
      value = undefined
      value = "44%"  if view is "community"
      for row of list
        i++
        value = "<div class=\"checkbox on\" id=\"c" + i + "\"></div>"
        output += "<tr><td>" + value + "</td><td><span style=\"text-align:left; color: #555;\">" + i + ". " + list[row] + "</span></td></tr>"
      output += "</table>"
      
      #facebook('comments'); 
      output
  )
  new mTypes()
