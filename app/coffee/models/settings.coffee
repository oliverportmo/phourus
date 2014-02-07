define ["jquery", "underscore", "backbone"], ($, _, Backbone) ->
  mSettings = Backbone.Model.extend(defaults:
    search: ""
    types: "blogs;events;subjects;questions;debates;bills;beliefs;timeline;quotes"
    mode: "phourus"
    org_id: 0
    user_id: 0
    sort: "influence"
    direction: "DESC"
    page: 0
    limit: 10
  )
  new mSettings()
