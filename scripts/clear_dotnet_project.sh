# Bash
find . -iname "bin" -o -iname "obj" | xargs rm -rf
# Powershell (.ps1)
Get-ChildItem .\ -include bin,obj -Recurse | foreach ($_) { remove-item $_.fullname -Force -Recurse }