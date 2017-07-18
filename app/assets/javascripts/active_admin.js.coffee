#= require active_admin/base
#= require tinymce
#= require tinymce-jquery
if location.pathname == "/admin/blogs/new"
  tinyMCE.init selector: 'textarea'
