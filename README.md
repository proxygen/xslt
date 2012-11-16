xslt
====
* 1 - PowerShell

```dos
(get-content designerNavInner.xml) | foreach-object {$_ -replace '<img src="/static/images/collapse.gif" border="0">', '<img src="/static/images/collapse.gif" border="0" />'} | set-content in.xml
```
