function venc = calcvenc2(G1,seqpar)

gamma = 42.576e6 * 2 * pi;      % Hz/T
GMax = 20559/42.576/1000;       % T/m  [hard coded]
DACMAX = 32767;                 % DAC
 
ts1 = seqpar.tref;              % us [Refocus time, from MRD file]
ts2 = 300;                      % us [hard coded]
tr = seqpar.tramp;              % us [Ramp time, from MRD file]
 
%
%                        _________ G2
%                       /         \
%                      /    A2     \
%                     /             \
% ---------------------------------------------------------------
%      \            /
%       \    A1    /
%     G1 \________/
%
%      tr    ts1   tr tr    ts2   tr
%
%

% gradient strength in T/m
G1 = G1.*(GMax/DACMAX);

% area A1 is equal to area A2
% thus G2 is equal to G1 * (ts1 + tr) / (ts2 + tr)
G2 = G1.*(ts1+tr)./(ts2+tr);  

% first order moment in units (T/m)*us^2 
m1 = -(G1./2)*(ts1^2) + (G2./2)*(2*ts1*ts2 + ts2^2);  

% convert from us^2 to sec^2
m1 = m1/1e12;

% Venc in cm/s
venc = 100./(2*gamma.*m1); 


end