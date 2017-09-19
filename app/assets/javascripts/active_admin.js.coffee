#= require active_admin/base
#= require tinymce
#= require tinymce-jquery
#= require bootstrap/dropdown
#= require bootstrap-select

regexp = /^\/admin\/blogs\/\d+\/edit$/
if location.pathname == "/admin/blogs/new" || regexp.test(location.pathname)
  tinyMCE.init selector: 'textarea'

tinyMCE.init selector: '.tinyMCE'
