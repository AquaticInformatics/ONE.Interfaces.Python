
mkdir -Force ./one_interfaces_python

Copy-Item ./python/* ./one_interfaces_python
mkdir -Force ././one_interfaces_python/one_interfaces
Copy-Item ./../../one.interfaces.protocolbuffers/proto/flat/out/python/*.* ./one_interfaces_python/one_interfaces
Move-Item -Force ./one_interfaces_python/__init__.py ./one_interfaces_python/one_interfaces
Copy-Item -Force ./one_interfaces_python/one_interfaces.pth ./one_interfaces_python/

Set-Location ./one_interfaces_python


# Make a source package
$Command = "python setup.py clean build"
Write-Output `n$Command
Invoke-Expression -Command $Command
Copy-Item -Force ./converter.py ./build/lib/one_interfaces
Set-Location ./build/lib/one_interfaces
$Command = "python converter.py"
Write-Output `n$Command
Invoke-Expression -Command $Command
Move-Item converter.py ../..
Set-Location ../../../

$Command = "python setup.py sdist"
Invoke-Expression -Command $Command
# Make a binary package
$Command = "python setup.py clean build"
Write-Output `n$Command
Invoke-Expression -Command $Command
Set-Location ./build/lib/one_interfaces
$Command = "python converter.py"
Invoke-Expression -Command $Command
Move-Item converter.py ../..
Set-Location ../../../
$Command = "python setup.py bdist_wheel"
Invoke-Expression -Command $Command
# In the one.interfaces.python/dist directory will be the source tarball and the binary wheel file

# Stop-Transcript
Set-Location ..\
