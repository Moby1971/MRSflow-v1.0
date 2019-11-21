function venc = calcvenc(hspc1,seqpar)

gamma = 42.576e6 * 2 * pi;      % Hz/T
GMax = 20559/42.576/1000;       % T/m  [hard coded]
DACMAX = 32767;                 % DAC
 
ts1 = seqpar.tref;              % us [Refocus time, from MRD file]
ts2 = 300;                      % us [hard coded]
tramp = seqpar.tramp;           % us [Ramp time, from MRD file]
 
% VENC  calculation
hspc2 = hspc1.*(ts1+tramp)./(ts2+tramp);
m1 = -(hspc1./2)*(ts1.^2) + (hspc2/2)*(2*ts1*ts2 + ts2.^2); % [DAC*us^2]

% convert to SI units; 1e12 is from us^2 to sec^2
m1 = m1*(GMax/DACMAX)/1e12; % [T/m*sec^2]
 
venc = 100*(1/(2*gamma))./m1; % [cm/sec]

venc = venc/(2*pi);   % Needs to be checked 

end