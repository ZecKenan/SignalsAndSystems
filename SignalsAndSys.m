clc;
clear;
close all;

%just reading the data
A = importdata('6666666.dat');

%generating a matrix to convert the data into a proper sinogram format,
%i.e. angles x l
a=length(A)/101;
i=180/(a-1);
t=101;
ch_1_t=zeros(180,101);
ch_2_t=zeros(180,101);

%reading the data into the proper sinogram matrix we have generated
%for channel 1 17.8keV
for n=0:180
    if n>0 && n<a
        ch_1_t(round(n*i),:)=A(1+n*t:(n+1)*t,3);    
    end
end
ch_1=transpose(ch_1_t);
irad_ch_1=iradon(ch_1,0:179);
imagesc(irad_ch_1);

ch_1_HU=1000.*((ch_1-0.8)/0.8);
irad_ch_1_HU=iradon(ch_1_HU,0:179);

%for channel 2 59.5keV
for n=0:180
    if n>0 && n<a
        ch_2_t(round(n*i),:)=A(1+n*t:(n+1)*t,4);    
    end
end
ch_2=transpose(ch_2_t);
irad_ch_2=iradon(ch_2,0:179);

%converting into HU
ch_2_HU=1000.*((ch_2-0.205)/0.205);
irad_ch_2_HU=iradon(ch_2_HU,0:179,'None');


imagesc(irad_ch_2_HU);


