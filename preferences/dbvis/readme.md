1. 把lib/dbvis.jar里面的这个文件dbvis.puk替换掉(用WinRAR打开dbvis.jar即可替换)

```console
cd /Applications/DbVisualizer.app/Contents/java/app/lib
mv dbvis.jar dbvis.jar.bak
cp dbvis.jar.bak dbvis.zip
open .
# open with SmartZipper and replace dbvis.puk
mv dbvis.zip dbvis.jar
```

2. Help->License Key 导入dbvis.license
