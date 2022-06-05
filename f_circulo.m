function [f_img] = f_circulo (p)
  % função que monta uma imagem a partir de uma função
  img = zeros(p, p, 3);
  f_img = "f_img.png";
  %dom_f = [0,1]x[0,1]
  %fmax = sqrt(2)/2
  %fmin = 0
  x0 = 0;
  y0 = 0;
  
  h = 1;
  d = h/(p-1);
  medio = 1/2;
  
  for i = 1:p
    for j = 1:p
      x = x0 + (i-1)*d;
      y = y0 + (j-1)*d;
      img(i,j,1) = ((sqrt((x-medio)*(x-medio) + (y-medio)*(y-medio) - 0)) / (sqrt(1+1)/2 - 0)) * 255;
      img(i,j,2) = ((sqrt((x-medio)*(x-medio) + (y-medio)*(y-medio) - 0)) / (sqrt(1+1)/2 - 0)) * 255;
      img(i,j,3) = ((sqrt((x-medio)*(x-medio) + (y-medio)*(y-m) - 0)) / (sqrt(1+1)/2 - 0)) * 255;
    endfor
  endfor
  
  %img
  img = uint8(img);
  imwrite (img, f_img);
  
endfunction