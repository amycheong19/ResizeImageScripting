# ResizeImageScripting
Having trouble to have transparent PNGs background to maintain its dimension?
This script is used to resize images and maintain their dimensions. 


## To use in Terminal
### Parameters:
* PathToExec: Path of Exec build of project (Look for it under Products folder)
* FromFolderPath: Folder's path that comprises images that need to be converted
* ToFolderPath: Empty folder's path from <FromFolderPath>  
* Width: Width pixel that which to be converted (Default: 240)
* Height: Height pixel that which to be converted (Default: 240)

```
<PathToExecBuild> <FromFolderPath> <ToFolderPath> <Width> <Height>
```

 **For example:**
 
```
/Users/YourUserNameInCom/Library/Developer/Xcode/DerivedData/IconResize-eojvfmtuqolzkycvyrqbafjcqv/Build/Products/Debug/IconResize 
/Users/YourUserNameInCom/Desktop/Resized/from 
/Users/YourUserNameInCom/Desktop/Resized/to 
512
512
```
