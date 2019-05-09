close all;
clear all;
% img1=imread('D1Tg HE 4 week.jpg');

% segmntImg=img1(:,:,1)>25&img1(:,:,2)<150&img1(:,:,3)<150;

img1=uint8(imread('ratSampleDay21.jpg'));
%img1=rgb2gray(img1);
img1 = imgaussfilt(img1,1);
figure;imshow(img1);

segmntImg=img1<150;
figure;imshow(segmntImg)
lbl=bwlabel(segmntImg);
for i=1:max(max(lbl))
    lblLn(i)=sum(sum(lbl==i));
end
[vl lc]=sort(lblLn);
bigOne=vl(end)
bigLc=lc(end)
imgNew=img1;
imgNew(:,:,1)=imgNew(:,:,1).*uint8((lbl==bigLc));
imgGray=imgNew;
figure;imshow(imgGray);
figure;imshow((imgGray>150));
totPix=sum(sum(imgGray>150));
mastImg=imgGray;
mastImgGray=imgaussfilt(histeq(imgGray),4);
h=figure;imshow(mastImgGray);hold on;
sz=size(mastImg);
cIM=mastImgGray;
himage = findobj('Type', 'image');
himage = imshow(cIM, []);
ctr=1;
oldsegmnt=zeros(sz);
while(1)
    [sedx sedy]=ginput(1);
    if isempty(sedx)==1
        break;
    end
 
        initPos(1) = round(axes2pix(size(cIM, 2), get(himage, 'XData'), sedy));
    initPos(2) = round(axes2pix(size(cIM, 1), get(himage, 'YData'), sedx));
    
     [dum segmnt]=regiongrowing(mastImgGray,initPos);
     plot(dum(:,1), dum(:,2), 'LineWidth', 2)
     polyn{ctr}=dum;
     oldsegmnt=oldsegmnt+segmnt;
     ctr=ctr+1;

end
