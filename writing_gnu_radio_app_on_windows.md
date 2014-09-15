% Writing Python GUI program

# <a name="introduction"><a>Introduction

이 문서는 윈도에서 wxPython을 이용하여 GNU Radio application을 작성하는 방법에 대해서 정리합니다.

# <a name="dependancy"></a>

wxPython을 이용한 GNU Radio GUI 응용 프로그램을 개발하기 위해서 미리 설치해야 하는 소프트웨어들이 있습니다.

## <a name="installing-python27"></a>Installing Python 2.7

파이썬은 [여기](https://www.python.org/downloads/)에서 미리 빌드된 바이너리를 다운 받아서 설치할 수 있습니다. 파이썬 2.7.x 버전과 3.x 버전이 있는데, 우리는 편의를 위해 파이썬 2.7.x 버전을 사용하겠습니다. **파이썬 설치 후 시스템 환경 변수의 Path에 C\:\\Python27\\을 추가하고 PYTHONPATH라는 변수 이름으로 C\:\\Python27\\Lib를 등록합니다.**

## <a name="installing-wxpython"></a>Installing wxPython

wxPython은 [여기](http://wxpython.org/download.php#msw)에서 다운 받을 수 있습니다. 파이썬 2.7.x를 위한 wxPython을 찾아서 설치해야만 합니다.

## <a name="installing-gnu-radio"></a>Installing GNU Radio

파이썬과 wxPython가 모두 설치되었으면 다음은 GNU Radio를 설치합니다. 이것으로 wxPython를 import 할 모듈이 설치됩니다. 윈도를 위해 미리 빌드된 바이너리는 [여기](http://files.ettus.com/binaries/gnuradio/)에서 다운 받을 수 있습니다. **latest_stable** 디렉토리에서 **gnuradio\_x.x.x.x\_Win32.exe**파일을 다운로드 받으시면 됩니다.

다운받은 파일을 실행시키면 라이선스 확인을 한 뒤, 시스템 패쓰 설정을 합니다. 시스템의 모든 사용자를 위해 패쓰를 추가한다~Add GNU Radio to the system PATH for all users~고 체크 한 뒤 다음으로 진행하겠습니다. 설치 폴터를 정하고 \(저는 C:\\gnuradio로 하겠습니다.\) 설치합니다. 설치가 완료되면 C\:\\gnuradio\\lib\\site-packages 디렉토리 안의 모든 디렉토리를 C\:\\Python27\\Lib\\site-packages에 복사합니다.

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

### <a name="installing-pyserial"></a>Installing pyserial

[RTL SDR Scanner](https://github.com/EarToEarOak/RTLSDR-Scanner)를 테스트 해보기 위해 필요한 종속적인 모듈 라이브러리입니다.

### <a name="installing-numpy-module"></a>Installing numpy module

파이썬 모듈 중 하나인 numpy를 설치합니다.

    PS C:\Python27\Tools> python -m pip install numpy

이렇게 pip로 설치할 경우 시간이 오래 걸릴 수도 있습니다. 그것이 싫은 사람은 [numpy](http://sourceforge.net/projects/numpy/files/NumPy)를 아래 사이트에서 받아서 설치 할 수도 있습니다. windows version은 바로 python에 lib 폴더로 들어가도록 되어 있습니다.

## <a name="installing-scipy"></a>Installing SciPy

[여기](http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy)에서 파이썬 2.7.x.x에 맞는 바이너리를 다운로드 받아서 설치합니다. 저는 [Scipy-stack](http://www.lfd.uci.edu/~gohlke/pythonlibs/#scipy-stack)을 다운로드 받아서 설치했습니다.

# <a name="python-wxpython-seminar"></a>Python-wxPython Seminar
![파이썬 프로그래밍](python/images/python-wxpython/slide-1.jpg)\

이 장에서는 제가 회사에서 세미나를 했던 내용을 정리합니다.

## <a name="title-of-content"></a>차례
![차례](python/images/python-wxpython/slide-2.jpg)\

세미나의 순서는 파이썬 문법, 파이썬 프로그래밍 실습, wxPython을 이용한 GUI 프로그래밍에 대해서 기술합니다.

## <a name="do-it-yourself"></a>Do it yourself
![DIY](python/images/python-wxpython/slide-3.jpg)\

파이썬을 공부하기 시작한지 3주가 지난 지금, 파이썬은 아주 어렵지도 그렇다고 아주 쉽지도 않은 그런 프로그래밍 언어라는 생각이 들었습니다.
그래서 줏어 먹기로 이 스크립트 언어를 배우겠구나 생각하는 것은 잘못되었다는 것을 알았고, 또 해보지도 않고 지레 겁 먹을 필요도 없다고 생각했습니다.
결국 직접 해보는 수 밖에 없습니다.

이 세미나는 여러분이 파이썬을 직접 다룰 수 있게 3주 동안 제가 삽질하며 얻은 지식들을 공유하는 세미나가 될 것 입니다.
그래서 “Python in a nutshell”과 같이 파이썬을 깊이 파고들지 않고 제가 했던 혼자서 파이썬을 공부하는 방법에 대한 논의를 하고자 합니다.
물론 저와 다른 방식으로 공부하실 수도 있고, 제가 한 방식이 비효율적일 수도 있습니다.
다만 여러분이 여러분의 방식으로 파이썬을 공부할 때 제가 삽질한 경험이 도움이 되길 바랍니다.

## <a name="python-syntax"></a>Python 문법
![Python Syntax](python/images/python-wxpython/slide-4.jpg)\

그럼 먼저 파이썬 문법에 대해서 정리를 하겠습니다. 

### <a name="python-conceptual-hierarchy"></a>Python의 개념적인 계층
![Python Conceptual Hierarchy](python/images/python-wxpython/slide-5.jpg)\

파이썬은 프로그램, 모듈, 구문(statement), 표현(expression), 객체(object)의 개념이 계층적으로 구성되어 있습니다.
프로그램은 모듈들의 집합이고, 모듈은 구문들로 구성되어 있으며, 구문(statement)은 표현(expression)으로 이루어져 있고, 표현(expression)은 객체(object)를 생성하고 처리합니다.

여기에서 객체(object)라는 개념에 대한 설명이 혼란스러운데, “Learning Python 5E(오라일리)” 책의 p.93에 있는 내용에 있는 것을 일부만 그대로 가져와서 그렇습니다. 제가 이해하기로는 일반적인 C/C++ 개발자들을 배려해서 “객체=자료구조”로서 설명하는 것 같습니다.

### <a name="core-object-types"></a>Core Object Types
![Core Object Types](python/images/python-wxpython/slide-6.jpg)\

파이썬의 핵심 객체 타입은 이 표와 같습니다. 숫자, 문자열, 그리고 몇몇 데이터 타입들과 사용자 정의 객체들이 있습니다. 각 객체들은 C++을 설명하는 많은 책에서 말하는 메소드와 멤버 변수들을 속성으로 갖고 있습니다. 속성들은 파이썬 언어에서 built-in으로 제공되는 속성도 있고, 써드 파티나 개별 개발자들이 확장한 속성도 있습니다. 속성에 접근하기 위해서 '.'를 사용합니다.

    객체이름.속성-메소드(인자)

속성을 이용하는 방법은 위와 같습니다.

### <a name="escape-characters"></a>Escape characters
![Escape characters](python/images/python-wxpython/slide-7.jpg)\
파이썬에서도 특수 문자가 있습니다. 위의 도표는 파이썬에서 사용하는 특수 문자들의 목록을 보입니다.

### <a name="list-type"></a>List
![List](python/images/python-wxpython/slide-8.jpg)\

리스트는 C/C++에서 배열과 비슷합니다. 다만, 배열은 같은 타입의 데이터만 저장이 가능한 반면 리스트는 그러한 제한이 없습니다. 리스트 객체에도 속성이 있습니다. 이 속성을 이용하여 리스트의 기능을 이용할 수 있습니다.

### <a name="dictionary-type"></a>Dictionary
![Dictionary](python/images/python-wxpython/slide-9.jpg)\

Dictionary는 **'키':'값'**의 목록입니다. Dictionary의 '값'은 리스트처럼 순서를 가리키는 숫자로 찾지 않고 '키'로 찾습니다. 

### <a name="tuple-type"></a>Tuple
![Tuple](python/images/python-wxpython/slide-10.jpg)\
파이썬에는 읽기 전용 리스트인 튜플이라는 데이터 형이 있습니다.

### <a name="getting-help"></a>Getting help
객체들의 속성들에 대해서는 직접 찾아서 확인할 수 있습니다.

![dir function](python/images/python-wxpython/slide-11.jpg)\

dir 함수의 이름은 **dir**ectory(목록)에서 왔습니다. dir 함수를 이용하여 객체의 속성을 볼 수 있습니다. dir 함수는 built-in 함수로 파이썬 언어에 내장되어 있습니다.

![help function](python/images/python-wxpython/slide-12.jpg)\

help 함수는 dir 함수로 확인한 메소드의 도움말을 볼 수 있습니다.

### <a name="python-statements"></a>Statements
![Statements-1](python/images/python-wxpython/slide-13.jpg)\
![Statements-2](python/images/python-wxpython/slide-14.jpg)\

파이썬의 statement는 코드를 이루는 뼈대와 살 중 살과 같습니다. 위의 슬라이드에서는 파이썬의 statement들에 대해서 정리하고 있습니다.

### <a name="condition-statements"></a>Conditional statements
![Conditional Statements](python/images/python-wxpython/slide-15.jpg)\

파이썬 프로그래밍에서 조건 제어의 방법은 여러가지가 있을 수 있습니다. 속성을 이용한 선택 제어가 있을 수 있고, 다른 프로그래밍 언어와 같이 **if/elif/else** statement를 사용할 수도 있습니다.

### <a name="while-loops"></a>while loops
![while loops](python/images/python-wxpython/slide-16.jpg)\

위의 슬라이드 예제에서 **print('\*'),**을 보면 문장 마지막에 ','가 있습니다. 이것은 print 함수를 호출할 때 자동으로 붙는 개행 문자를 없애주는 것을 의미합니다.

### <a name="for-loops"></a>for loops
![for loops](python/images/python-wxpython/slide-17.jpg)\

위의 슬라이드 예제에서 **range 함수**는 아래와 같은 도움말을 가지고 있습니다
.

    help(range)
    Help on built-in function range in module __builtin__:
    
    range(...)
        range(stop) -> list of integers
        range(start, stop[, step]) -> list of integers
        
        Return a list containing an arithmetic progression of integers.
        range(i, j) returns [i, i+1, i+2, ..., j-1]; start (!) defaults to 0.
        When step is given, it specifies the increment (or decrement).
        For example, range(4) returns [0, 1, 2, 3].  The end point is omitted!
        These are exactly the valid indices for a list of 4 elements.

설명에 따르면 range 함수는 정수의 리스트를 리턴합니다. 그래서 for statement에서 in 뒤의 리스트 객체가 오면 그 객체의 개수만큼 반복한 다는 것을 알 수 있습니다.

### <a name="python-function"></a>Function
![Function](python/images/python-wxpython/slide-18.jpg)\

함수를 정의할 때는 **def** 키워드를 사용합니다.

### <a name="python-generator"></a>Generator
![Generator](python/images/python-wxpython/slide-19.jpg)\

Generator는 조금 독특한 느낌이 드는 기능입니다. 어떤 키워드를 말하는 것도 아니고, 어떤 함수에 속한 기능을 이야기 합니다. 다시 말해서 Generator 함수를 Iterator 함수라고도 부르는 것 같습니다.[^1]

[^1]: 여러 인터넷 문서와 책에서 Generator 함수와 Iterator 함수는 같은 의미로도 쓰이고 따로따로 쓰이기도 하는 것 같다고 느꼈습니다.

위 슬라이드의 예제에서 보이다 시피, **yield**로 지정된 변수를 생성하여 정적으로 다루어지는 경우 Generator라고 부르고 그런 기능을 포함한 함수를 Generator 함수라고 부릅니다. 그리고 이 기능의 동작이 마치 iterator와 같아서 iterator 함수로도 부르는 것 같습니다.

### <a name="python-scope"></a>Scope
![Scope](python/images/python-wxpython/slide-20.jpg)\

파이썬에서 심볼을 참조 할 수 있는 범위를 말하는 scope는 위의 슬라이드의 그림과 같습니다.[^2]

[^2]: 범위에 대한 예제가 필요한 것 같습니다.

### <a name="class-object"></a>Class object
![Class object](python/images/python-wxpython/slide-21.jpg)\

**class** 키워드를 붙여서 클래스를 정의합니다. 이 예제에서는 클래스에 **__init__** 재정의만 들어있습니다. **__init__**의 도움말을 보면 아래와 같습니다.

    help(object.__class__.__init__)
    Help on wrapper_descriptor:

    __init__(...)
        x.__init__(...) initializes x; see help(type(x)) for signature

**__init__**은 object 객체의 __class__ 속성의 속성인 메소드입니다. 이 built-in 메소드를 재정의합니다. 이러면 클래스의 인스턴스가 만들어질 때 **__init__**이 호출되어 인스턴스의 멤버 변수를 초기화 할 수 있습니다.[^3]

[^3]: 클래스와 인스턴스에 대해서는 따로 정리하지 않습니다.

class의 인스턴스에 접근하기 위해서 **self**를 **__init__** 메소드의 첫번째 인자로 사용한 것에 주의하시길 바랍니다. 인스턴스의 멤버 변수를 클래스의 메소드에서 접근하기 위해 **self**를 사용하게 됩니다.

### <a name="class-method"></a>Class method
![Class method](python/images/python-wxpython/slide-22.jpg)\

클래스의 메소드 정의는 위의 예와 같이 **class** 정의 안에 함수 정의를 하면 됩니다. 클래스 메소드에 리턴하는 값이 있으면 **return** 키워드를 쓰고 그렇지 않으면 안쓰면 됩니다.

### <a name="class-attribute-overloading"></a>Class attribute overloading
![Class attribute overloading](python/images/python-wxpython/slide-23.jpg)\

슬라이드의 예제에서 **__init__**을 재정의했듯이 **__repr__**를 재정의합니다.

### <a name="class-inheritance"></a>클래스 상속
![클래스 상속](python/images/python-wxpython/slide-24.jpg)\

클래스 객체의 상속은 객체 정의에 부모 클래스의 이름을 넣기만 하면 됩니다.

### <a name="static-class-method"></a>Static and Class method
![Static and Class method](python/images/python-wxpython/slide-25.jpg)\

static method와 class method는 class-level 메소드라고도 부릅니다. 인스턴스를 생성하지 않고도 메소드를 호출할 수 있어서 그렇습니다. 

static method와 class method의 차이는 class method 예제를 보면 알 수 있습니다. 

class method의 예제를 보기 전에 먼저 classmethod()의 도움말을 보겠습니다.

    help(classmethod)
    Help on class classmethod in module __builtin__:

	class classmethod(object)
	 |  classmethod(function) -> method
	 |  
	 |  Convert a function to be a class method.
	 |  
	 |  A class method receives the class as implicit first argument,
	 |  just like an instance method receives the instance.
	 |  To declare a class method, use this idiom:
	 |  
	 |    class C:
	 |        def f(cls, arg1, arg2, ...): ...
	 |        f = classmethod(f)
	 |  
	 |  It can be called either on the class (e.g. C.f()) or on an instance
	 |  (e.g. C().f()).  The instance is ignored except for its class.
	 |  If a class method is called for a derived class, the derived class
	 |  object is passed as the implied first argument.
	 |  
	 |  Class methods are different than C++ or Java static methods.
	 |  If you want those, see the staticmethod builtin.
	 |  
	 |  Methods defined here:
	 |  
	 |  __get__(...)
	 |      descr.__get__(obj[, type]) -> value
	 |  
	 |  __getattribute__(...)
	 |      x.__getattribute__('name') <==> x.name
	 |  
	 |  __init__(...)
	 |      x.__init__(...) initializes x; see help(type(x)) for signature
	 |  
	 |  ----------------------------------------------------------------------
	 |  Data descriptors defined here:
	 |  
	 |  __func__
	 |  
	 |  ----------------------------------------------------------------------
	 |  Data and other attributes defined here:
	 |  
	 |  __new__ = <built-in method __new__ of type object>
	 |      T.__new__(S, ...) -> a new object with type S, a subtype of T

class method는 첫번째 인자로 **cls**라는 클래스 자체를 넣어주어야 합니다. [Class object](#class-object) 절에서 보셨듯이 **self**를 사용하는 것이 아닙니다. 

이제 class method의 예제를 보겠습니다.
**aclassmet** 메소드 함수가 **cls**를 인자로 정의되었습니다. 그런데 인스턴스의 **aclassmet**를 호출할 때나 클래스의 이름으로 **aclassmet**을 호출할 때나 인자로 cls를 넣어주지는 않습니다. 그래도 메소드에서 클래스의 이름을 읽어 올 수 있었습니다.

static method에서는 이렇게 할 수가 없습니다.[^4]

[^4]: 아니면 어쩌지?

