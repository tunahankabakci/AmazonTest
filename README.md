# **Amazon Test Example**

## Prerequisites
```
Python 3.x.x
robotframework
robotframework-seleniumlibrary
Chrome Web Driver (lower version from installed Chrome)
```


## Installing
1. Install &nbsp;[python 3.x.x](https://www.python.org/downloads/)

 

2. In command prompt
    ```
    pip install robotframework
    pip install robotframework-seleniumlibrary
    ```
  
3. Download &nbsp;[Chrome Web Driver](https://chromedriver.storage.googleapis.com/index.html)
&nbsp;and add environment variable path 


## Usage
#### To run a single test file:
```
robot -d reports ./Tests/<FileName.robot>
```

#### To run a single test case
```
robot -d reports -t <Test Case Name> ./Tests/<FileName.robot>
```

#### To run all test cases under "Tests" folder
```
robot -d reports ./Tests/*
```

