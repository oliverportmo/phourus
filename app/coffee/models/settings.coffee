define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  mSettings = Backbone.Model.extend(defaults:
    debug: false
    sort: "influence"
    direction: "DESC"
    type: "stream"
    mode: "phourus"
    page: 0
    limit: 10
    types: "blogs;ideas;links;events;calculator;checklist;matters;companies;subjects;questions;answers;teachers;debates;bills;votes;reps;beliefs;ranks;timeline;searching"
  )
  new mSettings()
