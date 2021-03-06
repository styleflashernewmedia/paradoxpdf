{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=utf8?*}
{set-block variable=$xhtml}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
{******************************************************************
  We include print-core.css file to set page settings :size,margin :
  You can override it on your own design...
  Then you can include your proper CSS files, no constraints, just
  have to be valid css file and declared for print media
  avoid using "@import url" here use the <link> tag instead.
 ******************************************************************}
<link rel="stylesheet" type="text/css" href={"stylesheets/print-core.css"|ezdesign} media="print,screen"></link>

{* Uncomment the folowing code to test and enable pdf bookmarks*}
{*include uri="design:includes/paradoxpdf_bookmarks.tpl"*}
<title></title>
</head>
<body>
{* Put the header contents in the folowing Div element so it well be
   present on all page on multipage context. You can remove "ParadoxPDF"*}
<div id="header">ParadoxPDF</div>

{* The footer will be automatically placed at the end of each page*}
<div id="footer"><span id="pagenumber"/> / <span id="pagecount"/> </div>

{* Uncomment the folowing code to test and enable TOC Table of content*}
{*include uri="design:includes/paradoxpdf_toc.tpl"*}
{$module_result.content}
</body>
</html>
{/set-block}

{* Folowing Avoid printing debug on pdf files when debug enabled*}
<!-- DEBUG_REPORT -->

{*******************************************************************************************************
  You can tweak the pdf cache just as a template cache-block it's
  based on the same mecanisme. So for more information please refere
  to online documentation :
  http://ez.no/doc/ez_publish/technical_manual/4_0/reference/template_functions/miscellaneous/cache_block

  Usage :
        -Full : paradoxpdf(hash('xhtml',$xhtml,
                                'pdf_file_name',$pdf_file_name,
                                'keys',$keys,
                                'subtree_expiry',$subtree_expiry,
                                'expiry',$expiry ,
                                'ignore_content_expiry',$ignore_content_expiry))
        -Minium : paradoxpdf(hash('xhtml',$xhtml))

  Parameters :
        $xhtml : (required)
        $pdf_file_name : just the name (without .pdf extension) that will be assigned
                         to generated file during download if not given "file.pdf" will
                         be used
        $keys, $subtree_expiry, $expiry , $ignore_content_expiry : controls cache
                         (see cache-block documentation)

  Example :

  {def  $pdf_file_name  = $module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0]
        $keys           = array($uri_string,$current_user.contentobject_id)
        $subtree_expiry = $module_result.node_id
        $expiry         = 6000
        $ignore_content_expiry=false()

        $paradoxpdf_params= hash('xhtml', $xhtml,
                                 'pdf_file_name',$pdf_file_name,
                                 'keys', $keys,
                                 'subtree_expiry', $subtree_expiry,
                                 'expiry',$expiry ,
                                 'ignore_content_expiry',$ignore_content_expiry)}

*******************************************************************************************************}

{def $paradoxpdf_params = hash('xhtml', $xhtml,
                               'pdf_file_name',$module_result.content_info.url_alias|explode('/')|reverse|extract(0)[0],
                               'subtree_expiry',$module_result.node_id )

}

{paradoxpdf($paradoxpdf_params)}