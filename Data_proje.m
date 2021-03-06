close all
clear 
clc
[y,fs] = audioread('Data_proje.wav');%wav dosyas�n� matlab'e �ektim.
info = audioinfo('Data_proje.wav');%bunu info.duration� almak i�in yapmak gerekti.
t = 0:seconds(1/fs):seconds(info.Duration);%t yi ayarlad�m.
t = t(1:end-1);%t yi ayarlad�m.
level=0.11;%genli�imiz 0-1 aras�nda istedi�imiz seviyeyi ayarlayabiliyoruz.
q = quant(y,level);%istedi�imiz seviye ile quantize ediyoruz.
plot(t,y,'b');%modifiye olmayan orijinal ses sinyalimizi �izdiriyoruz.
title('Orijinal sinyal')
xlabel('Time')
ylabel('Audio Signal')
figure%modifiye yi farkl� tabloda g�rmek i�in
plot(t,q,'r')% modifiye edilmi� ses sinyali �izdiriyoruz.
title('Quantize edilmi� sinyal')
xlabel('Time')
ylabel('Audio Signal')
figure%modifiye edilmi� ve orijinal sinyali farkl� tabloda g�rmek i�in
plot(t,y,'b',t,q)%modifiye edilmi� ve orijinal sinyal bi arada
title('Orijinal ve quantize beraber')
xlabel('Time')
ylabel('Audio Signal')
sound(q,fs); %sesimizi dinliyoruz.
figure;%psd yi farkl� tabloda g�rmek i�in
subplot(2,1,1);(periodogram(y,rectwin(length(y)),length(y),fs))%psd
subplot(2,1,2);(periodogram(q,rectwin(length(q)),length(q),fs))%quantize psd

