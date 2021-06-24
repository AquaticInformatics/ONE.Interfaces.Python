
mkdir -Force ./claros_interfaces_python

Copy-Item ./python/* ./claros_interfaces_python
mkdir -Force ././claros_interfaces_python/claros_interfaces
Copy-Item ./claros.interfaces.protocolbuffers/proto/flat/out/python/*.* ./claros_interfaces_python/claros_interfaces
Move-Item -Force ./claros_interfaces_python/__init__.py ./claros_interfaces_python/claros_interfaces
Copy-Item -Force ./claros_interfaces_python/claros_interfaces.pth ./claros_interfaces_python/claros_interfaces

Set-Location ./claros_interfaces_python

# Make a source package
$Command = "python setup.py clean build sdist"
Write-Output `n$Command
Invoke-Expression -Command $Command

# Make a binary package
$Command = "python setup.py clean build bdist_wheel"
Write-Output `n$Command
Invoke-Expression -Command $Command

# In the claros.interfaces.python/dist directory will be the source tarball and the binary wheel file

# Stop-Transcript
Set-Location ..\
