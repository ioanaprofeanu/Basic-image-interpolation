% Profeanu Ioana, 313CA
function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % calculeaza derivata
    r = (f(y + 1, x) - f(y - 1 ,x)) / 2;

endfunction