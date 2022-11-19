% Profeanu Ioana, 313CA
function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % extrage canalul rosu al imaginii
    red_points = img(:,:,1);
    
    % extrage canalul verde al imaginii
    green_points = img(:,:,2);
    
    % extrage canalul albastru al imaginii
    blue_points = img(:,:,3);


    % aplica rotatia pe fiecare canal al imaginii
    red_matrix = bilinear_rotate(red_points, rotation_angle);
    green_matrix = bilinear_rotate(green_points, rotation_angle);
    blue_matrix = bilinear_rotate(blue_points, rotation_angle);

    % reconstruieste imaginea RGB finala (hint: cat)
    out = cat(3, red_matrix, green_matrix, blue_matrix);

endfunction