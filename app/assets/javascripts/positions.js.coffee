# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $.widget "custom.combobox",
    _create: ->
      @wrapper = $("<span>").addClass("custom-combobox").insertAfter(@element)
      @element.hide()
      @_createAutocomplete()
      @_createShowAllButton()

    _createAutocomplete: ->
      selected = @element.children(":selected")
      value = (if selected.val() then selected.text() else "")
      @input = $("<input>").appendTo(@wrapper).val(value).attr("title", "").addClass("custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left").autocomplete(
        delay: 0
        minLength: 0
        source: $.proxy(this, "_source")
      ).tooltip(tooltipClass: "ui-state-highlight")
      @_on @input,
        autocompleteselect: (event, ui) ->
          ui.item.option.selected = true
          @_trigger "select", event,
            item: ui.item.option


        autocompletechange: "_removeIfInvalid"


    _createShowAllButton: ->
      input = @input
      wasOpen = false
      $("<a>").attr("tabIndex", -1).attr("title", "Show All Items").tooltip().appendTo(@wrapper).button(
        icons:
          primary: "ui-icon-triangle-1-s"

        text: false
      ).removeClass("ui-corner-all").addClass("custom-combobox-toggle ui-corner-right").mousedown(->
        wasOpen = input.autocomplete("widget").is(":visible")
      ).click ->
        input.focus()

        # Close if already visible
        return  if wasOpen

        # Pass empty string as value to search for, displaying all results
        input.autocomplete "search", ""


    _source: (request, response) ->
      matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i")
      response @element.children("option").map(->
        text = $(this).text()
        if @value and (not request.term or matcher.test(text))
          label: text
          value: text
          option: this
      )

    _removeIfInvalid: (event, ui) ->

      # Selected an item, nothing to do
      return  if ui.item

      # Search for a match (case-insensitive)
      value = @input.val()
      valueLowerCase = value.toLowerCase()
      valid = false
      @element.children("option").each ->
        if $(this).text().toLowerCase() is valueLowerCase
          @selected = valid = true
          false


      # Found a match, nothing to do
      return  if valid

      # Remove invalid value
      @input.val("").attr("title", value + " didn't match any item").tooltip "open"
      @element.val ""
      @_delay (->
        @input.tooltip("close").attr "title", ""
      ), 2500
      @input.data("ui-autocomplete").term = ""

    _destroy: ->
      @wrapper.remove()
      @element.show()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    $(".combobox").combobox()

  $(document).on "focus", "#combobox", ->
    $(".combobox").combobox

  $(".combobox").combobox()

  $('#conceptuals').sortable(
    axis: 'y'
    handle: '.chandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#implementations').sortable(
    axis: 'y'
    handle: '.ihandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#supports').sortable(
    axis: 'y'
    handle: '.shandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#compliances').sortable(
    axis: 'y'
    handle: '.comhandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#functionals').sortable(
    axis: 'y'
    handle: '.cphandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#methods').sortable(
    axis: 'y'
    handle: '.cphandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#leaderships').sortable(
    axis: 'y'
    handle: '.cphandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#socials').sortable(
    axis: 'y'
    handle: '.cphandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#attitudes').sortable(
    axis: 'y'
    handle: '.ahandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );

  $('#conditions').sortable(
    axis: 'y'
    handle: '.conhandle'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  );
