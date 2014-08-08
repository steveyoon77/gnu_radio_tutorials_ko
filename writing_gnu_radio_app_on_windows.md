# <a name="introduction"><a>Introduction

이 문서는 윈도에서 PyQt4를 이용하여 GNU Radio application을 작성하는 방법에 대해서 정리합니다.

# <a name="dependancy"></a>

PyQt를 이용한 GNU Radio GUI 응용 프로그램을 개발하기 위해서 미리 설치해야 하는 소프트웨어들이 있습니다.

## <a name="installing-python27"></a>Installing Python 2.7

파이썬은 [여기](https://www.python.org/downloads/)에서 미리 빌드된 바이너리를 다운 받아서 설치할 수 있습니다. 파이썬 2.7.x 버전과 3.x 버전이 있는데, 우리는 편의를 위해 파이썬 2.7.x 버전을 사용하겠습니다. **파이썬 설치 후 시스템 환경 변수의 Path에 C\:\\Python27\\을 추가하고 PYTHONPATH라는 변수 이름으로 C\:\\Python27\\Lib를 등록합니다.**

## <a name="installing-wxpython"></a>Installing wxPython

wxPython은 [여기](http://wxpython.org/download.php#msw)에서 다운 받을 수 있습니다. 파이썬 2.7.x를 위한 wxPython을 찾아서 설치해야만 합니다.

## <a name="installing-gnu-radio"></a>Installing GNU Radio

파이썬과 wxPython가 모두 설치되었으면 다음은 GNU Radio를 설치합니다. 이것으로 wxPython를 import 할 모듈이 설치됩니다. 윈도를 위해 미리 빌드된 바이너리는 [여기](http://files.ettus.com/binaries/gnuradio/)에서 다운 받을 수 있습니다. **latest_stable** 디렉토리에서 **gnuradio\_x.x.x.x\_Win32.exe**파일을 다운로드 받으시면 됩니다.

다운받은 파일을 실행시키면 라이선스 확인을 한 뒤, 시스템 패쓰 설정을 합니다. 시스템의 모든 사용자를 위해 패쓰를 추가한다~Add GNU Radio to the system PATH for all users~고 체크 한 뒤 다음으로 진행하겠습니다. 설치 폴터를 정하고 \(저는 C:\\gnuradio로 하겠습니다.\)

## <a name="installing-rtl-sdr"></a>Installing RTL SDR

우리가 사용할 디바이스는 RTL이므로 RTL-SDR 소프트웨어도 설치합니다. [여기](http://sdr.osmocom.org/trac/attachment/wiki/rtl-sdr/RelWithDebInfo.zip)에서 미리 빌드된 바이너리를 다운받을 수 있습니다.
다운로드 받은 파일의 압축을 C\:\\rtl-sdr-release에 풉니다. 

압축을 푼 뒤, 시스템 환경 변수에 32비트 시스템이면 C\:\\rtl-sdr-release\\x32를, 64비트 시스템이면 C\:\\rtl-sdr-release\\x64를 Path에 추가합니다.

## <a name="installing-rtl-sdr-py-wrapper">Installing RTL SDR Python wrapper

파이썬에서 RTL-SDR을 호출할 것이기 때문에 앞서 설치한 RTL-SDR 라이브러리의 파이썬 wrapper가 필요합니다. [여기](https://github.com/roger-/pyrtlsdr)에서 다운받을 수 있습니다.

설치는 github에서 소스를 다운 받은 뒤, 아래와 같이 설치할 수 있습니다.

    > python setup.py install
	running install
	running build
	running build_py
	creating build
	creating build\lib
	creating build\lib\rtlsdr
	copying rtlsdr\helpers.py -> build\lib\rtlsdr
	copying rtlsdr\librtlsdr.py -> build\lib\rtlsdr
	copying rtlsdr\rtlsdr.py -> build\lib\rtlsdr
	copying rtlsdr\__init__.py -> build\lib\rtlsdr
	running install_lib
	creating C:\Python27\Lib\site-packages\rtlsdr
	copying build\lib\rtlsdr\helpers.py -> C:\Python27\Lib\site-packages\rtlsdr
	copying build\lib\rtlsdr\librtlsdr.py -> C:\Python27\Lib\site-packages\rtlsdr
	copying build\lib\rtlsdr\rtlsdr.py -> C:\Python27\Lib\site-packages\rtlsdr
	copying build\lib\rtlsdr\__init__.py -> C:\Python27\Lib\site-packages\rtlsdr
	byte-compiling C:\Python27\Lib\site-packages\rtlsdr\helpers.py to helpers.pyc
	byte-compiling C:\Python27\Lib\site-packages\rtlsdr\librtlsdr.py to librtlsdr.pyc
	byte-compiling C:\Python27\Lib\site-packages\rtlsdr\rtlsdr.py to rtlsdr.pyc
	byte-compiling C:\Python27\Lib\site-packages\rtlsdr\__init__.py to __init__.pyc
	running install_egg_info
	Writing C:\Python27\Lib\site-packages\pyrtlsdr-0.1.1-py2.7.egg-info

설치가 완료되면 시스템 환경 변수의 Path에 C\:\\Python27\\Lib\\site-packages\\rtlsdr를 추가해 줍니다.

[msvcr100.dll](http://ksrin.tistory.com/attachment/cfile25.uf@1555A348505DE9A82A51AB.dll) 또는 [msvcp100.dll](http://ksrin.tistory.com/attachment/cfile22.uf@206C5248505DE9AB0F3148.dll)이 없어서 오류가 발생할 수 있습니다. 그러면 이 파일들을 C\:\\Windows\\system32에 넣으시면 됩니다.

## <a name="installing-matplotlib"></a>Installing matplotlib
각종 그래프를 그리기 위해 [matplotlib](http://matplotlib.org/downloads.html)를 설치합니다. 링크로 연결된 곳에 가서 python 2.7.x.x에 해당하는 matplotlib를 다운받아 설치합니다.

## <a name="installing-pip"></a>Installing pip
파이썬 모듈 설치를 위해 제공되는 툴입니다. 

먼저 [get-pip.py](https://bootstrap.pypa.io/get-pip.py)를 다운받습니다. 저는 C\:\\Python27에 다운받았습니다.

	PS C:\Python27> python get-pip.py
	Downloading/unpacking pip
	Downloading/unpacking setuptools
	Installing collected packages: pip, setuptools
	Successfully installed pip setuptools
	Cleaning up...

다운로드 한 뒤에는 위와 같이 get-pip.py를 python 명령으로 실행하여 설치할 수 있습니다.

이제 pip를 이용하여 파이썬 모듈을 설치 할 수 있습니다.

### <a name="installing-dateutil-module"></a> Installing dateutil module

파이썬 모듈 중 하나인 dateutil을 설치합니다.

	PS C:\Python27> python -m pip install python-dateutil
	Downloading/unpacking python-dateutil
	  Running setup.py (path:c:\users\b10013~1.myt\appdata\local\temp\pip_build_b100
	133\python-dateutil\setup.py) egg_info for package python-dateutil

	Downloading/unpacking six (from python-dateutil)
	  Downloading six-1.7.3-py2.py3-none-any.whl
	Installing collected packages: python-dateutil, six
	  Running setup.py install for python-dateutil

	Successfully installed python-dateutil six
	Cleaning up...

### <a name="installing-pyparsing-module"></a>Installing pyparsing module

파이썬 모듈 중 하나인 pyparsing을 설치합니다.

	PS C:\Python27\Tools> python -m pip install pyparsing
	Downloading/unpacking pyparsing
	  Running setup.py (path:c:\users\b10013~1.myt\appdata\local\temp\pip_build_b100133\pyparsing\setup.py) egg_info for pac
	kage pyparsing

	Installing collected packages: pyparsing
	  Running setup.py install for pyparsing

	Successfully installed pyparsing
	Cleaning up...

### <a name="installing-numpy-module"></a>Installing numpy module

파이썬 모듈 중 하나인 numpy를 설치합니다.

    PS C:\Python27\Tools> python -m pip install numpy

이렇게 pip로 설치할 경우 시간이 오래 걸릴 수도 있습니다. 그것이 싫은 사람은 [numpy](http://sourceforge.net/projects/numpy/files/NumPy)를 아래 사이트에서 받아서 설치 할 수도 있습니다. windows version은 바로 python에 lib 폴더로 들어가도록 되어 있습니다.

