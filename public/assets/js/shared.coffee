$(->
  $('a[data-link-type=delete]').click(->
    $(this).parent().submit()
  )
)