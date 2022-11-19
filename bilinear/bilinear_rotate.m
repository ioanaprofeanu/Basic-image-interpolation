% Profeanu Ioana, 313CA
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicand interpolare biliniara.
    % rotation_angle este exprimat in radiani.
    % =========================================================================
    
    [m n nr_colors] = size(I);
    
    % TODO: cast I la double
    I = double(I);

    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!

    % calculeaza cos si sin de rotation_angle
    cos_rotation_angle = cos(rotation_angle);
    sin_rotation_angle = sin(rotation_angle);

    % initializeaza matricea finala
    R = zeros(m, n);

    % calculeaza matricea de transformare
    T_rot = [cos_rotation_angle, - sin_rotation_angle; sin_rotation_angle, cos_rotation_angle];

    % calculeaza inversa transformarii
    inv_T_rot = inv(T_rot);

    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            X_1 = [x; y];
            X_0 = inv_T_rot * X_1;
            x_p = X_0(1, 1);
            y_p = X_0(2, 1);

            % trece x si y din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            new_x = x + 1;
            new_y = y + 1;

            % daca xp sau yp se afla in afara imaginii, pune un pixel
            % negru in imagine si treci mai departe
            if x_p < 0 || y_p < 0 || x_p > n - 1 || y_p > m - 1
                pixel = 0;
            else 
                % afla punctele ce inconjoara punctul (xp, yp)
                [x_1 y_1 x_2 y_2] = surrounding_points(n, m, x_p + 1, y_p + 1);
    
                % calculeaza coeficientii de interpolare a
                a = zeros(4, 1);
                a = bilinear_coef(I, x_1, y_1, x_2, y_2);

                % calculeaza valoarea interpolata a pixelului (x, y)
                % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
                % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
                f_xy = a(1, 1) + a(2, 1) * (x_p + 1) + a(3, 1) * (y_p + 1) ...
                       + a(4, 1) * (x_p + 1) * (y_p + 1);
                pixel = f_xy;
            endif
            R(new_y, new_x) = pixel;
            
        endfor
    endfor

    % transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R = uint8(R);

endfunction
