define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  mSettings = Backbone.Model.extend(defaults:
    debug: false
    sort: "influence"
    direction: "DESC"
    type: "stream"
    mode: "phourus"
    org_id: 0
    search: ""
    page: 0
    limit: 10
    types: "blogs;events;subjects;questions;answers;debates;bills;votes;beliefs;timeline;quotes"
  )
  new mSettings()
