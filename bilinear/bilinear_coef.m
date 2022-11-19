% Profeanu Ioana, 313CA
function a = bilinear_coef(f, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaza coeficientii a pentru interpolarea biliniara intre punctele
    % (x1, y1), (x1, y2), (x2, y1) si (x2, y2)
    % =========================================================================
    
    % calculeaza matricea A
     A = [1, x1, y1, x1 * y1;
          1, x1, y2, x1 * y2;
          1, x2, y1, x2 * y1;
          1, x2, y2, x2 * y2];

    % calculeaza vectorul b
    a0 = f(y1, x1);
    a1 = f(y2, x1);
    a2 = f(y1, x2);
    a3 = f(y2, x2);
    b = [a0; a1; a2; a3];
    
    % calculeaza coeficientii
    a = inv(A) * b;

endfunction
