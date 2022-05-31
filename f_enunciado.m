function [f_img] = f_enunciado (p)
  % função que monta uma imagem a partir de uma função
  img = zeros(p, p, 3);
  f_img = "f_img.png";
  
  for x = 1:p
    for y = 1:p
      img(x,y,1) = sin(x);
      img(x,y,2) = (sin(y) + sin(x)) / 2;
      img(x,y,3) = sin(x);
    endfor
  endfor
  
  imwrite (img, f_img, "Quality", 100);
  
endfunction