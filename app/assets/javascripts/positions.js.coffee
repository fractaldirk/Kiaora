# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

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
