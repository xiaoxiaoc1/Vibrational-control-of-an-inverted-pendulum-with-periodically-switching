function [ a ] = vib_amplitude( t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
T = ParametersSheet( 'T' );
t_un     = ParametersSheet( 't_un' );
t
if (mod(t,T)<(T-t_un))
    a = 10;
else
    a = 0;
end

end

