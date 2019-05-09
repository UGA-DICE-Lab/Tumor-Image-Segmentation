clc;
clear all;
close all;
mastImg1=imread('test11.bmp');
mastImg2=imread('test21.bmp');
mastImg3=imread('test31.bmp');
szIm=size(mastImg1);
gridX=1:szIm(1);
gridY=1:szIm(2);
gridZ=1:9;
wrtDble(:,:,1)=mastImg1==0;
wrtDble(:,:,2)=mastImg1==0;
wrtDble(:,:,3)=mastImg1==0;
wrtDble(:,:,4)=mastImg2==0;
wrtDble(:,:,5)=mastImg2==0;
wrtDble(:,:,6)=mastImg2==0;
wrtDble(:,:,7)=mastImg3==0;
wrtDble(:,:,8)=mastImg3==0;
wrtDble(:,:,9)=mastImg3==0;







  writeFileName=strcat('Block348_stlFile_addedThickness_P2.stl');


    
    [faces,vertices] = CONVERT_voxels_to_stl(writeFileName,~wrtDble,gridX,gridY,gridZ,'ascii');


    