clc
close all
%% I.1)
f=100;
w=2*pi*f;
fs=5000;
t = 0:1/fs:0.1-1/fs;
x1=sin(w*t);
x2=cos(w*t);
%señales x1(t) x2(t)
subplot(2,1,1)
plot(t,x1)
ylabel("amplitud")
xlabel("tiempo (s)")
title("Señal x_1(t)")
grid on
subplot(2,1,2)
plot(t,x2)
ylabel("amplitud")
xlabel("tiempo (s)")
title("Señal x_2(t)")
grid on

%% calculo de FFT (X1(w), X2(w))
N = 4096;
X1 = fft(x1,N);
X2 = fft(x2,N);

w = -pi:2*pi/N:pi-2*pi/fs;
fa = -fs/2:fs/N:fs/2-fs/N;
fb = 0:fs/N:fs-fs/N;

subplot(2,1,1)
plot(fa,20*log10(abs(fftshift(X1))))
axis([-fs/2 fs/2 -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Hz")
title("Magnitud del espectro de X_1(w) N=4096")
grid on
subplot(2,1,2)
plot(fb,20*log10(abs((X1))));
ylabel("Magnitud dB")
xlabel("Frecuencia Hz")
title("Magnitud del espectro de X_1(w) N=4096")
axis([0 fs -30 60])
grid on
%% 
subplot(2,1,1)
plot(fa,20*log10(abs(fftshift(X2))))
axis([-fs/2 fs/2 -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Hz")
title("Magnitud del espectro de X_2(w) N=4096")
grid on
subplot(2,1,2)
plot(fb,20*log10(abs((X2))));
ylabel("Magnitud dB")
xlabel("Frecuencia Hz")
title("Magnitud del espectro de X_2(w) N=4096")
axis([0 fs -30 60])
grid on
%% I.2)
N2=256;
N3=500;
N4=2048;

w2 = -pi:2*pi/N2:pi-2*pi/fs;
w3 = -pi:2*pi/N3:pi-2*pi/fs;
w4 = -pi:2*pi/N4:pi-2*pi/fs;

X12 = fft(x1,N2);
X13 = fft(x1,N3);
X14 = fft(x1,N4);

X22 = fft(x2,N2);
X23 = fft(x2,N3);
X24 = fft(x2,N4);

%% Espectro X1(w) para distintos largos N

subplot(3,2,1)
plot(w2,20*log10(abs(fftshift(X12))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_1(w) N=256")
grid on
subplot(3,2,3)
plot(w3,20*log10(abs(fftshift(X13))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_1(w) N=500")
grid on
subplot(3,2,5)
plot(w4,20*log10(abs(fftshift(X14))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_1(w) N=2048")
grid on

subplot(3,2,2)
yyaxis left
plot(w2,real(fftshift(X12)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w2,imag(fftshift(X12)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=256")
grid on

subplot(3,2,4)
yyaxis left
plot(w3,real(fftshift(X13)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w3,imag(fftshift(X13)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=500")
grid on

subplot(3,2,6)
yyaxis left
plot(w4,real(fftshift(X14)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w4,imag(fftshift(X14)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=2048")
grid on

%% Espectro X2(w) para distintos largos N

subplot(3,2,1)
plot(w2,20*log10(abs(fftshift(X22))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_2(w) N=256")
grid on
subplot(3,2,3)
plot(w3,20*log10(abs(fftshift(X23))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_2(w) N=500")
grid on
subplot(3,2,5)
plot(w4,20*log10(abs(fftshift(X24))))
axis([-pi pi -30 60])
ylabel("Magnitud dB")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Magnitud del espectro de X_2(w) N=2048")
grid on

subplot(3,2,2)
yyaxis left
plot(w2,real(fftshift(X22)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w2,imag(fftshift(X22)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_2(w) N=256")
grid on

subplot(3,2,4)
yyaxis left
plot(w3,real(fftshift(X23)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w3,imag(fftshift(X23)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_2(w) N=500")
grid on

subplot(3,2,6)
yyaxis left
plot(w4,real(fftshift(X24)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w4,imag(fftshift(X14)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_2(w) N=2048")
grid on

%% Re|Im X1(w)

subplot(3,1,1)
yyaxis left
plot(w2,real(fftshift(X12)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w2,imag(fftshift(X12)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=256")

subplot(3,1,2)
yyaxis left
plot(w3,real(fftshift(X13)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w3,imag(fftshift(X13)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=500")

subplot(3,1,3)
yyaxis left
plot(w4,real(fftshift(X14)))
axis([-pi pi -30 60])
ylabel("Parte Real")
yyaxis right
plot(w4,imag(fftshift(X14)))
axis([-pi pi -30 60])
ylabel("Parte Imaginaria")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Espectro de X_1(w) N=2048")

%% Re|Im X2(w)

figure()
subplot(3,2,1)
plot(w2,real(fftshift(X22)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Parte real de X_2(w) N=256")
subplot(3,2,2)
plot(w2,imag(fftshift(X22)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Parte imaginaria de X_2(w) N=256")
subplot(3,2,3)
plot(w3,real(fftshift(X23)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada (rad/muestra)")
title("Parte real de X_2(w) N=500")
subplot(3,2,4)
plot(w3,imag(fftshift(X23)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada rad/muestra")
title("Parte imaginaria de X_2(w) N=500")
subplot(3,2,5)
plot(w4,real(fftshift(X24)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada rad/muestra")
title("Parte real de X_2(w) N=2048")
subplot(3,2,6)
plot(w4,imag(fftshift(X24)))
axis([-pi pi -30 60])
ylabel("Magnitud")
xlabel("Frecuencia Normalizada rad/muestra")
title("Parte imaginaria de X_2(w) N=2048")


%% IV.1)

N = 8;
n = 1:N;
x = ones(1,N);
%x=cos(2*pi*n/N)-sqrt(-1)*sin(2*pi*n/N);
t=0:0.5/N:0.5-0.5/N;
figure()
plot(t,x)
X = DFTsum(x);
w = 0:2*pi/N:2*pi-2*pi/N;
figure()
stem(w,abs(X))
X2 = fft(x);
figure()
stem(w,abs(X2))
%%
function X = DFTsum(x)
    N = 8;
    X = zeros(size(N));
    for k=1:N
        XK = 0;
        for n=1:N
            theta = 2*pi*k*n/N;
            XK= XK + x(n)*(cos(theta)-sqrt(-1)*sin(theta));
        end
        X(k) = XK;

    end
end