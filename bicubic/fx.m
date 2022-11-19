% Profeanu Ioana, 313CA
function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
    % =========================================================================

    % calculeaza derivata
    r = (f(y, x + 1) - f(y, x - 1)) / 2;

endfunction