@echo off

REM С указание профилей, и переводом в ICCBasedRGB+ICCBasedCMYK.
REM Изображения после преобразования цвета сжимаются без потерь https://superuser.com/a/373740/135260 , https://stackoverflow.com/a/11095541/1032586
REM -dSAFER здесь вызывает глюки

gswin64c ^
   -dBATCH ^
   -dNOPAUSE ^
   -sDEVICE=pdfwrite ^
   -dPDFSETTINGS=/prepress ^
   ^
   -dHaveTransparency=false ^
   -sProcessColorModel=DeviceCMYK ^
   -sColorConversionStrategy=UseDeviceIndependentColor ^
   -sColorConversionStrategyForImages=UseDeviceIndependentColorForImages ^
   -sDefaultCMYKProfile="RSWOP.icm" ^
   -sDefaultRGBProfile="sRGB Color Space Profile.icm" ^
   -sOutputICCProfile="UncoatedFOGRA29.icc" ^
   -dRenderIntent=3     ^
   -dDeviceGrayToK=true ^
   ^
   -dAutoFilterMonoImages=false ^
   -dAutoFilterGrayImages=false ^
   -dAutoFilterColorImages=false ^
   -dDownsampleMonoImages=false ^
   -dDownsampleGrayImages=false ^
   -dDownsampleColorImages=false ^
   -dAntiAliasColorImages=false ^
   -dAntiAliasGrayImages=false ^
   -dAntiAliasMonoImages=false ^
   -dConvertImagesToIndexed=false ^
   -dColorImageFilter=/FlateEncode ^
   -dGrayImageFilter=/FlateEncode ^
   -dMonoImageFilter=/FlateEncode ^
   ^
   -dEmbedAllFonts=true ^
   -dMaxSubsetPct=100 ^
   -dSubsetFonts=true ^
   -sOutputFile=%1_gscc11.pdf ^
    %1.pdf
