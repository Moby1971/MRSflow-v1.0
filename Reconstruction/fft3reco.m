function X = fft3reco(x)

% 3D FFT

X=fftshift(ifft(fftshift(x,1),[],1),1)*sqrt(size(x,1));
X=fftshift(ifft(fftshift(X,2),[],2),2)*sqrt(size(x,2));
X=fftshift(ifft(fftshift(X,3),[],3),3)*sqrt(size(x,3));

end