# TO-DO: Save the output of Get-Help with all these commands :)

Set-Location ~                                  # cd
Get-ChildItem                                   # dir || ls
New-Item -ItemType Directory testAsir           # mkdir
    Set-Location testAsir

New-Item helloWorld.txt
Write-Output "Hello, World!" > helloWorld.txt   # echo
Get-Content helloWorld.txt                      # type || cat
Copy-Item helloWorld.txt copyWorld.txt          # cp
Rename-Item copyWorld.txt deleteCopy.txt        # mv
Move-Item deleteCopy.txt ..
Remove-Item ../deleteCopy.txt                   # rm

attrib helloWorld.txt
Start-Process https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/attrib

Set-Location ..
Remove-Item testAsir -recurse


<#
- New-Item -ItemType Directory -Path "C:\Some\Path\That\Doesnt\Exist" -Force
- Get-ChildItem C:\Some\Directory -ErrorAction Stop || Write-Host "An error occurred"
#>