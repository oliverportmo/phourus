define ["jquery", "underscore", "backbone", "js/modules/stream/models/comment", "js/models/session", "js/models/settings"], ($, _, Backbone, mComment, mSession, mSettings) ->
  collection = Backbone.Collection.extend(
     
    #model: mComment
      
    url: ->
      url = "/rest/comment/?post_id=" + @post_id
      url

    idAttribute: "id"
  )
  collection
