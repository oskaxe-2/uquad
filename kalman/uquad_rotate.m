function [out] = uquad_rotate(in,psi,phi,theta,from_inertial)

Rx = @(psi) [...
    1 0        0         ;
    0 cos(psi) -sin(psi) ;
    0 sin(psi) cos(psi) ...
    ];

Ry = @(phi) [...
    cos(phi)  0 sin(phi)   ;
    0         1     0      ;
    -sin(phi) 0 cos(phi) ...
    ];

Rz = @(theta) [...
    cos(theta) -sin(theta) 0 ;
    sin(theta) cos(theta)  0 ;
    0          0           1 ...
    ];

if from_inertial
    out = Rx(-psi)*Ry(-phi)*Rz(-theta)*in;
else
    out = Rz(theta)*Ry(phi)*Rx(psi)*in;
end