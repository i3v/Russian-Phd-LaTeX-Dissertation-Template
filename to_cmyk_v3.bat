@echo off

REM Простейший способ преобразования в CMYK, не думая о цветовых профилях.
REM https://stackoverflow.com/a/8567524/1032586

gswin64c ^
   -dBATCH ^
   -dNOPAUSE ^
   -sDEVICE=pdfwrite ^
   -sProcessColorModel=DeviceCMYK ^
   -sColorConversionStrategy=CMYK ^
   -sColorConversionStrategyForImages=CMYK ^
    -sOutputFile=%1_gscc03.pdf ^
    %1.pdf
