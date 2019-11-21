function X = fft2reco(x)

% 2D FFT

X=fftshift(ifft(fftshift(x,1),[],1),1)*sqrt(size(x,1));
X=fftshift(ifft(fftshift(X,2),[],2),2)*sqrt(size(x,2));

end